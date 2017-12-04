## find dupicates in a list

    _loadedProducts.GroupBy(g => g.Item1).Where(g => g.Count() > 1).Select(g => g.Key);
