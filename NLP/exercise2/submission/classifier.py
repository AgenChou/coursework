from collections import Counter
from sklearn.metrics import f1_score
import neeraj_pre
import csv

def count(list):
    ## the indexes is based on our tokenization
    ## ['sentiment',[tokens for target tweet]]
    a=len(list)
    count={}

    # Iterate over the each token in each phrase in the list. Add to the dictionary of sentiment counters.

    for i in range(0,a):
        b = len(list[i][1])
        if list[i][0]=='positive':
            for j in range(0,b):
                if list[i][1][j] not in count:
                    count[list[i][1][j]]=[1,0,0]
                else:
                    count[list[i][1][j]][0] = count[list[i][1][j]][0]+1
        if list[i][0]=='neutral':
            for j in range(0,b):
                if list[i][1][j] not in count:
                    count[list[i][1][j]]=[0,1,0]
                else:
                    count[list[i][1][j]][1] = count[list[i][1][j]][1]+1
        if list[i][0]=='negative':
            for j in range(0,b):
                if list[i][1][j] not in count:
                    count[list[i][1][j]]=[0,0,1]
                else:
                    count[list[i][1][j]][2] = count[list[i][1][j]][2]+1
    return count





def weight(dict):
    # Calculates a weight for each word and adds to a new dictionary. Deals with negation by flipping the signs of the weights
    # in all NOT cases and then adding these to the dictionary of non-NOT words.
    weight_dict={}
    for word in dict:
        if float(dict[word][0]+dict[word][2])!=0:
            weight_dict[word]=(float(dict[word][0]-dict[word][2]))/(float(dict[word][0]+dict[word][2]))
        else:
            weight_dict[word]=0
    weight_for_not = {}
    weight_without_not = {}
    for word in weight_dict:
        if word[:4] == "NOT_":
            ## if the word contain not then change the order of value
            weight_for_not[word[4:]] = -weight_dict[word]
        else:
            ## if the word dont contain not then dont do anything
            weight_without_not[word] = weight_dict[word]
    weight_without_not.update(weight_for_not)
    return weight_without_not


def resultA(parameter):
    ## input parameter: the threshold of weight for a word to be classified as positive or negative
    ## for multiword phrase, we will calculate the weight of phrase by adding all of the weight together
    ## and devides by the lenth of the phrase
    ## followed by using threshold to classify the sentiment of the phrase
    ## the output will be the score obtained using f1_score to compare actual sentiment and predicted sentiment
    listoftwits=neeraj_pre.preprocA("Exercise2_data/twitter-train-cleansed-A.tsv")
    countA=count(listoftwits)
    weightA=weight(countA)
    devlist=neeraj_pre.preprocA("Exercise2_data/twitter-dev-gold-A.tsv")
    predicted_weight=[0 for k in range(len(devlist))]
    for i in range(0,len(devlist)):
        for j in range(0,len(devlist[i][1])):
            if devlist[i][1][j][:4]=="NOT_" and devlist[i][1][j][4:] in weightA:
                predicted_weight[i]=predicted_weight[i]-weightA[devlist[i][1][j][4:]]
            if devlist[i][1][j][:4]!="NOT_" and devlist[i][1][j] in weightA:
                predicted_weight[i] = predicted_weight[i]+weightA[devlist[i][1][j]]
            predicted_weight[i] /= len(devlist[i][1])
    predicted_sentiment=['' for k in range(len(devlist))]
    for i in range(len(devlist)):
        if predicted_weight[i]>parameter:
            predicted_sentiment[i]='positive'
        if predicted_weight[i]<=parameter and predicted_weight[i]>=-parameter:
            predicted_sentiment[i]='neutral'
        if predicted_weight[i]<-parameter:
            predicted_sentiment[i] = 'negative'
    acutal_sentiment=['' for k in range(len(devlist))]
    for i in range(len(devlist)):
        acutal_sentiment[i]=devlist[i][0]
    score=f1_score(acutal_sentiment, predicted_sentiment, labels=['positive', 'negative'], average="macro")
    return score
