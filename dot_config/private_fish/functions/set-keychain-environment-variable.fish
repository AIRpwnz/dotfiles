function set-keychain-environment-variable -d "Save secret to macOS keychain"
    if not test -n "$argv[1]"
        echo "Missing environment variable name"
        return 1
    end

    read --silent --prompt-str="Enter Value for $argv[1]: " secret

    if test -z "$secret"
        return 1
    end

    security add-generic-password -U -a $USER -D "environment variable" -s "$argv[1]" -w "$secret"
end
