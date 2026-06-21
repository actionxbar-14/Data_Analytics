


                                                #   Chapter : 05 [ Broadcasting & Vectorization ]





# :: Broadcasting : 
# - broadcasting is a numpy way where we can apply operations on array directly. 

# - Ex : { using loops  - Too slow }


# prices = [100 , 200 , 300]

# discount =  10  #--> 10 % discount 

# final_prices = []

# for price in prices:
#     final_price = price - (price * discount/100)
#     final_prices.append(final_price)


# print(final_prices)  # output : [90.0, 180.0, 270].




# - Ex : { using broadcasting }


# import numpy as np 

# prices = np.array([100 , 200 , 300])

# discount = 10 # scaler single value 

# final_prices = prices - (prices * discount / 100)

# print(final_prices)  # output : [90.0, 180.0, 270].






# NOTE : Rule for broadcasting : 

# 1. meeting dimensions. 

# 2. Expanding single elements. 

# 3. incompatible shapes. 


# _____________________________________________________________________________________________________________________________________



# :: broadcasting from 1D to 2D array :  


# - Ex:  (adding of different dimension array ( 2D array --> 1D array))  

# import numpy as np 

# matrix = np.array( [ [1,2,3] , [4,5,6] ])

# vector =  np.array([10 , 20 , 30])

# result = matrix + vector  

# print(result)
# output :

# [[11 22 33]
#  [14 25 36]]






# :: NOTE : incompatible shapes gives an Error : 


# - Ex : 

# import numpy as np 

# arr1 = np.array( [ [1,2,3] , [4,5,6] ])   # shape (2 , 3)

# arr2 =  np.array([10 , 20])    # shape (2 , )

# result = arr1 +  arr2 

# print(result)
# # output : 

#   File "c:\Users\ANUBHAV\Data_Analytics\NumPy\Advanced\Lecture\Chapter_05.py", line 92, in <module>
#     result = arr1 +  arr2
#              ~~~~~^~~~~~~
# ValueError: operands could not be broadcast together with shapes (2,3) (2,) 







# _____________________________________________________________________________________________________________________________________



# :: vectorization : 


# - Use for perfroming fast calculation in the array. 



# - Ex :  [ using list method -- Too slow ]


# list1 = [1,2,3]
# list2 = [4,5,6]

# result = [x+y for x , y in zip(list1 , list2)]

# print(result)  # output : [5, 7, 9]





# - Ex : vectorize addition


# import numpy as np 

# arr1 = np.array([1,2,3])
# arr2 = np.array([4,5,6])


# result = arr1 + arr2 

# print(result) # output : [5 7 9]




# - Ex : vectorize multiplication



# import numpy as np 

# arr = np.array([10 ,20 ,40])
# multiplied =  arr * 3 

# print(multiplied)  # output : [ 30  60 120]