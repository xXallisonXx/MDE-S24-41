%{
Function to model the channel effects of input signal x. This function will
add a time delay to the samplles in x and will add noise to it

%}

function [y] = channel(x, noise, sampleDelay)
    x = x/max(x); %normalize x peak to 1
    y = circshift(x, sampleDelay);
    y(1:sampleDelay) = 0;
    n = noise * complex(randn(length(x),1), randn(length(x),1));
    y = y + n;
    y = y/max(y);
end