# сначала нужны неймспейсы
./create_namespaces.sh 
# далее создаем роли в них
./create_roles.sh 
# далее связываем роли с группами
./create_role_bindings.sh 
# и заводим в юзеров с такими группами
./create_users.sh
