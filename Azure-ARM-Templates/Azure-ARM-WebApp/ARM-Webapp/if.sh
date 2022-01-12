yesdebug () { echo "Will run in debug mode"; }

nodebug () { echo "Will not run in debug mode"; }

echo "Would you like to run script in debug mode? (yes or no)"

read yesorno

if [ "$yesorno" = yes ]; then
    yesdebug

elif [ "$yesorno" = no ]; then
    nodebug
else
    echo "Not a valid answer."
    exit 1
fi