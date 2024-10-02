# Redmine Kullanıcı Yetenekleri Eklentisi

Bu eklenti, tamamlanan görevlerin üzerindeki etiketleri kullanıcılara yetenek olarak atar ve kullanıcı profillerinde gösterir. Örneğin, bir görev "Python" etiketiyle işaretlenmişse ve bir kullanıcı bu görevi tamamlarsa, profilinde "Python 5" olarak gösterilir. Buradaki "5", kullanıcının "Python" etiketi taşıyan toplam kaç görevi tamamladığını belirtir.

## İhtiyaçlar
- Additional ve Additional_tags pluginlerini eklemeniz gerekmekteidir. ```https://github.com/alphanodes/additional_tags```

## Özellikler

- Görev tamamlandığında, görev etiketlerini otomatik olarak kullanıcının yeteneklerine ekler.
- Her bir yeteneği ve o yetenekle tamamlanmış görev sayısını kullanıcının profilinde gösterir.
## Eklenecek Özellikler
- Ayrıntılı yetenek özetini içeren özel bir yetenek sayfası sağlar.

## Kurulum

Bu eklentiyi kurmak için şu adımları izleyin:

1. **Bu depoyu ```/redmine/plugins``` klasorüne klonlayın:**

   ```sh
   https://github.com/HyperPixelv1/redmine-user_skill_plugin.git
