function keychain-environment-variable -d "Get secret from macOS keychain"
    security find-generic-password -w -a $USER -D "environment variable" -s "$argv[1]"
end
