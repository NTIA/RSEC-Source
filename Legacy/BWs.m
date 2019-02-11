function B = BWs(f,S,b,interpolate)
% f is freq vector (MHz); S is power vector (dB), b is X dB vector
% If dY is large from point to point, interpolation may not the best choice
% interpolate = 1 to interpolate X dB bandwidths between data points
% interpolate = 0 to use outermost points for X dB bandwidths
len=length(S);

if max(S) ~= 0
    S=S-max(S);
end
for i=1:length(b)
    u=find(S>-b(i), 1, 'last' );v=find(S>-b(i), 1 );
    if u==len || v==1
        B(i)=0; %#ok<*AGROW>
    else
        if interpolate
            B(i)=interp1(S(u:u+1),f(u:u+1),-b(i))-interp1(S(v-1:v),...
                f(v-1:v),-b(i));
        else
            B(i) = f(u+1) - f(v-1);
        end
    end
end