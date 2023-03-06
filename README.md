 # Схема базы данных для музыкального сайта(*таблицы и связи между ними*) 

 ## Требования(1):

- на сайте должна быть возможность увидеть список музыкальных жанров;
- для каждого жанра можно получить список исполнителей, которые выступают в соответствующем жанре;
- для каждого исполнителя можно получить список его альбомов;
- для каждого альбома можно получить список треков, которые в него входят;
- у жанра есть название;
- у исполнителя есть имя (псевдоним) и жанр, в котором он исполняет;
- у альбома есть название, год выпуска и его исполнитель;
- у трека есть название, длительность и альбом, которому этот трек принадлежит.
 
 ## Требования(2):

- Ранее существовало ограничение, что каждый исполнитель поёт строго в одном жанре, пора его убрать. Исполнители могут петь в разных жанрах, как и одному жанру могут принадлежать несколько исполнителей.

- Аналогичное ограничение было и с альбомами у исполнителей — альбом мог выпустить только один исполнитель. Теперь альбом могут выпустить несколько исполнителей вместе. Как и исполнитель может принимать участие во множестве альбомов.

- С треками ничего не меняем, всё так же трек принадлежит строго одному альбому.

- Но появилась новая сущность — сборник. Сборник имеет название и год выпуска. В него входят различные треки из разных альбомов. _Обратите внимание_: один и тот же трек может присутствовать в разных сборниках.
  
 ![Image alt](https://github.com/kiselpd/postgre_sql_music_website/raw/main/architecture_db/db_music_website.png)
