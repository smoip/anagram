# Anagram

Simple anagram word game using Rails and Vue.js.

## Usage

To start the webserver:
- from `/home/ubuntu`
- run `sh startup.sh`

## Gameplay

The purpose of the game is to guess angrams (or an anagram subset) from the randomly chosen word.

Correct guesses increase score by the number of letters in the guess and incorrect guesses decrease it.

Clicking 'new round' resets the score and fetches a new word.

> NOTE: the text input does not accept capital letters or line breaks at the moment

## Design Notes

*Language/Framework:* 
I'd like to say that I chose Rails because it's so quick to protoype in and relatively straightforward to deploy, but honestly it's largely because it's the framework I've had the most experience with. The main drawback is all the extra junk you get with Rails (I didn't spend much time pruning, so there's quite a bit in here).

Admittedly, I haven't done a lot of front-end development, but I like Vue.js for its modularity.

*Datastore:* Postgres may be a little overkill for my needs here, but I wanted a relational database to leverage indexing when searching through lots of permutations of words. A nice improvement (which I didn't have time for) would be adding a join table where words can be linked to their precalculated anagrams.

*Preloading Data:* the most interesting problem to solve was determing what is and is not a valid word. My first thought was to start with a small number of preloaded words and reach out to a dictionary API to determine if a given possible permutation is a valid word, save the result to the DB, and gradually teach the app more words. However even with a fairly short word the number of API calls grows pretty quickly (n!), and I couldn't find a (free, functional) dictionary API with a bulk lookup endpoint.  I ended up preloading sets of known anagrams.  A longer-term solution would probably be purchasing a bulk data dump from someone's API.
