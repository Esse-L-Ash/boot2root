# /bin/bash

# verifier qu'il n'y a qu'un "//file" par fichier 
# grep "//file" ft_fun/* -c | grep -v ":1"

# get list of relevant files
FILES=$(grep -RE "getme|return"  ft_fun | cut -d':' -f1 | uniq) 

files_numerotation(){
    for FILE in $FILES
    do
        NUMBER_FILE=$(grep "//file" $FILE | cut -d e -f2)
        NEW=$(echo "${NUMBER_FILE}_${FILE}")
        echo $NEW
    done
}

get_pass() {
    # echo "result of the grep on //file:"
    # files_numerotation
    # echo "Now, let's sort the files"
    # files_numerotation | sort -h
    # echo "We can now, display the str in the right order thanks to sed who isolate the char and echo -n"

    # /!\ THE LINES ABOVE TEMPERS with the sha256 sum ! /!\

    for c in $(cat $(files_numerotation | sort -h | cut -d _ -f 2-) | grep -E "return" | sed "s/.*'\(\w\)'.*/\1/")
    do
        echo -n "$c"
    done
}

get_pass
echo ""
echo "let's use sha256sum on this string"
get_pass | sha256sum