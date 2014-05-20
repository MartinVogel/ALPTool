function alp_returnvalue = projcontrol(obj, deviceid, controltype, controlvalue)
    %  Changes system parameters of an ALP system
    %
    %  See also:
    %     projinquire
    %
    %  File information:
    %     version 1.0 (feb 2014)
    %     (c) Martin Vogel
    %     email: matlab@martin-vogel.info
    %
    %  Revision history:
    %     1.0 (feb 2014) initial release version
    
    if nargin < 4
        
        alp_returnvalue = obj.MISSING_PARAMETERS;
        obj.log('log', sprintf('Not enough parameters in call to AlpProjControl(): %i given, %i needed.', ...
            nargin, 4));
        
    else
        
        if obj.pseudoDLL
            alp_returnvalue = obj.OK;
        else
            if isempty(obj.libalias)
                alp_returnvalue =  obj.LIBRARY_NOT_LOADED;
            else
                % call DLL function
                alp_returnvalue = calllib(obj.libalias, 'AlpProjControl', ...
                    deviceid, controltype, controlvalue);
            end
        end
        
        obj.log('log', sprintf(['[alp_returnvalue=%i] = AlpProjControl(deviceid=%i, ', ...
            'controltype=%i, controlvalue=%i)'], ...
            alp_returnvalue, deviceid, controltype, controlvalue));
        
    end
    
end


