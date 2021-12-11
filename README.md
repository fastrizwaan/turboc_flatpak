[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/fastrizwaan)

# turboc_flatpak
Borland TurboC++ compiler in DosBox 

### Important: Ctrl+F9 will kill dosbox - run/execute won't work
Use Alt+R + Enter keys to run compiled C/C++ programs

### Dosbox grabs mouse, free the Mouse by pressing CTRL+F10 key


![](https://github.com/fastrizwaan/turboc_flatpak/raw/main/io.github.turboc.png)

![](https://github.com/fastrizwaan/turboc_flatpak/raw/main/turboc.png)


#### Install SDK and Runtimes
```
sudo flatpak --system remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak -y --system install      \
     org.freedesktop.Sdk/x86_64/20.08 \
     org.freedesktop.Platform/x86_64/20.08   
```
#### Remove old flatpak of this, if installed
```
rm *.flatpak repo/ -r 2>/dev/null
flatpak remove io.github.turboc -y 2>/dev/null
```

#### Build
```
git clone https://github.com/fastrizwaan/turboc_flatpak.git
cd turboc_flatpak
flatpak-builder --force-clean build-dir io.github.turboc.yml
flatpak-builder --force-clean --install --user build-dir io.github.turboc.yml 


```

#### Create flatpak
```
flatpak-builder --repo="repo" --force-clean build-dir/ io.github.turboc.yml 
flatpak --user remote-add --no-gpg-verify "io.github.turboc" "repo"
#flatpak build-bundle "repo" "io.github.turboc_$date.flatpak" io.github.turboc master --runtime-repo="https://flathub.org/repo/flathub.flatpakrepo"
flatpak build-bundle "repo" "io.github.turboc.flatpak" io.github.turboc master
```
#### Install
`flatpak --user install io.github.turboc.flatpak -y`
