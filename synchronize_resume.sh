# Shell script to synchronize resume from overleaf to github to Documents directory

echo "Time is $(date)"

echo "Syncing Resume from github releases to documents directory..."

# Download file from github releases and save to Documents directory
RESUME_URL="https://github.com/sumchattering/Resume/releases/download/release/resume.pdf"
mkdir -p ~/Documents/Resume
curl -L  -o "$HOME/Documents/Resume/Resume.pdf" "$RESUME_URL" > /dev/null 2>&1

IOS_RESUME_URL="https://github.com/sumchattering/Resume/releases/download/release/resume-ios.pdf"
mkdir -p ~/Documents/Resume/ios
curl -L -o $HOME/Documents/Resume/ios/Resume.pdf "$IOS_RESUME_URL" > /dev/null 2>&1

echo "Done."
