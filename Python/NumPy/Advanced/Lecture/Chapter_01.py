
                                 #   Chapter - 1 : Introduction 





# ::  List is much slow while considering the large data sets in comparison of numpy array : 



# python_list = [1, 2, 3, 4 , 5]  # --> list

# print(python_list) # output :  [1, 2, 3, 4, 5]



# import numpy as np 

# numpy_array = np.array([1,2,3,4,5])   # --> array
# print(numpy_array)  # output : [1 2 3 4 5]





# ______________________________________________________________________________________________________________________________________





# One-dimensional array : 

# import numpy as np 

# arr_1d = np.array([10 , 20 , 30 ,40 , 50])

# print(arr_1d)






# Two-dimensional array : 

# arr_2d = np.array([[1,2,3] ,  [7,8,9]])

# print(arr_2d)  # output : [[1 2 3]
#                         # [7 8 9]]





# Multi-dimensional array : 



# import numpy as np 

# matrix = np.array([ [1,2,4] , [4,5,6]])

# print(matrix)
# output : [[1 2 4]
        #  [4 5 6]]





















# ______________________________________________________________________________________________________________________________________




# :: Creating array from python lists : 

# Syntax :  np.array([element1 , element2 , element3 ,element4])

# import numpy as np 

# arr = np.array([1,2,3,4])
# print(arr)  # output : [1 2 3 4]





# :--> With default values : 








# - Ex :  (zeroes value)


# import numpy as np 

# zeros_array = np.zeros(3)
# zeros_array1 = np.zeros(3,4)   #--> 2d sized array making is not possible

# print(zeros_array)  # output : [0. 0. 0.]
# print(zeros_array1)








# - Ex :  (Ones value)


# import numpy as np 



# ones_array = np.ones(2)
# ones_array1 = np.ones((2,3))



# print(ones_array) # output : [1. 1.]

# print(ones_array1)  # --> 2d sized array making is possible. 
# output : [[1. 1. 1.]
        #  [1. 1. 1.]]












# - Ex :  ( specific value )


# import numpy as np 

# filled_array = np.full((2,2),7)

# print(filled_array)
# # output : [[7 7]
        #   [7 7]]






# ______________________________________________________________________________________________________________________________________



# :: Creating sequences of numbers in numpy : 

# - by using the arange() function   / alternative of range() function. 
# - syntax : np.arange(start , stop , step)


# - Ex: 

# import numpy as np 

# arr = np.arange(1 , 10 , 2)

# print(arr)  # output : [1 3 5 7 9]




# ______________________________________________________________________________________________________________________________________


# :: Creating identity matrix : 
# - identity matrix is a square matrix which contain one at the leading diagonal and 0 elsewhere.
# - Syntax:  np.eye(size)

# - Ex : 


# import numpy as np 

# identity_matrix = np.eye(4)
# print(identity_matrix)
# # output : 
# [[1. 0. 0. 0.]
#  [0. 1. 0. 0.]
#  [0. 0. 1. 0.]
#  [0. 0. 0. 1.]]






# ______________________________________________________________________________________________________________________________________



