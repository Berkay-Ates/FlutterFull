Note : 
init state içinden async bir fonksioyon başlatabiliriz ama init state'i async hale getiremeyiz. 
Yani init state içinde await atamayız çünkü initstate çalışır ve biter 


tema özelligi verirken ;

- class içerisinde sabit style lar oluşturup textlere atamak 
- Direk theme üzerinden styleları okuyarak sonrasında istediğimiz gibi themaları manüpüle etmek 

Farz_ı misal :) 
projenin birden fazla yerinde aynı Decoration'u kullanıyorsak ve tekrara düşmek istemiyorsak 
ortak olan decorationları bir classın constructoru içerisinde toplarız ve bu classı da Box decoration a 
extends ettirerek super anahtar kelimesi sayesinde ortak olan elemanlarımızı tanımlarız. Sonra tek gereken 
ihtiyacımız olan yerlerde bu classtan objeler türetmektir. ***


Inkwell - widget'i  gesture detector gibi işlem görür ama sadece tıklanmaları anlamak gibi bir özelligiyle 
öne çıkmaz 


Sayfanın rengine göre appbarın üstünde bulunan tooolbar componentlerimizi ayarlamamız gerekir 
Bunun için systemOverlayStyle componentini kullanırız. 




Uygulanın herhangi biryerinde kullanılan appbarıbar eğer birden çok yerde kullanılıyorsa 
ortak olan bu appbar özelliğini main dosyası içinden uygulamanın themasını belirttiğimiz thema içerisinden
cutom olarak tanımların sonrasında flutter'in bize en baştan tanımlamış oldugu appbar yerine 
artık bizim tanımlamış olduğumuz appbar kullanılır. 


Peki heryede direk bu tanımlanan appbar mı kullanılacak? 
eğer appbarı değiştirmessek, evet heryerde bu appbar kullanılacak ama eger background colour'unu değiştirirsek 
bu defa yeni verdigimiz renk kullanılır. yani main içinden yaptıgımız değişiklikler flutter'ın bize sağlamış 
oldugu default theme leri değiştirir   






** EGER FLUTTER'IN BIZLERE SAGLAMIS OLDUGU COMPONENTLER YETERLI DEGILSE KENDI COMPONENTLERIMIZI YAZMAMIZ GERKLIDIR
- core componentler primitive özelliklerde olmalılar kullanan kişiler istediklerigibi oluşturduğumuz 
widget' ları maüpüle edebilmeliler 

------------- Tricks 
icon amblemlerini görmek için intellj'nin içindeyken control-j yapmamız yeterlidir


' _ ' ( alttan tire) elemanın file private olmasını sağlar bu sayede bu elemana sadece tanımlanmış 
olduğu file içinden erişebiliriz. 


Profesyönel bir projede paddingler dahil birçok şey belli bir standardizasyon bağlıdır. Bu standardizasyonu 
paddinglerde sağlamak için uygulamanın heryerinde smetrik veya sabit değerde paddingler kullanılır. 
Bu yüzden kullanacağımız padding değerlerini belirli bir class içine yazıp gerektiğinde oradan çağırmamız yeterlidir



Theme de en baştan default gelenleri örn:background yeniden istediğin gibi tanımla 
sonra gerektigi yerde direk bunları theme ğzerinden çekerek kullan.  






