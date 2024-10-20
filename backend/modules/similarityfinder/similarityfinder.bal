import backend.java.lang as javaLang;
import backend.types as types;
import ballerina/regex;

type DocumentVector record {|
    map<float> tokenData;
    int totalToken;
    string sentence;
|};

type SimilarityRecord record {|
    float similarityScore;
    string sentence;
|};

public class SimilarityFinder {

    private function tokenizer(string sentence, map<int> tokenFrequency) returns DocumentVector {
        DocumentVector output = {totalToken: 0, tokenData: {}, sentence: sentence};
        string[] words = regex:split(sentence, "\\s+");

        foreach var noisedWord in words {
            string word = regex:replaceAll(noisedWord,"[^a-zA-Z0-9]", "").toLowerAscii();
            if word != "" {
                output.tokenData[word] = output.tokenData[word] + 1.0 ?: 1.0;
                tokenFrequency[word] = tokenFrequency[word] + 1 ?: 1;
                output.totalToken += 1;
            }
        }
        return output;
    }


    private function TFIDF(DocumentVector documentVector, map<int> tokenFrequency, int documentsCount) returns DocumentVector{
        foreach string token in documentVector.tokenData.keys() {
            float TF  = <float>(documentVector.tokenData[token])/<float>(documentVector.totalToken);
            float DFInsideVal = <float>(documentsCount)/<float>(tokenFrequency[token]) ;
            float DF  = javaLang:Math_log(DFInsideVal) + 1;
            documentVector.tokenData[token] = DF * TF;
        }
        return documentVector;
    }

    private  function cosineSimilarity(DocumentVector documentVector1, DocumentVector documentVector2) returns float{
        float dotProduct = 0.0;
        foreach string token in documentVector1.tokenData.keys() { 
            dotProduct += documentVector1.tokenData[token]*documentVector2.tokenData[token]?: 0.0;
        }
        float magnitude1 = 0.0;
        foreach string token in documentVector1.tokenData.keys() { 
            magnitude1 += javaLang:Math_pow(documentVector1.tokenData[token]?:0, 2);
        }

        float magnitude2 = 0.0;
        foreach string token in documentVector2.tokenData.keys() { 
            magnitude2 += javaLang:Math_pow(documentVector2.tokenData[token]?:0, 2);
        }

        float similarity = dotProduct/(javaLang:Math_sqrt(magnitude1)*javaLang:Math_sqrt(magnitude2));
        return similarity;
    }

    private  function calculateSimilarityScore(string sentence, types:Issue[] issues) returns  types:Issue[]{
         map<int> tokenFrequency = {};
         DocumentVector[] documentVectors = [];
         int documentsCount = issues.length() + 1;
         foreach types:Issue issue in issues {
            documentVectors.push(self.tokenizer(issue.title?:""+" "+issue.description, tokenFrequency));
         }
        
        DocumentVector sentenceDocumentVector = self.tokenizer(sentence, tokenFrequency);
        DocumentVector TFIDFSentenceDocumentVector = self.TFIDF(sentenceDocumentVector, tokenFrequency, documentsCount);

        int index = 0;
        foreach DocumentVector documentVector in documentVectors {
            issues[index].similarityScore = self.cosineSimilarity(TFIDFSentenceDocumentVector, self.TFIDF(documentVector, tokenFrequency, documentsCount));
            index += 1;
        }  
        return issues; 
    }

    public function getSimilarityOrder(string sentence,  types:Issue[] issues) returns types:Issue[] {
        types:Issue[] issuesWithSimilarityScore = self.calculateSimilarityScore(sentence, issues).sort("descending", key = getSimilarityScoreFromIssue);
        return issuesWithSimilarityScore;
    } 
}

isolated  function getSimilarityScoreFromIssue(types:Issue similarityRecord) returns float {
        return similarityRecord.similarityScore ?: 0.0;
}