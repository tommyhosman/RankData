# RankData
```
rank = RankData(data, setInvalidToNanRank)
```

Matlab function to rank each element of data.

Handles all data types accepted by matlab function unique.


## Inspiration

Inspired by procrastination and this [pick-of-the-week blog post](https://blogs.mathworks.com/pick/2022/03/11/rankerdata) to create a simple function that ranks data but simpler, much faster, and without the limitations from the previous submission.

## Params

`setInvalidToNanRank` [default `false`] 

 - If false, invalid entries are set to `-1`. 
 - If true, invalid entries are set to `NaN`. 


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
rankNaN = RankData(data, true)
```

Example 3

Shows how data types like `categorical` and its invalid data can be naturally handled.


```
data = randn(5);
data = discretize(data,linspace(0,1,10),'categorical');
rank = RankData(data)
```


