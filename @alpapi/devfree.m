function alp_returnvalue = devfree(obj, deviceid)
    %  Deallocates a previously allocated ALP device
    %
    %  See also:
    %     devalloc, devhalt
    %
    %  File information:
    %     version 1.0 (feb 2014)
    %     (c) Martin Vogel
    %     email: matlab@martin-vogel.info
    %
    %  Revision history:
    %     1.0 (feb 2014) initial release version
    
    if nargin < 2
        
        alp_returnvalue = obj.MISSING_PARAMETERS;
        obj.log('log', sprintf('Not enough parameters in call to AlpDevFree(): %i given, %i needed.', ...
            nargin, 2));
        
    else
        
        if obj.pseudoDLL
            alp_returnvalue = obj.OK;
        else
            if isempty(obj.libalias)
                alp_returnvalue =  obj.LIBRARY_NOT_LOADED;
            else
                % call DLL function
                alp_returnvalue = calllib(obj.libalias, 'AlpDevFree', deviceid);
            end
        end
        
        obj.log('log', sprintf('[alp_returnvalue=%i] = AlpDevFree(deviceid=%i)', ...
            alp_returnvalue, deviceid));
        
    end
    
end


