<h1>LaraBlog</h1>
LaraBlog is Laravel with Blog case study. This project build for support me in learning Laravel and for those who new in Laravel. You are free to use or modify this project to your own purposes. 

<h2>Features</h2>
<ul>
    <li>CRUD Post, Category, Tag, User</li>
    <li>Pagination with/or Datatables Serverside</li>
    <li>Filter Data by Category and Pagination</li>
    <li>Search Data</li>
    <li>Image upload </li>
    <li>Eloquent</li>
    <li>Migration and Seeder</li>
    <li>WYSIWYG Text Editor: CKeditor</li>
</ul>

<h3>Layout</h3>
Frontend: Bootstrap 5, Backend: AdminLTE 3

<h3>Package</h3>
<ul>
    <li>Select2</li>
    <li>Bootstrap Datepicker</li>
    <li>Fontawesome 6</li>
</ul>

Or you can see all package that i've used in this repo from plugins in public > assets folder and composer.json file.
But the plugins and packages are not all used, so you can see the actual one from layouts > app.blade.php and
script.blade.php.

<h2>How to Install</h2>
<ul>
    <li>Make sure you are connected to internet.</li>
    <li>Open your terminal / cmd / powershell and run this commands:
        <ul>
        <li>docker build -t gmfaruk2021/docker-assignment-2:latest -f docker/Dockerfile .</li>
        <li>docker-compose up -d --build</li>
        <li>If need to access docker-compose terminal </li>
        <li>docker-compose exec laravel_app composer install</li>
        <li>docker-compose exec laravel_app php artisan key:generate</li>
        <li>docker-compose exec laravel_app php artisan migrate</li>
        <li>docker-compose exec laravel_app php artisan storage:link</li>
        <li>docker-compose exec laravel_app php artisan passport:install</li>
        <li>docker history gmfaruk2021/docker-assignment-2:latest</li>
        </ul>
    </li>
    <li>Push to Docker Hub: docker login</li>
    <li>docker tag gmfaruk2021/docker-assignment-2:latest gmfaruk2021/docker-assignment-2:latest</li>
    <li>docker push gmfaruk2021/docker-assignment-2:latest</li>
    <li>Setup SMTP Mail Credential (optional)
        <ul>
            <li>MAIL_MAILER=</li>
            <li>MAIL_HOST=</li>
            <li>MAIL_PORT=</li>
            <li>MAIL_USERNAME=</li>
            <li>MAIL_PASSWORD=</li>
            <li>MAIL_ENCRYPTION=</li>
            <li>MAIL_FROM_ADDRESS=""</li>
        </ul>
    </li>
</ul>
<h2>Access website and phpmyadmin</h2>
<ul>
    <li>Website: <a href="http://localhost:8080">http://localhost:8080</a></li>
    <li>Phpmyadmin: <a href="http://localhost:8081">http://localhost:8081</a></li>
<h2>User Login Credential</h2>
</ul>
<ul>
    <li>Admin: email and password; admin@gmail.com</li>
    <li>Author: email and password; author@gmail.com</li>
</ul>

<h2>Improvement</h2>
<ul>
    <li>Homepage
        <ul>
            <li>Add slider</li>
            <li>Add post-card by category / tags</li>
        </ul>
    </li>
    <li>Post
        <ul>
            <li>Add Comment / Discussion with likes and dislikes</li>
            <li>Add page view counter</li>
            <li>Show post by tags</li>
            <li>Add compression to image before upload</li>
        </ul>
    </li>
    <li>Authentication & Authorization
        <ul>
            <li>Separate login form and url for author and admin</li>
            <li>Add role CRUD</li>
            <li>Add page permission CRUD</li>
            <li>Fix error on author profile page. You can see how to fix this in admin profile page</li>
        </ul>
    </li>
</ul>