print('the f1_score of this model trained on twitter-train-cleansed-A.tsv tested on twitter-dev-gold-A.tsv with parameter 0 for partA is  :' )
print(resultA(0))
print('the f1_score of this model trained on twitter-train-cleansed-A.tsv tested on twitter-dev-gold-A.tsv with parameter 0.02 for partA is  :' )
print(resultA(0.02))
print('the f1_score of this model trained on twitter-train-cleansed-A.tsv tested on twitter-dev-gold-A.tsv with parameter 0.04 for partA is  :' )
print(resultA(0.04))
print('the f1_score of this model trained on twitter-train-cleansed-A.tsv tested on twitter-dev-gold-A.tsv with parameter 0.06 for partA is  :' )
print(resultA(0.06))
print('the f1_score of this model trained on twitter-train-cleansed-A.tsv tested on twitter-dev-gold-A.tsv with parameter 0.08 for partA is  :' )
print(resultA(0.08))
print('the f1_score of this model trained on twitter-train-cleansed-A.tsv tested on twitter-dev-gold-A.tsv with parameter 0.1 for partA is  :' )
print(resultA(0.1))

def resultB(parameter):
    ## samilar as resultA but this is for partB
    listoftwits=neeraj_pre.preprocB("Exercise2_data/twitter-train-cleansed-B.tsv")
    countB=count(listoftwits)
    weightB=weight(countB)
    devlist=neeraj_pre.preprocB("Exercise2_data/twitter-dev-gold-B.tsv")
    predicted_weight=[0 for k in range(len(devlist))]
    for i in range(0,len(devlist)):
        for j in range(0,len(devlist[i][1])):
            if devlist[i][1][j][:4]=="NOT_" and devlist[i][1][j][4:] in weightB:
                predicted_weight[i]=predicted_weight[i]-weightB[devlist[i][1][j][4:]]
            if devlist[i][1][j][:4]!="NOT_" and devlist[i][1][j] in weightB:
                predicted_weight[i] = predicted_weight[i]+weightB[devlist[i][1][j]]
            predicted_weight[i] /= len(devlist[i][1])
    predicted_sentiment=['' for k in range(len(devlist))]
    for i in range(len(devlist)):
        if predicted_weight[i]>parameter:
            predicted_sentiment[i]='positive'
        if predicted_weight[i]<=parameter and predicted_weight[i]>=-parameter:
            predicted_sentiment[i]='neutral'
        if predicted_weight[i]<-parameter:
            predicted_sentiment[i] = 'negative'
    acutal_sentiment=['' for k in range(len(devlist))]
    for i in range(len(devlist)):
        acutal_sentiment[i]=devlist[i][0]
    score=f1_score(acutal_sentiment, predicted_sentiment, labels=['positive', 'negative'], average="macro")
    return score
## the weight for resultB is really small for we use parameter that closer to 0
print('the f1_score of this model trained on twitter-train-cleansed-B.tsv tested on twitter-dev-gold-B.tsv with parameter 0 for partB is  :' )
print(resultB(0))
print('the f1_score of this model trained on twitter-train-cleansed-B.tsv tested on twitter-dev-gold-B.tsv with parameter 0.01 for partB is  :' )
print(resultB(0.01))
print('the f1_score of this model trained on twitter-train-cleansed-B.tsv tested on twitter-dev-gold-B.tsv with parameter 0.02 for partB is  :' )
print(resultB(0.02))
print('the f1_score of this model trained on twitter-train-cleansed-B.tsv tested on twitter-dev-gold-B.tsv with parameter 0.04 for partB is  :' )
print(resultB(0.04))
print('the f1_score of this model trained on twitter-train-cleansed-B.tsv tested on twitter-dev-gold-B.tsv with parameter 0.06 for partB is  :' )
print(resultB(0.06))
print('the f1_score of this model trained on twitter-train-cleansed-B.tsv tested on twitter-dev-gold-B.tsv with parameter 0.08 for partB is  :' )
print(resultB(0.08))
print('the f1_score of this model trained on twitter-train-cleansed-B.tsv tested on twitter-dev-gold-B.tsv with parameter 0.1 for partB is  :' )
print(resultB(0.1))

