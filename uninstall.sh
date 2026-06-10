# Don't modify anything after this
if [ -f "$INFO" ]; 
  then
    while IFS= read -r line; 
      do
        if [ "${line#"${line%?}"}" = "~" ]; 
          then continue
        elif [ -f "$line~" ]; 
          then mv -f "$line~" "$line"
        else
          dir="$line"
          rm -f "$line"
          while [ "$dir" != "." ] && [ "$dir" != "/" ]; 
            do
              dir=$(dirname "$dir")
              if [ -n "$(ls -A "$dir" 2>/dev/null)" ]; 
                then break
              fi
              rmdir "$dir" 2>/dev/null || break
          done
        fi
    done < "$INFO"
    rm -f "$INFO"
fi
