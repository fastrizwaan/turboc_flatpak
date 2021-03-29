#### Install SDK and Runtimes
sudo flatpak --system remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak -y --system install      \
     org.freedesktop.Sdk/x86_64/20.08 \
     org.freedesktop.Platform/x86_64/20.08   

# Remove old flatpak of this, if installed
rm *.flatpak repo/ -r 2>/dev/null
flatpak remove io.github.turboc -y 2>/dev/null


# Build
flatpak-builder --force-clean build-dir io.github.turboc.yml 

# Create flatpak
flatpak-builder --repo="repo" --force-clean build-dir/ io.github.turboc.yml 
flatpak --user remote-add --no-gpg-verify "io.github.turboc" "repo"
#flatpak build-bundle "repo" "io.github.turboc_$date.flatpak" io.github.turboc master --runtime-repo="https://flathub.org/repo/flathub.flatpakrepo"
flatpak build-bundle "repo" "io.github.turboc.flatpak" io.github.turboc master

# Install
flatpak --user install io.github.turboc.flatpak -y
