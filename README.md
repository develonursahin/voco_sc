# Voco App 📱 TR

Bu Flutter projesi, Voco App adlı mobil uygulamanın geliştirilmesini içermektedir. Uygulama, Riverpod ve MVC/MVC+S mimarilerini kullanarak geliştirilmiş ve kullanıcı girişi ile katılımcı listeleme gibi temel özelliklere sahiptir.

## Proje Açıklaması 🚀

Voco App, kullanıcıların kolayca giriş yapabilmesini ve katılımcıların listesini görüntüleyebilmesini sağlayan bir mobil uygulamadır. Aşağıda projenin temel bileşenleri ve gereksinimleri bulabilirsiniz:

- **MVC/MVC+S Mimarisi:** Uygulama, Model-View-Controller (MVC) veya Model-View-Controller + Services (MVC+S) mimarilerini kullanarak kodlarını organize etmektedir.

- **Login Ekranı:** Uygulamanın ilk ekranı, kullanıcı adı ve şifre alanlarını içeren bir giriş ekranını içermektedir. Kullanıcıdan giriş bilgilerini girmesi istenmektedir.

- **Validation:** Kullanıcıdan alınan e-posta ve şifre bilgileri, form doğrulaması ile kontrol edilmektedir. Eksik veya hatalı girişler durumunda kullanıcıya hata mesajları gösterilmektedir.

- **Login İstekleri:** Giriş yapılırken, https://reqres.in/ adresine bir istek gönderilmektedir. Başarılı bir giriş durumunda, gelen token SharedPreferences kullanılarak yerel depolamada saklanmakta ve Riverpod ile uygulama boyunca erişilebilir hale getirilmektedir.

- **Katılımcılar Sayfası:** Kullanıcı başarılı bir şekilde giriş yaptığında, katılımcıların listesi https://reqres.in/ API'sini kullanarak çekilmektedir. Bu katılımcı verileri, Riverpod ile yönetilen bir durum (state) ile saklanmaktadır.

- **Otomatik Giriş:** Uygulama, daha önce giriş yapmış bir kullanıcıyı tanıyarak otomatik olarak giriş yapmaktadır. Bu işlem, uygulama başladığında yerel depolamadaki token'ın kontrol edilmesi ile gerçekleştirilmektedir.

- **Hata İşleme:** Uygulama, ağ isteklerinde ve kullanıcı girişi sırasında oluşabilecek hataları ele almaktadır. Hata durumlarında kullanıcıya uygun hata mesajları gösterilmektedir.

- **Kullanılan Paketler:** Bu projede kullanılan ana Flutter paketleri ve açıklamaları aşağıda listelenmiştir:
  - Riverpod: State yönetimi için kullanılan bir paket.
  - http: HTTP istekleri yapmak için kullanılan bir paket.
  - shared_preferences: Yerel depolama (local storage) için kullanılan bir paket.
  - flutter_form_builder: Formları kolayca oluşturmak ve doğrulamak için kullanılan bir paket.

## Hata Bildirimi ve Katkı 🐞

Projeyle ilgili herhangi bir hata veya sorun bulursanız, lütfen GitHub üzerinden bir hata bildirin veya bir katkıda bulunun. Katkılarınızı bekliyoruz!

## Lisans 📝

Bu proje [MIT Lisansı](LICENSE) ile lisanslanmıştır.



# Voco App 📱 EN

This Flutter project involves the development of a mobile application called Voco App. The application is developed using Riverpod and MVC/MVC+S architectures and features basic functionalities like user login and participant listing.

## Project Description 🚀

Voco App allows users to easily log in and view a list of participants. Below, you'll find the fundamental components and requirements of the project:

- **MVC/MVC+S Architecture:** The application organizes its code using Model-View-Controller (MVC) or Model-View-Controller + Services (MVC+S) architectures.

- **Login Screen:** The initial screen of the application contains fields for username and password. Users are prompted to enter their login information.

- **Validation:** User input for email and password is validated through form validation. In case of incomplete or erroneous entries, users are shown error messages.

- **Login Requests:** When logging in, a request is sent to https://reqres.in/. In the event of a successful login, the received token is stored in SharedPreferences for local storage and made accessible throughout the application using Riverpod.

- **Participants Page:** Upon successful login, the list of participants is retrieved using the https://reqres.in/ API. This participant data is stored using a state managed by Riverpod.

- **Automatic Login:** The application automatically logs in a user who has previously logged in. This is achieved by checking the token in local storage when the application starts.

- **Error Handling:** The application handles potential errors that may occur during network requests and user login. Appropriate error messages are displayed to users in case of errors.

- **Used Packages:** The primary Flutter packages used in this project, along with their descriptions, are listed below:
  - Riverpod: Used for state management.
  - http: Used for making HTTP requests.
  - shared_preferences: Used for local storage.
  - flutter_form_builder: Used for easily creating and validating forms.

## Bug Reporting and Contributions 🐞

If you encounter any issues or problems with the project, please report them on GitHub or contribute to the project. Your contributions are welcome!

## License 📝

This project is licensed under the [MIT License](LICENSE).
