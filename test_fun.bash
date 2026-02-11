# /bin/bash

# verifier qu'il n'y a qu'un "//file par" fichier 
# grep "//file" ft_fun/* -c | grep -v ":1"

# get list of relevant files
FILES=$(grep -RE "getme|return"  ft_fun | cut -d':' -f1 | uniq) 

files_numerotation(){
    for FILE in $FILES
    do
        #echo $FILE
        NUMBER_FILE=$(grep "//file" $FILE | cut -d e -f2)
        #echo "file number is = $NUMBER_FILE"
        NEW=$(echo "${NUMBER_FILE}_${FILE}")
        echo $NEW
    done
}

get_pass() {
    # s'il croise un nombre il le prend en compte pas seulement le char
    for c in $(cat $(files_numerotation | sort -h | cut -d _ -f 2-) | grep -E "return" | sed "s/.*'\(\w\)'.*/\1/" )
    do
        echo -n "$c"
    done
}

get_pass | sha256sum