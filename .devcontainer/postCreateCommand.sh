sudo chmod a+x "$(pwd)"
sudo rm -rf /var/www/html
sudo ln -s "$(pwd)" /var/www/html
sudo a2enmod rewrite
echo "max_input_vars = 6000
upload_max_filesize = 50M
post_max_size = 51M
" | sudo tee /usr/local/etc/php/conf.d/gibbon.ini
chown -R www-data:www-data $(pwd) && chmod -R 755 $(pwd) && chmod -R 774 $(pwd)/uploads
# sudo apache2ctl start
