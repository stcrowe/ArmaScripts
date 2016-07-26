 =========================================================================================================
  String Functions Library
  Version: 2.2.1
  Author: Kronzky / www.kronzky.info / kronzky@gmail.com
 =========================================================================================================

  Supplies string handling functions.

 =========================================================================================================

  Installation:

    Place KRON_Strings.sqf into your mission folder. 
       ArmA: My Documents\ArmA\missions\
       VBS2: My Documents\VBS2\MPmissions\

 =========================================================================================================

  Initialization:

    The library must be loaded once before it can be used.
    Either in your init.sqs, or in your specific script, put the following code:
      nul=[] execVM "KRON_Strings.sqf";   

 =========================================================================================================

  Usage:

    • KRON_StrToArray
        Converts a string into an array of characters.
          _array=[_str] call KRON_StrToArray
          e.g. _array=["abc"] call KRON_StrToArray / _array will be: ["a","b","c"]

    • KRON_StrLen
        Returns the length of the string.
          _len=[_str] call KRON_StrLen
          e.g. _len=["abcdefg"] call KRON_StrLen / _len will be: 7

    • KRON_StrLeft
        Returns l characters from the left side of the string. 
          _left=[_str,l] call KRON_StrLeft
          e.g. _left=["abcdefg",3] call KRON_StrLeft / _left will be: "abc"

    • KRON_StrRight
        Returns l characters from the right side of the string. 
          _right=[_str,l] call KRON_StrRight
          e.g. _right=["abcdefg",3] call KRON_StrRight / _right will be: "efg"

    • KRON_StrMid
        Returns l characters from the middle of the string, starting at position p.
        If l is not defined, all characters until the end of the string will be returned.
        The first position in the string is zero (0)
          _mid=[_str,p,(l)] call KRON_StrMid
          e.g. _mid=["abcdefg",1,3] call KRON_StrMid / _mid will be: "bcd"

    • KRON_StrInStr
        Tests whether string b is present in string a.
        Returns (true) if found, or (false) if not.
          _found=[a,b] call KRON_StrInStr
          e.g. _found=["abcdefg","cd"] call KRON_StrInStr / _found will be: 'true'

    • KRON_StrIndex   
        Returns the position of string b in string a (first position in string is 0)
        	_index=[a,b] call KRON_StrIndex
          e.g. _index=["abcdefg","cd"] call KRON_StrIndex / _index will be: 2

    • KRON_Replace    
    		Replaces every occurrence of string _old in string _str with string _new
        _index=[_str,_old,_new] call KRON_Replace
          e.g. _new=["abcabc","b","XXX"] call KRON_Replace / _new will be: "aXXXcaXXXc"

    • KRON_StrUpper
        Converts a string to uppercase characters.
          _upper=[_str] call KRON_StrUpper
          e.g. _upper=["ab12XY"] call KRON_StrUpper / _upper will be: "AB12XY"

    • KRON_StrLower
        Converts a string to lowercase characters.
          _lower=[_str] call KRON_StrLower
          e.g. _lower=["ab12XY"] call KRON_StrLower / _lower will be: "ab12xy"

    • KRON_FindFlag   
        Checks a mixed array (_this) for the presence of a string (_str).
        Returns (true) if found, or (false) if not.
          _flg=[_this,_str] call KRON_FindFlag
          e.g. _this=[1,100,"slow",false]; _flg=[_this,"slow"] call KRON_FindFlag / _flg will be true
          
    • KRON_getArg     
        Returns an argument value from a mixed array (_arr)
          (An argument is a string part that is preceded by a tag (t) and a separator (":"))
        A default return string (d) can be defined.
          _arg=[_arr,t,(d)] call KRON_getArg
          e.g. _this=[1,100,"min:100",false]; _arg=[_this,"min"] call KRON_getArg / _arg will be "100"

    • KRON_getArgRev     
        Returns a tag from a mixed array (_arr) [reverse of KRON_getArg]
          (A tag is a string part that precedes a separator (":"))
        A default return string (d) can be defined.
          _arg=[_arr,t,(d)] call KRON_getArgRev
          e.g. _this=[1,100,"min:100",false]; _arg=[_this,"100"] call KRON_getArg / _arg will be "min"

    • KRON_Compare    
        Compares two elements and returns -1 if first is smaller, 1 if second is smaller, and 0 if equal
        Element can be Boolean, Number, String or Side
        If optional parameter "case" is given, capitalization is considered (upper before lowercase)
        	_cmp=[_str1,_str2,("case")] call KRON_Compare
          e.g. _cmp=["bbb","aaa"] call KRON_Compare / _cmp will be 1 (2nd element is smaller)

    • KRON_ArraySort  
    		Sorts an array of strings in acsending order (Numbers before letters, uppercase before lowercase)
        If array is multi-dimensional, optional parameter (_idx) specifies which column is used for sorting
        If optional parameter "desc" is given, order is reversed 
        If optional parameter "case" is given, capitalization is considered (upper before lowercase)
        	_srt=[_arr,(_idx),("desc"),("case")] call KRON_ArraySort
          Examples:
          _arr=["bbb","aaa","ccc"]; _srt=[_arr] call KRON_ArraySort / _srt will be ["aaa","bbb","ccc"]
          _arr=["bbb","aaa","ccc"]; _srt=[_arr,"desc"] call KRON_ArraySort / _srt will be ["ccc","bbb","aaa"] (reverse order)
          _arr=[["bbb",2],["aaa",3],["ccc",1]]; _srt=[_arr] call KRON_ArraySort / _srt will be [["aaa",3],["bbb",2],["ccc",1]] (sorted on 0th index = string)
          _arr=[["bbb",2],["aaa",3],["ccc",1]]; _srt=[_arr,1] call KRON_ArraySort / _srt will be [["ccc",1],["bbb",2],["aaa",3]] (sorted on 1st index = number)


 =========================================================================================================

  Examples:

    A demo mission (KRON_Strings_Demo.Intro) is included in this package.
    It contains a script (strtst.sqf) with several sample calls for each of the functions.
    To install this mission, copy the whole folder into your mission directory (..\ArmA\Missions\)
    and then open it from the editor.

 =========================================================================================================