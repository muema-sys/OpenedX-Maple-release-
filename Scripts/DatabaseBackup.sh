echo "______Open edX Database backup______"
echo ""

#echo echo -e "\e[33mCleaning database dump folder\e[0m"

#d $(tutor config printroot)/data/mongodb

#cd $(tutor config printroot)/data/mongodb


#echo "Done cleaning up older backups"
#echo ""
echo "Starting new database backup. Please wait..."

tutor local exec \
    -e USERNAME="$(tutor config printvalue MYSQL_ROOT_USERNAME)" \
    -e PASSWORD="$(tutor config printvalue MYSQL_ROOT_PASSWORD)" \
    mysql sh -c 'mysqldump --all-databases --user=$USERNAME --password=$PASSWORD > /var/lib/mysql/dump.sql'
tutor local exec mongodb mongodump --out=/data/db/dump.mongodb

echo "Done backing up mongo and mysql databases"
echo ""
echo "Mongo dump Location : $(tutor config printroot)/data/mongodb"
echo "Mysql dump Location: $(tutor config printroot)/data/mysql"

echo "Compressing database backups"