def readidA(filename):
## obtain the ids for input file
    tsvin = open(filename)
    ids = []
    for row in tsvin:
        splitrow = row.split(None, 5)
        # Make a list for each line, containing the start and end indices, the sentiment and the twit.
        id = int(splitrow[0])
        ids.append(id)
    return ids


def testA_final(parameter):
    ## similar as resultA but the output will be sentiment classification on twitter-test-A and their corresponding ID
    listoftwits = neeraj_pre.preprocA("Exercise2_data/twitter-train-cleansed-A.tsv")
    countA = count(listoftwits)
    weightA = weight(countA)
    testlist = neeraj_pre.preprocA("Exercise2_data/twitter-test-A.tsv")
    predicted_weight = [0 for k in range(len(testlist))]
    for i in range(0, len(testlist)):
        for j in range(0, len(testlist[i][1])):
            if testlist[i][1][j][:4] == "NOT_" and testlist[i][1][j][4:] in weightA:
                predicted_weight[i] = predicted_weight[i] - weightA[testlist[i][1][j][4:]]
            if testlist[i][1][j][:4] != "NOT_" and testlist[i][1][j] in weightA:
                predicted_weight[i] = predicted_weight[i] + weightA[testlist[i][1][j]]
            predicted_weight[i] /= len(testlist[i][1])
    predicted_sentiment = ['' for k in range(len(testlist))]
    predict_sentiment_with_id = []
    ids=readidA("Exercise2_data/twitter-test-A.tsv")
    for i in range(len(testlist)):
        if predicted_weight[i] > parameter:
            predicted_sentiment[i] = 'positive'
        if predicted_weight[i] <= parameter and predicted_weight[i] >= -parameter:
            predicted_sentiment[i] = 'neutral'
        if predicted_weight[i] < -parameter:
            predicted_sentiment[i] = 'negative'
        predict_sentiment_with_id.append([ids[i],predicted_sentiment[i]])
    return predict_sentiment_with_id
print('the sentiment classification for twitter-test-A.tsv trained on twitter-train-cleansed-A.tsv with parameter=0 with the corresponding id as follow:')
print(testA_final(0))
## this will output testB_final(0) as csv file
with open('PartAresult.csv', 'w') as csvfile:
    writer = csv.writer(csvfile, delimiter=' ')
    for tweet in testA_final(0):
        writer.writerow(tweet)

def testB_final(parameter):
    listoftwits = neeraj_pre.preprocB("Exercise2_data/twitter-train-cleansed-B.tsv")
    countB = count(listoftwits)
    weightB = weight(countB)
    testlist = neeraj_pre.preprocB("Exercise2_data/twitter-test-B.tsv")
    predicted_weight = [0 for k in range(len(testlist))]
    for i in range(0, len(testlist)):
        for j in range(0, len(testlist[i][1])):
            if testlist[i][1][j][:4] == "NOT_" and testlist[i][1][j][4:] in weightB:
                predicted_weight[i] = predicted_weight[i] - weightB[testlist[i][1][j][4:]]
            if testlist[i][1][j][:4] != "NOT_" and testlist[i][1][j] in weightB:
                predicted_weight[i] = predicted_weight[i] + weightB[testlist[i][1][j]]
            predicted_weight[i] /= len(testlist[i][1])
    predicted_sentiment = ['' for k in range(len(testlist))]
    predict_sentiment_with_id = []
    ids=readidA("Exercise2_data/twitter-test-B.tsv")
    for i in range(len(testlist)):
        if predicted_weight[i] > parameter:
            predicted_sentiment[i] = 'positive'
        if predicted_weight[i] <= parameter and predicted_weight[i] >= -parameter:
            predicted_sentiment[i] = 'neutral'
        if predicted_weight[i] < -parameter:
            predicted_sentiment[i] = 'negative'
        predict_sentiment_with_id.append([ids[i],predicted_sentiment[i]])
    return predict_sentiment_with_id
print('the sentiment classification for twitter-test-B.tsv trained on twitter-train-cleansed-B.tsv with parameter=0 with corresponding id as follow:')
print(testB_final(0))
## this will output testB_final(0) as csv file
with open('PartBresult.csv', 'w') as csvfile:
    writer = csv.writer(csvfile, delimiter=' ')
    for tweet in testB_final(0):
        writer.writerow(tweet)
