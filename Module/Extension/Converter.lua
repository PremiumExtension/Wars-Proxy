---# WARNING
---# WARNING
---# WARNING
---#
---# !!!CORE USE ONLY!!!
---# You have to use this using the Command Output.
---# Ex.
---#    require(path to the module).SITTI(Dictionary,{'Index',["123"]=546})
---# !!!CORE USE ONLY!!!
---# 
---# WARNING
---# WARNING
---# WARNING


---@class STRINGINDEX_TO_TABLEINDEX
---@field Convert your Strings to a Table
function STRINGINDEX_TO_TABLEINDEX(Dic:Table,Idx:String)
    local INDEXTEMPLATE = ""
    local FINAL --?
    for NME, IDX in pairs (Idx) do
        if type (IDX) == 'table' then
            INDEXTEMPLATE = INDEXTEMPLATE.."[\""..NME.."\"]={}"
        elseif type (IDX) == 'string' then
            if (NME) == 'number' then
                INDEXTEMPLATE = INDEXTEMPLATE.."\""..IDX.."\""
            else
                INDEXTEMPLATE = INDEXTEMPLATE.."[\""..NME.."\"]=".."\""..IDX.."\""
            end
        elseif type (IDX) == 'vector' then
            if IDX.Z then
                INDEXTEMPLATE = INDEXTEMPLATE.."[\""..NME.."\"]=Vector3.new("..IDX.X..','..IDX.Y..','..IDX.Z..')'
            else
                INDEXTEMPLATE = INDEXTEMPLATE.."[\""..NME.."\"]=Vector2.new("..IDX.X..','..IDX.Y')'
            end
        elseif type (IDX) == 'userdata' then
            if IDX.Scale then
                INDEXTEMPLATE = INDEXTEMPLATE.."[\""..NME.."\"]=UDim.new("..IDX.Scale..','..IDX.Offset..')'
            else
                INDEXTEMPLATE = INDEXTEMPLATE.."[\""..NME.."\"]=UDim2.new("..IDX.X.Scale..','..IDX.X.Offset..','..IDX.Y.Scale..','..IDX.Y.Scale..')'
            end
        else -- Boolean, Int64, Int32, Number, Object
            if (NME) == 'number' then
                INDEXTEMPLATE = INDEXTEMPLATE..""..IDX..""
            else
                INDEXTEMPLATE = INDEXTEMPLATE.."[\""..NME.."\"]="..""..IDX..""
            end
        end
    end
    local TABLEINDEX = ""
    for place, qoute in pairs (tbl:split([[

    ]])) do
        FINAL = '["'..qoute:match('^".*"$')..'"]={'..INDEXTEMPLATE..'},'
    end
    return FINAL
end

return {
    SITTI = STRINGINDEX_TO_TABLEINDEX
}