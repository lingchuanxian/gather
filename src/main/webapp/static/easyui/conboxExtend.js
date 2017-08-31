$.extend($.fn.combobox.methods, {

    setIndex: function (jq, index) {

        if (!index)

            index = ;

        var data = $(jq).combobox('options').data;

        var vf = $(jq).combobox('options').valueField;

        $(jq).combobox('setValue', eval('data[index].' + vf));

    },

    getIndex: function (jq) {

        var index = ;

        var data = $(jq).combobox('options').data;

        var vf = $(jq).combobox('options').valueField;

        var value = $(jq).combobox('getValue');

        if (data != null && data.length != null) {

            for (var i = ; i < data.length; i++) {

                if (value == eval('data[i].' + vf))

                    index = i;

            }

        }

        return index;

    }

});