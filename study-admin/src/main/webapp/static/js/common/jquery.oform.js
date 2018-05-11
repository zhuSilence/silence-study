/**
 * File:        jquery.oform.js
 * Version:     1.0.0.
 * Author:      Siber.xu
 *
 * Copyright 2015 SiberXu, all rights reserved.
 *
 */
(function ($) {

    /**
     * JSON对象转化成表单数据
     * @param obj
     * @returns {*}
     * @constructor
     */
    $.fn.JsonToForm = function (obj) {

        function setElementValue(element, value, name) {
            var type = element.type || element.tagName;
            if (type == null) {
                type = element[0].type || element[0].tagName;
                if (type == null) {
                    return;
                }
            }
            type = type.toLowerCase();
            switch (type) {
                case 'radio':
                case 'checkbox':
                    if (value != null) {
                        $(element).val(value.constructor == Array ? value : [value]);
                    }
                    break;
                case 'option':
                    $(element).attr("value", value.value);
                    $(element).text(value.text);
                    if (value.selected)
                        $(element).attr("selected", true);
                    break;
                case 'select-multiple':
                    var select = element[0];
                    if (element[0].options == null || typeof (element[0].options) == "undefined") {
                        select = element;
                    }
                    if (select.options.length > 1) {
                        var values = value.constructor == Array ? value : [value];
                        for (var i = 0; i < select.options.length; i++) {
                            for (var j = 0; j < values.length; j++) {
                                select.options[i].selected |= select.options[i].value == values[j];
                            }
                        }
                    } else {
                        //loadSelect(element, value, name);
                    }
                    break;
                case 'select':
                case 'select-one':
                    if (value.constructor != Array) {
                        /** 针对bootstrap select 插件特殊处理 **/
                        if ($(element).hasClass('selectpicker')) {
                            $(element).selectpicker('val', value);
                        } else {
                            $(element).val(value);
                        }
                    } else {
                        //loadSelect(element, value, name);
                    }
                    break;
                case 'text':
                case 'number':
                case 'email':
                case 'tel':
                case 'url':
                case 'hidden':
                case 'password':
                    $(element).attr("value", value);
                    break;
                case 'a':
                    var href = $(element).attr("href");
                    var iPosition = href.indexOf('#');
                    if (iPosition > 1000000) {
                        href = href.substr(0, iPosition) + '&' + name + '=' + value + href.substr(iPosition)

                    } else {
                        iPosition = href.indexOf('?');
                        if (iPosition > 0)
                            href += '&' + name + '=' + value;
                        else
                            href = href + '?' + name + '=' + value;
                    }
                    $(element).attr("href", href);
                    break;
                case 'img':
                    if (obj.constructor == "String") {
                        //Assumption is that value is in the HREF$ALT format
                        var iPosition = value.indexOf('$');
                        var src = "";
                        var alt = "";
                        if (iPosition > 0) {
                            src = value.substring(0, iPosition);
                            alt = value.substring(iPosition + 1);
                        }
                        else {
                            src = value;
                            var iPositionStart = value.lastIndexOf('/') + 1;
                            var iPositionEnd = value.indexOf('.');
                            alt = value.substring(iPositionStart, iPositionEnd);
                        }
                        $(element).attr("src", src);
                        $(element).attr("alt", alt);
                    } else {
                        $(element).attr("src", obj.src);
                        $(element).attr("alt", obj.alt);
                        $(element).attr("title", obj.title);
                    }
                    break;
                case 'label':
                case 'textarea':
                case 'submit':
                case 'button':
                default:
                    try {
                        $(element).html(value.toString());
                    } catch (exc) {
                    }
            }

        }

        function browseJSON(obj, element, name) {
            if (obj == undefined)
                return false;

            if (obj.constructor == Object) {
                if (element.length >= 1 && element[0].tagName == "OPTION") {
                    setElementValue(element[0], obj, name);
                }
                for (var prop in obj) {
                    if (prop == null || typeof prop == "undefined")
                        continue;
                    else {
                        if (obj[prop].constructor == Object) {
                            var subObj = obj[prop];
                            for (var subProp in subObj) {
                                var newObj = {};
                                newObj[prop + '.' + subProp] = subObj[subProp];
                                browseJSON(newObj, element, prop + '.' + subProp);
                            }
                        }
                        //找到当前的无素信息，查找顺序为class,name,id,rel
                        var child = jQuery.makeArray(jQuery("." + prop, element)).length > 0 ? jQuery("." + prop, element) :
                            jQuery('[name="' + prop + '"]', element).length > 0 ? jQuery('[name="' + prop + '"]', element) :
                                jQuery("#" + prop, element).length > 0 ? jQuery("#" + prop, element) : jQuery('[rel="' + prop + '"]');
                        if (child.length != 0) {
                            setElementValue(jQuery(child, element), obj[prop], prop);
                        }
                    }
                }
            }
        }

        return this.each(function () {

            browseJSON(obj, this);
        });
    }
    /**
     * 将form表单元素的值序列化成JSON对象
     * 支持name中有.的方式，例如：abc.inlineCheckbox
     * @returns {{}}
     */
    $.fn.serializeJson = function () {
        var serializeObj = {};
        var array = this.serializeArray();
        //var str = this.serialize();
        $(array).each(function () {
            var nameArray = this.name.split('.');
            if (nameArray.length > 1) {
                this.name = nameArray[0];
                var subName = nameArray[1];
                var checkBoxLen = $("input[type='checkbox'][name='" + this.name + "']").length;
                if (serializeObj[this.name]) {
                    if ($.isArray(serializeObj[this.name][subName])) {
                        serializeObj[this.name][subName].push(this.value);
                    } else {
                        serializeObj[this.name][subName] = this.value;
                        //serializeObj[this.name][subName] = [serializeObj[this.name][subName], this.value];
                    }
                } else {
                    var subArray = {};
                    subArray[subName] = this.value;
                    if (checkBoxLen > 0) {
                        serializeObj[this.name] = [];
                        serializeObj[this.name].push(subArray)
                    }else{
                        serializeObj[this.name] = subArray;
                    }
                }
            } else {
                var checkBoxLen = $("input[type='checkbox'][name='" + this.name + "']").length;
                if (serializeObj[this.name]) {
                    if ($.isArray(serializeObj[this.name])) {
                        serializeObj[this.name].push(this.value);
                    } else {
                        serializeObj[this.name] = [serializeObj[this.name], this.value];
                    }
                } else {
                    if (checkBoxLen > 0) {
                        serializeObj[this.name] = [this.value];
                    } else {
                        serializeObj[this.name] = this.value;
                    }
                }
            }

        });
        return serializeObj;
    }

    $.fn.clearForm = function (includeHidden) {
        return this.each(function () {
            $('input,select,textarea', this).clearFields(includeHidden);
        });
    };

    /**
     * Clears the selected form elements.
     */
    $.fn.clearFields = $.fn.clearInputs = function (includeHidden) {
        var re = /^(?:color|date|datetime|email|month|number|password|range|search|tel|text|time|url|week)$/i; // 'hidden' is not in this list
        return this.each(function () {
            var t = this.type, tag = this.tagName.toLowerCase();
            if (re.test(t) || tag == 'textarea') {
                this.value = '';
            }
            else if (t == 'checkbox' || t == 'radio') {
                this.checked = false;
            }
            else if (tag == 'select') {
                this.selectedIndex = -1;
            }
            else if (t == "file") {
                if (/MSIE/.test(navigator.userAgent)) {
                    $(this).replaceWith($(this).clone(true));
                } else {
                    $(this).val('');
                }
            }
            else if (includeHidden) {
                // includeHidden can be the value true, or it can be a selector string
                // indicating a special test; for example:
                //  $('#myForm').clearForm('.special:hidden')
                // the above would clean hidden inputs that have the class of 'special'
                if ((includeHidden === true && /hidden/.test(t)) ||
                    (typeof includeHidden == 'string' && $(this).is(includeHidden))) {
                    this.value = '';
                }
            }
        });
    };

    /**
     * 重置表单
     * @returns {*}
     */
    $.fn.resetForm = function () {
        return this.each(function () {
            if (typeof this.reset == 'function' || (typeof this.reset == 'object' && !this.reset.nodeType)) {
                this.reset();
            }
        });
    };

})(jQuery);