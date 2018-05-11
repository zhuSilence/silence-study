 angular.module('main').factory('UserInfoModel',function(){
     var UserInfoModel = function(){
       this.userName = '张三000';
         this.userAge = 60;
     };
    return UserInfoModel
});