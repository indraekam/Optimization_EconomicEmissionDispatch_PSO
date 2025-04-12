function formatted_str = insertCommas(str)
    str = fliplr(str);
    str = regexprep(str, '(\d{3})', '$1,');
    str = fliplr(str);
    formatted_str = str;
    
    if formatted_str(1) == ','
        formatted_str = formatted_str(2:end);
    end
    
    if formatted_str(end) == ','
        formatted_str = formatted_str(1:end-1);
    end
    
        
end