$(document).ready(function(){
    var ghCRM = {
        init: function(){
            //init gradual fader for line items
            gradualFader.init();
            $('.limit').click(function(){
                    struct_id = $(this).parent().attr('id');
                    fetch_element = "#" + struct_id;

                    //console.log("HTML:" + $(this).html() + "  fetch_element: " + fetch_element + "  parentid: " + struct_id);

                    //set variables
                    CRMstoreVars( this.className, $(this).html(), struct_id );
                    GHCRMServerCall( struct_id, fetch_element );
                    
                    //set the clicked limit to selected, turn off all others
                    $(fetch_element + ' a.selected').removeClass('selected');    
                    $(this).addClass('selected');
            });

            $('.sort').click(function(){        
                struct_id = $(this).parent().attr('id');
                fetch_element = "#" + struct_id;

                //set variables
                CRMstoreVars( this.className, $(this).html(), struct_id );
                GHCRMServerCall( struct_id, fetch_element );
            });
            ghCRM.saveState();
        },
        saveState : function(){
            //get cookie
            var current_cookie = $.cookie( "ghcrm_tab" );
            var current_tab = '#crm_tab_content-0';

            if ( current_cookie )
            {
                current_tab = current_cookie;
            }
            else
            {
                $.cookie( "ghcrm_tab", current_tab );
            }
            //select the current tab.. on page load
            //$(current_tab + ' a.limit').addClass('selected');

            //set the current tab as the selected tab on page load
            // loop through .items and .sub_items and find "a"
            $(".items").each(function(){
                var myAnchor = $(this).find("a.tab_header");
                var tabId = myAnchor.attr("name");
                $(tabId + ' .tablesorter').tablesorter();

                //if myAnchor attribute name is equal to current_tab then add selected to li
                if (myAnchor.attr("name") == current_tab){
                    $(this).addClass("selected");
                
                    //if anchors parent has a class of sub_items then add selected to parent li
                    if (myAnchor.parent().hasClass("sub_items")){
                        myAnchor.parent().addClass("selected");
                    }
                }
            });

            //handler for tab clicks and sub tab clicks
            $(".items a").click(function(e){
                //handle the show/hide
                var tab_id = $(this).attr('name');
                $('.tab_container').hide();
                $( tab_id ).show();

                //save the state
                $.cookie( "ghcrm_tab", tab_id );

                //handle the css
                $("li.selected").removeClass("selected");
                $(this).parent().addClass("selected");
                e.preventDefault();
            })
            $(".sub_items a").click(function(e){
                //handle the show/hide
                var tab_id = $(this).attr('name');
                $('.tab_container').hide();
                $( tab_id ).show();

                //save the state
                $.cookie( "ghcrm_tab", tab_id );

                //handle the css
                $("li.selected").removeClass("selected");
                $(this).parent().addClass("selected");
                $(this).parent().parent().parent().addClass("selected");
                e.preventDefault();
            })

            //initially, show the correct container
            $(current_tab).show();
        }
    };
    ghCRM.init();
    if( $('span.stars') != undefined )
    {
        $('span.stars').stars();
    }

//handler for up and down arrow in admin preview interface
$('.downbutton a').click(function(e){
    //hide downbutton
    $(this).parent().hide();

    //show upbutton
    $(this).parent().parent().find('.upbutton').show();

    //show container
    $(this).parent().parent().parent().find('.container').show();

    //prevent from jumping
    e.preventDefault();
})
$('.upbutton a').click(function(e){
    //hide upbutton
    $(this).parent().hide();

    //show downbutton
    $(this).parent().parent().find('.downbutton').show();

    //hide container
    $(this).parent().parent().parent().find('.container').hide();

    //prevent from jumping
    e.preventDefault();
})

});

function CRMstoreVars( innervar, v, struct_id ){
    obj = window[struct_id];
    obj[innervar] = v;
}

function GHCRMServerCall( struct_id, fetch_element ){
    obj = window[struct_id];

    $.ez( 'ghcrmfetch::ghcrm_get_dataset', {class_id: obj.class_id, sort_order: obj.sort, sort_by: obj.field, limit: obj.limit}, function( ezp_data )
    {
        if ( ezp_data.error_text )
        {
            $( fetch_element ).parent().parent().find("table > tbody" ).html( ezp_data.error_text );
        }
        else
        {
            $( fetch_element ).parent().parent().find("table > tbody" ).html( ezp_data.content );
        }
    });
    //let the plugin know we updated the data.
    $( fetch_element ).parent().parent().find( ".tablesorter" ).trigger("update");
}
$.fn.stars = function(){
    return $(this).each(function() {
        // Get the value
        var val = parseFloat($(this).html());

        val = Math.round(val * 4) / 4; //Round to nearest quarter

        // Make sure that the value is in 0 - 5 range, multiply to get width
        var size = Math.max(0, (Math.min(5, val))) * 16;

        // Create stars holder
        var $span = $('<span />').width(size);
    
        // Replace the numerical value with stars
        $(this).html($span);
    });
}

