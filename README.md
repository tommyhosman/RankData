# RankData
```
rank = RankData(data, alongDim, invalidRank)
```

Matlab function to rank each element of data.

Handles all data types accepted by matlab function unique.


## Inspiration

Inspired by procrastination and this [pick-of-the-week blog post](https://blogs.mathworks.com/pick/2022/03/11/rankerdata) to create a simple function that ranks data but simpler, much faster, and without the limitations from the previous submission.

## Params

 - `alongDim` [default `[]`] - If empty, rank across all entries. If not empty, rank along entries for the specified dim
 - `invalidRank` [default `NaN`] - Value invalid entries are set to.

 


## Examples

Example 1


```
data = randn(2,3,4);
rank = RankData( data )
```

Example 2

Shows how repeated and invalid entries are handled.

```
data = [10 nan 11 nan nan 1 2 5 1 7];
rank = RankData(data)
```

Example 3

Shows how data types like `categorical` and its invalid data can be naturally handled.


```
data = randn(5);
data = discretize(data,linspace(0,1,10),'categorical');
rank = RankData(data)
```

Example 4

Output similar to tiedrank. While we demonstrate matched results, RankData can handle non numeric entries.

```
data = rand(3,4,2);
data(3,:,:) = data(2,:,:); % Match entries to force ties
alongDim = 1;
rank = tiedrank(RankData(data,alongDim));
isequal(rank,tiedrank(data))
```
