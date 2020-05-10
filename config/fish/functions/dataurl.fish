function dataurl
    for f in $argv
        set -l mimeType (file -b --mime-type $f)
        if test "$mimeType" = "text/*"
            set mimeType "$mimeType;charset=utf-8"
        end
        echo "data:$mimeType;base64,"(openssl base64 -in "$f" | tr -d '\n')
    end
end
