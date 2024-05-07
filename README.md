# Chat Online Multiplataforma en Flutter

Este es un proyecto de aplicación multiplataforma desarrollado en Flutter que permite a los usuarios enviar mensajes en tiempo real, similar a aplicaciones como WhatsApp. La aplicación incluye características como registro de usuarios, inicio de sesión y una interfaz de chat donde los usuarios pueden intercambiar mensajes. Utiliza Firebase para la autenticación de usuarios y Firestore como base de datos para almacenar y recuperar mensajes.

## Características

- Registro de usuarios: Los usuarios pueden registrarse en la aplicación utilizando su dirección de correo electrónico y una contraseña.
- Inicio de sesión: Los usuarios registrados pueden iniciar sesión en la aplicación para acceder a las funcionalidades de chat.
- Chat en tiempo real: La aplicación proporciona una interfaz de chat en tiempo real donde los usuarios pueden enviar y recibir mensajes instantáneamente.
- Firebase Authentication: Utiliza Firebase Authentication para autenticar a los usuarios y proteger el acceso a la aplicación.
- Firestore: La base de datos Firestore de Firebase se utiliza para almacenar y sincronizar mensajes entre los usuarios en tiempo real.

## Capturas de Pantalla


<div style="display: flex, justify-content: space-around, align-items: center;">
<img src="https://i.imgur.com/w6wERdr.png" style="width: 300px"/>
<img src="https://i.imgur.com/yqdPkGt.png" style="width: 300px"/>
<img src="https://i.imgur.com/BSxIgp8.png" style="width: 300px"/>
</div>


## Tecnologías Utilizadas

- **Flutter**: Framework de desarrollo de aplicaciones móviles multiplataforma desarrollado por Google.
- **Firebase Authentication**: Servicio de Google que proporciona una forma sencilla de autenticar usuarios utilizando direcciones de correo electrónico y contraseñas.
- **Firestore**: Base de datos en tiempo real de Firebase que permite almacenar y sincronizar datos en la nube.

## Configuración del Proyecto

1. Abre el proyecto en tu editor de código preferido.
2. Crea un nuevo proyecto en flutter.
3. Clona este repositorio en tu máquina local reemplazando todos los archivos de programa que proporciona el repositorio.
4. Abre el proyecto en tu editor de código preferido.
5. Configura tu proyecto en Firebase:
    - Crea un proyecto en [Firebase Console](https://console.firebase.google.com/).
    - Habilita la autenticación por correo electrónico en la sección de Authentication.
    - Configura Firestore como base de datos en la sección de Firestore Database.
6. Copia las credenciales de Firebase (google-services.json para Android o GoogleService-Info.plist para iOS) en la carpeta `android/app` para Android o `ios/Runner` para iOS.
7. Ejecuta el proyecto utilizando el comando `flutter run`.


## Contribuir

¡Las contribuciones son bienvenidas! Si deseas contribuir a este proyecto, por favor sigue los siguientes pasos:

1. Crea un fork del repositorio.
2. Crea una nueva rama (`git checkout -b feature/feature-name`).
3. Realiza tus cambios y haz commit de ellos (`git commit -am 'Add new feature'`).
4. Sube tus cambios a tu repositorio fork (`git push origin feature/feature-name`).
5. Crea un nuevo Pull Request.

## Contacto

Si tienes alguna pregunta o sugerencia sobre este proyecto, no dudes en ponerte en contacto conmigo via [📧Email](mailto:carlosmartinezguixa@gmail.com) o [Linkedin](https://www.linkedin.com/in/carlosmartinezguixa/).
