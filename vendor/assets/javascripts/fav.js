/* jQuery Star Rating Plugin
 * 
 * @Author
 * Copyright Nov 02 2010, Irfan Durmus - http://irfandurmus.com/
 *
 * @Version
 * 0.3b
 *
 * @License
 * Dual licensed under the MIT or GPL Version 2 licenses.
 *
 * Visit the plugin page for more information.
 * http://irfandurmus.com/projects/jquery-star-rating-plugin/
 *
 */

;(function($){
    $.fn.fav = function(callback){
        
        callback = callback || function(){};

        // each for all item
        this.each(function(i, v){
            
            $(v).data('fav', {callback:callback})
                .bind('init.fav', $.fn.fav.init)
                .bind('set.fav', $.fn.fav.set)
                .bind('hover.fav', $.fn.fav.hover)
                .trigger('init.fav');
        });
    };
    
    $.extend($.fn.fav, {
        init: function(e){
            var el = $(this),
                list = '',
                isChecked = null,
                childs = el.children(),
                i = 0,
                l = childs.length;
            
            for (; i < l; i++) {
                list = list + '<a class="heart" title="' + $(childs[i]).val() + '" />';
                if ($(childs[i]).is(':checked')) {
                    isChecked = $(childs[i]).val();
                };
            };
            
            childs.hide();
            
            el
                .append('<div class="hearts">' + list + '</div>')
                .trigger('set.fav', isChecked);
            
            $('a', el).bind('click', $.fn.fav.click);            
            el.trigger('hover.fav');
        },
        set: function(e, val) {
            var el = $(this),
                item = $('a', el),
                input = undefined;
            
            if (val) {
                item.removeClass('fullHeart');
                
                input = item.filter(function(i){
                    if ($(this).attr('title') == val)
                        return $(this);
                    else
                        return false;
                });
                
                input
                    .addClass('fullHeart')
                    .prevAll()
                    .addClass('fullHeart');
            }
            
            return;
        },
        hover: function(e){
            var el = $(this),
                hearts = $('a', el);
            
            hearts.bind('mouseenter', function(e){
                // add tmp class when mouse enter
                $(this)
                    .addClass('tmp_fs')
                    .prevAll()
                    .addClass('tmp_fs');
                
                $(this).nextAll()
                    .addClass('tmp_es');
            });
            
            hearts.bind('mouseleave', function(e){
                // remove all tmp class when mouse leave
                $(this)
                    .removeClass('tmp_fs')
                    .prevAll()
                    .removeClass('tmp_fs');
                
                $(this).nextAll()
                    .removeClass('tmp_es');
            });
        },
        click: function(e){
            e.preventDefault();
            var el = $(e.target),
                container = el.parent().parent(),
                inputs = container.children('input'),
                op = el.attr('title');
                
            matchInput = inputs.filter(function(i){
                if ($(this).val() == op)
                    return true;
                else
                    return false;
            });
            
            matchInput.attr('checked', true);
            
            container
                .trigger('set.fav', matchInput.val())
                .data('fav').callback(op, e);
        }
    });
    
})(jQuery);
