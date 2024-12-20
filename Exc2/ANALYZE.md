# Анализ по заданию 2

## Проанализируйте схему и описание системы

> Идентифицируйте системы и изучите характер их работы с точки зрения безопасности.

- Группа сервисов для продаж
  - витрина продаж
    - фронтенд приложение
    - вероятные уязвимости
     - перехват авторизации конкретного пользователя и последующие действия из под его аккаунта.
     - CSRF (межсайтовая подделка запроса) 
     - XSS
     - неограниченное время действия токенов авторизации
  - приложение для онлайн-тура + бд
    - бекенд приложение
    - хранятся данные по проведению онлайн туров. нет конфиденциальных данных.
  - приложение для онлайн-сделки + бд
    - бекенд приложение
    - есть конфиденциальные данные о сделках по приобретению жилья.
    - вероятные уязвимости
      - sql инъекции
      - доступность бд из вне контура
      - отсутствие шифрования данных (если всё таки бд либо её бекапы как-то попала к злоумышленникам)
      - отсутствие авторизации у приложения при работе сервер-сервер
      - отсутствие ограничений внутренних пользователей на доступ к данным
      - отсутствие логирования доступа к данным пользователями
      - отсутствие TLS в работе сервер-сервер / сервер-клиент
      - отсутствие мониторинга аномальной активности
      - отсутствие ограничений на доступ к данным между сервисами
  - система для управления клиентскими данными + бд
    - бекенд приложение
    - есть конфиденциальные данные покупателей
    - вероятные уязвимости
      - sql инъекции
      - доступность бд из вне контура
      - отсутствие шифрования данных (если всё таки бд либо её бекапы как-то попала к злоумышленникам)
      - отсутствие авторизации у приложения при работе сервер-сервер
      - отсутствие ограничений внутренних пользователей на доступ к данным
      - отсутствие логирования доступа к данным пользователями
      - отсутствие TLS в работе сервер-сервер / сервер-клиент
      - отсутствие мониторинга аномальной активности
      - неограниченное время хранения персональных данных покупателей
      - отсутствие защиты данных при передаче в государственные системы
      - отсутствие ограничений на доступ к данным между сервисами
  - приложение для управления данными о недвижимости + бд
    - бекенд приложение
    - нет конфиденциальных данных
    - вероятные уязвимости
      - sql инъекции
      - доступность бд из вне контура
      - отсутствие авторизации у приложения при работе сервер-сервер
      - отсутствие ограничений внутренних пользователей на изменение данных
      - отсутствие логирования изменения данных пользователями
      - отсутствие TLS в работе сервер-сервер / сервер-клиент
- Группа сервисов ЖКУ
  - витрина
    - мобильные приложение
    - вероятные уязвимости:
      - перехват авторизации конкретного пользователя и последующие действия от его имени
  - сервис для предоставления услуг + бд
    - бекенд приложение
    - хранятся данные о предоставленных услугах, истории оплат и информации об умных устройствах для управления «Умным домом»
    - вероятные уязвимости:
      - sql-инъекции
      - доступность базы данных извне корпоративного контура
      - отсутствие шифрования данных в базе данных и бекапах
      - недостаточное разграничение прав доступа для внутренних пользователей (например, операторы, которые могут просматривать или изменять данные собственников)
      - отсутствие логирования доступа и изменения данных
      - отсутствие шифрования в передаче данных (TLS)
      - отсутствие разграничений пользователей при работе с интеграциями жкх
      - хранение платежной информации без должной защиты
      - отсутствие ограничений на доступ к данным между сервисами
  - CRM для собственников + бд
    - бекенд приложение
    - хранятся персональные данные собственников, включая историю запросов и обращений
    - вероятные уязвимости:
      - sql-инъекции
      - доступность базы данных извне корпоративного контура
      - отсутствие шифрования данных в базе данных / бекапах
      - отсутствие ограничений на доступ к данным, что может привести к утечке персональных данных
      - отсутствие мониторинга активности и логирования действий, связанных с доступом к конфиденциальной информации
      - отсутствие шифрования в передаче данных (TLS)
      - отсутствие ограничений на доступ к данным между сервисами
- Финансы
  - система финансового учёта + бд
    - бекенд приложение
    - хранятся финансовая информация клиентов и собственников, включая истории платежей и начислений
    - вероятные уязвимости:
      - sql-инъекции
      - доступность базы данных извне корпоративного контура
      - отсутствие шифрования данных, что может привести к риску компрометации данных в случае утечки или взлома базы данных
      - недостаточное разграничение прав доступа для сотрудников, что может привести к несанкционированному доступу к финансовым данным
      - отсутствие мониторинга и логирования финансовых транзакций, что усложняет обнаружение подозрительных операций
  - служба каталогов
    - непонятно что за приложение =/
    - вероятные уязвимости:
      - нечёткие права доступа для внутренних пользователей и приложений, что может привести к несанкционированному изменению данных
      - недостаточный контроль версий и отсутствие логирования изменений в каталоге данных
      - возможные уязвимости при интеграции с другими сервисами из-за отсутствия ограничений на вызовы API
- Дата
  - хранилище данных
    - центральное хранилище данных компании, содержащее всю совокупность исторических данных от всех IT-систем
    - вероятные уязвимости:
      - отсутствие шифрования данных на уровне хранения, что может повысить риск утечки конфиденциальных данных
      - недостаточный контроль доступа к данным, что может привести к утечке при выполнении неконтролируемых аналитических запросов
      - отсутствие мониторинга доступа и логирования действий для операций с данными, что затрудняет выявление и предотвращение несанкционированного доступа
      - отсутствие анонимизации/токенизации или другого механизма скрытия конфиденциальных данных
  - BI и отчётность
    - система бизнес-аналитики и отчётности, которая позволяет строить отчёты и анализировать данные для поддержки принятия решений
    - вероятные уязвимости:
      - недостаточное разграничение прав доступа для сотрудников
      - отсутствие мониторинга операций с отчётами и данными, используемыми в BI-инструментах
      - отсутствие анонимизации/токенизации или другого механизма скрытия конфиденциальных данных

## Выберите, какие разделы включить в проверочный лист, исходя из проблем и приоритетов компании

- Контроль доступа
- Безопасность данных
- Безопасность взаимодействия с внешними сервисами
- Мониторинг и аудит
- Защита инфраструктуры
- Управление инцидентами
