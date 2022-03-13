function rank = RankData(data, setInvalidToNanRank)
% rank = RankData(data, setInvalidToNanRank)
%
% Returns the rank for each element in data.
%
% Matched entries have the same integer rank (this differs from tiedrank).
% Invalid values (Nan,missing,etc.) are set to -1 or set to Nan if setInvalidToNanRank is true.
% 
% Handles all data types accepted by matlab function unique.
%
% 
% Example 1
%
% data = randn(3,4,5);
% rank = RankData(data); 
%
% Example 2
%
% data = [10 nan 11 nan nan 1 2 5 1 7];
% rank = RankData(data)
% rankNaN = RankData(data, true)
%
% 
% See also: unique, tiedrank
% 
%--------------------------------------------------------------------------
% History:
%   2022.03   Copyright Tommy Hosman, All Rights Reserved
%--------------------------------------------------------------------------


    if nargin < 2
        setInvalidToNanRank = false;
    end
    
    if setInvalidToNanRank
        invalidRank = NaN;
    else
        invalidRank = -1;
    end
    
    
    % Find rank order
    [u,~,rank] = unique(data(:));
    
    
    % Set rank for missing entries (nan, invalid, etc.)
    nValid = sum(~ismissing(u));
    rank(rank>nValid) = invalidRank;
    

    % Reshape to original
    rank = reshape(rank,size(data));
end