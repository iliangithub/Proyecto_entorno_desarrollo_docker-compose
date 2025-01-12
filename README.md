# 1.0 Introducción.
Parte 1
aqui va a ir el entorno de desarrollo, la página web en si, y como lo he creado todo.

Proyecto final, Parte 2: https://github.com/iliangithub/Proyecto_AWS_IaC-monitoring-Web-PaaS-

> 🔴 Project Number 1.
>
>The idea came up because, in order to carry out Project Number 2, I need to develop a website, and I required an environment that would allow me to do so. I wasn't sure which programming languages I would use or >what the tech stack would be. I initially thought about using only PHP, then decided to add Python and install JS using Node.js.
>
>There is no tool like this on the market; if we only think about an environment for developing with PHP that includes a database, we might think of XAMPP.
>
>From experience, I know that XAMPP causes MANY errors, which are UNACCEPTABLE. To solve this, I decided to create my own development environment using Docker Compose to deploy two containers—one to host the >website and another for the database.
>
>So, I decided to make this environment something that could be created and deployed automatically, as well as be deleted, and on top of that, be able to remove the environment, all its containers, and volumes >with just a click.
>
>To achieve this, I decided to create a ".bat" script that would allow me to do all of this, and I also compiled it into an ".exe" file.
>

>
# 2.0 Instrucciones.

Entonces, si queremos usar el entorno de desarrollo de PHP, solo tenemos que descargarlo, extrarlo y ejecutar el .exe correspondiente, este ".exe" tiene que estar en la misma carpeta que el `docker-compose.yml`.
Una vez le demos doble click nos pedirá permisos de Administrador (realmente lo pide no para nada en concreto, si no, solamente para asegurarte de que estás a punto de ejecutarlo.

Hay otro .exe, pero ese otro sirve para borrar los Contenedores, Imagenes, Volumenes y las Builds.

![image](https://github.com/user-attachments/assets/4eb90bb1-2373-4401-ab31-16ef9a3a7fec)

También está hecho en .sh para los usuarios de Linux.
