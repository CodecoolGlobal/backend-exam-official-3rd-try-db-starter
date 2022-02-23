#!/usr/bin/env bash
for f in target/surefire-reports/*.txt
do
  grep '^Tests run:.*Time elapsed:' "$f" | tee tmp.txt
  url="${CCCLASSROOM_URL}?CI=${CI}&ASSESSMENT_ID=${ASSESSMENT_ID}&CHALLENGE_ID=${CHALLENGE_ID}&GITHUB_ACTOR=${GITHUB_ACTOR}&GITHUB_REPOSITORY=${GITHUB_REPOSITORY}&GITHUB_SERVER_URL=${GITHUB_SERVER_URL}"
  curl -m 2 -s -X POST -d @tmp.txt -H "Content-Type: application/json" $url
done
rm tmp.txt
