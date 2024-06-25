#!/bin/bash

manage_quiz() {
    case "$1" in
        "upload")
            # Mentor uploads question paper
            mentees=$(cut -f 1 -d ' ' allocatedMentees.txt)
            for name in $mentees; do
    		cp "$3" /home/core/mentees/$name/question_papers/
	    done
            echo "Question paper uploaded successfully."
            ;;
        "notify")
            # Check for new question papers
            echo "New question papers:"
            ls /path/to/question_papers/
            ;;
        "answer")
            # Mentee answers questions
            nano answer.txt
            ;;
        "save")
            # Mentee saves their answers
            mkdir -p ~/quiz_answers
            mv answer.txt ~/quiz_answers/
            echo "Answers saved successfully."
            ;;
        *)
            echo "Usage: manage_quiz [upload domain|notify|answer|save]"
            ;;
    esac
}


