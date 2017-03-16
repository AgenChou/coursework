from nltk.tokenize import TweetTokenizer
# from stemming.porter2 import stem
import re

# readTwitsA returns a list of lists for all twitter data for Part B, using whitespace to separate

def readTwitsA(filename):

    tsvin = open(filename)
    twits = []
    for row in tsvin:

        splitrow = row.split(None, 5)
        # Make a list for each line, containing the start and end indices, the sentiment and the twit.
        list = []

        start = int(splitrow[2])
        end = int(splitrow[3])
        sentiment = str(splitrow[4])
        twit = str(splitrow[5])

        list.append(start)
        list.append(end)
        list.append(sentiment)
        list.append(twit)

        twits.append(list)

    return twits

# readTwitsB returns a list of lists for all twitter data for Part B, using whitespace to separate

def readTwitsB(filename):
    tsvin = open(filename)
    twits = []
    for row in tsvin:
        splitrow = row.split(None, 3)
        # Make a list for each line, containing the start and end indices, the sentiment and the twit.
        list = []

        sentiment = str(splitrow[2])
        twit = str(splitrow[3])

        list.append(sentiment)
        list.append(twit)

        twits.append(list)

    return twits

# Use index to separate the tweets for Part A and to tokenize both the resulting "phrase" and the overall tweet.
def sepTokA(twits):
    Tw = TweetTokenizer()
    for list in twits:
        start = list[0]
        end = list[1]
        sent = list[2]
        tweet = list[3]

        phrase = tweet.split()
        phrase = phrase[start:end+1]
        phrase = " ".join(phrase)

        tokPhrase = Tw.tokenize(phrase)
        tweetTok = Tw.tokenize(tweet)

        tokNeg = negate(tokPhrase)
        tweetNeg = negate(tweetTok)
        del list[0]
        del list[0]
        del list[1]
        list.append(tokNeg)

    return twits

# Seperates and tokenizes for Part B of the project
def sepTokB(twits):
    Tw = TweetTokenizer()
    for list in twits:

        tweet = list[1]
        whitetweet = tweet.split()
        whitetweet = " ".join(whitetweet)
        tweetTok = Tw.tokenize(whitetweet)
        tweetNeg = negate(tweetTok)
        del list[1] # Delete the original string
        list.append(tweetNeg)

    return twits

# Input is a list of lists of tokenized tweets and the sentiment, output is a list of tokenizations with stemming completed
# However, the tokens become messy when stemming is applied. Hence we decided to not use stemming.
# def stemA(twits):
#     for list in twits:
#         # Do for phrases
#         for index, word in enumerate(list[1]):
#             list[1][index] = stem(word)
#         # Do for full tweet
#         for index, word in enumerate(list[2]):
#             list[2][index] = stem(word)
#     return twits
#
# def stemB(twits):
#     for list in twits:
#         # Do for whole tweet
#         for index, word in enumerate(list[1]):
#             list[1][index] = stem(word)
#
#     return twits

# This function reads tokenizes and stems the input data for part A into a list of lists.
# [ [sentiment, [phrase list], [tweet list] ] , .... ]
def preprocA(filename):
    read = readTwitsA(filename)
    tok = sepTokA(read)
 #   stem = stemA(tok)
    return tok

def preprocB(filename):
    read = readTwitsB(filename)
    tok = sepTokB(read)
#   stem = stemB(tok)
    return tok

# The function takes a tweet as an input and negates the phrase following "not", "don't", "isn't", etc.

import re
def negate(tweet):
    regex_negation = "^(not)|[a-zA-Z]+n't$" # picks "not" or "XXXn't"
    regex_endphrase = "^([a-zA-Z]+[,.:;\?\!\)\-\(])" # picks a word with a punctuation mark at the end
    regex_exception = "^(but|(\W.*)|(http:.*))$"
    for word in tweet:
        match_negation = re.match(regex_negation, word)
        if match_negation:
            for following_word in tweet[tweet.index(word)+1:]:
                match_exception = re.match(regex_exception, following_word)
                if match_exception:
                    break
                tweet[tweet.index(following_word)] = "NOT_" + following_word
                match_endphrase = re.match(regex_endphrase, following_word)
                if match_endphrase:
                    break
    return tweet
