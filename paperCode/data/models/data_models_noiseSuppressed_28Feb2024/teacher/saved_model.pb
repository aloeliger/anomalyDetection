ȅ
��
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( �
�
AvgPool

value"T
output"T"
ksize	list(int)(0"
strides	list(int)(0""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW"
Ttype:
2
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
�
Conv2D

input"T
filter"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
�
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( �
?
Mul
x"T
y"T
z"T"
Ttype:
2	�

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype�
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
�
ResizeNearestNeighbor
images"T
size
resized_images"T"
Ttype:
2
	"
align_cornersbool( "
half_pixel_centersbool( 
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
�
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ��
@
StaticRegexFullMatch	
input

output
"
patternstring
�
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
�
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 �"serve*2.10.02v2.10.0-rc3-6-g359c3cdfc5f8��
�
Adam/teacher_outputs/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*,
shared_nameAdam/teacher_outputs/bias/v
�
/Adam/teacher_outputs/bias/v/Read/ReadVariableOpReadVariableOpAdam/teacher_outputs/bias/v*
_output_shapes
:*
dtype0
�
Adam/teacher_outputs/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_nameAdam/teacher_outputs/kernel/v
�
1Adam/teacher_outputs/kernel/v/Read/ReadVariableOpReadVariableOpAdam/teacher_outputs/kernel/v*&
_output_shapes
:*
dtype0
�
Adam/teacher_conv2d_4/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_nameAdam/teacher_conv2d_4/bias/v
�
0Adam/teacher_conv2d_4/bias/v/Read/ReadVariableOpReadVariableOpAdam/teacher_conv2d_4/bias/v*
_output_shapes
:*
dtype0
�
Adam/teacher_conv2d_4/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*/
shared_name Adam/teacher_conv2d_4/kernel/v
�
2Adam/teacher_conv2d_4/kernel/v/Read/ReadVariableOpReadVariableOpAdam/teacher_conv2d_4/kernel/v*&
_output_shapes
:*
dtype0
�
Adam/teacher_conv2d_3/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_nameAdam/teacher_conv2d_3/bias/v
�
0Adam/teacher_conv2d_3/bias/v/Read/ReadVariableOpReadVariableOpAdam/teacher_conv2d_3/bias/v*
_output_shapes
:*
dtype0
�
Adam/teacher_conv2d_3/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*/
shared_name Adam/teacher_conv2d_3/kernel/v
�
2Adam/teacher_conv2d_3/kernel/v/Read/ReadVariableOpReadVariableOpAdam/teacher_conv2d_3/kernel/v*&
_output_shapes
:*
dtype0
�
Adam/teacher_dense/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:�**
shared_nameAdam/teacher_dense/bias/v
�
-Adam/teacher_dense/bias/v/Read/ReadVariableOpReadVariableOpAdam/teacher_dense/bias/v*
_output_shapes	
:�*
dtype0
�
Adam/teacher_dense/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	P�*,
shared_nameAdam/teacher_dense/kernel/v
�
/Adam/teacher_dense/kernel/v/Read/ReadVariableOpReadVariableOpAdam/teacher_dense/kernel/v*
_output_shapes
:	P�*
dtype0
�
Adam/teacher_latent/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:P*+
shared_nameAdam/teacher_latent/bias/v
�
.Adam/teacher_latent/bias/v/Read/ReadVariableOpReadVariableOpAdam/teacher_latent/bias/v*
_output_shapes
:P*
dtype0
�
Adam/teacher_latent/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�P*-
shared_nameAdam/teacher_latent/kernel/v
�
0Adam/teacher_latent/kernel/v/Read/ReadVariableOpReadVariableOpAdam/teacher_latent/kernel/v*
_output_shapes
:	�P*
dtype0
�
Adam/teacher_conv2d_2/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_nameAdam/teacher_conv2d_2/bias/v
�
0Adam/teacher_conv2d_2/bias/v/Read/ReadVariableOpReadVariableOpAdam/teacher_conv2d_2/bias/v*
_output_shapes
:*
dtype0
�
Adam/teacher_conv2d_2/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*/
shared_name Adam/teacher_conv2d_2/kernel/v
�
2Adam/teacher_conv2d_2/kernel/v/Read/ReadVariableOpReadVariableOpAdam/teacher_conv2d_2/kernel/v*&
_output_shapes
:*
dtype0
�
Adam/teacher_conv2d_1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_nameAdam/teacher_conv2d_1/bias/v
�
0Adam/teacher_conv2d_1/bias/v/Read/ReadVariableOpReadVariableOpAdam/teacher_conv2d_1/bias/v*
_output_shapes
:*
dtype0
�
Adam/teacher_conv2d_1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*/
shared_name Adam/teacher_conv2d_1/kernel/v
�
2Adam/teacher_conv2d_1/kernel/v/Read/ReadVariableOpReadVariableOpAdam/teacher_conv2d_1/kernel/v*&
_output_shapes
:*
dtype0
�
Adam/teacher_outputs/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*,
shared_nameAdam/teacher_outputs/bias/m
�
/Adam/teacher_outputs/bias/m/Read/ReadVariableOpReadVariableOpAdam/teacher_outputs/bias/m*
_output_shapes
:*
dtype0
�
Adam/teacher_outputs/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_nameAdam/teacher_outputs/kernel/m
�
1Adam/teacher_outputs/kernel/m/Read/ReadVariableOpReadVariableOpAdam/teacher_outputs/kernel/m*&
_output_shapes
:*
dtype0
�
Adam/teacher_conv2d_4/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_nameAdam/teacher_conv2d_4/bias/m
�
0Adam/teacher_conv2d_4/bias/m/Read/ReadVariableOpReadVariableOpAdam/teacher_conv2d_4/bias/m*
_output_shapes
:*
dtype0
�
Adam/teacher_conv2d_4/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*/
shared_name Adam/teacher_conv2d_4/kernel/m
�
2Adam/teacher_conv2d_4/kernel/m/Read/ReadVariableOpReadVariableOpAdam/teacher_conv2d_4/kernel/m*&
_output_shapes
:*
dtype0
�
Adam/teacher_conv2d_3/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_nameAdam/teacher_conv2d_3/bias/m
�
0Adam/teacher_conv2d_3/bias/m/Read/ReadVariableOpReadVariableOpAdam/teacher_conv2d_3/bias/m*
_output_shapes
:*
dtype0
�
Adam/teacher_conv2d_3/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*/
shared_name Adam/teacher_conv2d_3/kernel/m
�
2Adam/teacher_conv2d_3/kernel/m/Read/ReadVariableOpReadVariableOpAdam/teacher_conv2d_3/kernel/m*&
_output_shapes
:*
dtype0
�
Adam/teacher_dense/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:�**
shared_nameAdam/teacher_dense/bias/m
�
-Adam/teacher_dense/bias/m/Read/ReadVariableOpReadVariableOpAdam/teacher_dense/bias/m*
_output_shapes	
:�*
dtype0
�
Adam/teacher_dense/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	P�*,
shared_nameAdam/teacher_dense/kernel/m
�
/Adam/teacher_dense/kernel/m/Read/ReadVariableOpReadVariableOpAdam/teacher_dense/kernel/m*
_output_shapes
:	P�*
dtype0
�
Adam/teacher_latent/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:P*+
shared_nameAdam/teacher_latent/bias/m
�
.Adam/teacher_latent/bias/m/Read/ReadVariableOpReadVariableOpAdam/teacher_latent/bias/m*
_output_shapes
:P*
dtype0
�
Adam/teacher_latent/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�P*-
shared_nameAdam/teacher_latent/kernel/m
�
0Adam/teacher_latent/kernel/m/Read/ReadVariableOpReadVariableOpAdam/teacher_latent/kernel/m*
_output_shapes
:	�P*
dtype0
�
Adam/teacher_conv2d_2/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_nameAdam/teacher_conv2d_2/bias/m
�
0Adam/teacher_conv2d_2/bias/m/Read/ReadVariableOpReadVariableOpAdam/teacher_conv2d_2/bias/m*
_output_shapes
:*
dtype0
�
Adam/teacher_conv2d_2/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*/
shared_name Adam/teacher_conv2d_2/kernel/m
�
2Adam/teacher_conv2d_2/kernel/m/Read/ReadVariableOpReadVariableOpAdam/teacher_conv2d_2/kernel/m*&
_output_shapes
:*
dtype0
�
Adam/teacher_conv2d_1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_nameAdam/teacher_conv2d_1/bias/m
�
0Adam/teacher_conv2d_1/bias/m/Read/ReadVariableOpReadVariableOpAdam/teacher_conv2d_1/bias/m*
_output_shapes
:*
dtype0
�
Adam/teacher_conv2d_1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*/
shared_name Adam/teacher_conv2d_1/kernel/m
�
2Adam/teacher_conv2d_1/kernel/m/Read/ReadVariableOpReadVariableOpAdam/teacher_conv2d_1/kernel/m*&
_output_shapes
:*
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
�
teacher_outputs/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*%
shared_nameteacher_outputs/bias
y
(teacher_outputs/bias/Read/ReadVariableOpReadVariableOpteacher_outputs/bias*
_output_shapes
:*
dtype0
�
teacher_outputs/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*'
shared_nameteacher_outputs/kernel
�
*teacher_outputs/kernel/Read/ReadVariableOpReadVariableOpteacher_outputs/kernel*&
_output_shapes
:*
dtype0
�
teacher_conv2d_4/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*&
shared_nameteacher_conv2d_4/bias
{
)teacher_conv2d_4/bias/Read/ReadVariableOpReadVariableOpteacher_conv2d_4/bias*
_output_shapes
:*
dtype0
�
teacher_conv2d_4/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*(
shared_nameteacher_conv2d_4/kernel
�
+teacher_conv2d_4/kernel/Read/ReadVariableOpReadVariableOpteacher_conv2d_4/kernel*&
_output_shapes
:*
dtype0
�
teacher_conv2d_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*&
shared_nameteacher_conv2d_3/bias
{
)teacher_conv2d_3/bias/Read/ReadVariableOpReadVariableOpteacher_conv2d_3/bias*
_output_shapes
:*
dtype0
�
teacher_conv2d_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*(
shared_nameteacher_conv2d_3/kernel
�
+teacher_conv2d_3/kernel/Read/ReadVariableOpReadVariableOpteacher_conv2d_3/kernel*&
_output_shapes
:*
dtype0
}
teacher_dense/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*#
shared_nameteacher_dense/bias
v
&teacher_dense/bias/Read/ReadVariableOpReadVariableOpteacher_dense/bias*
_output_shapes	
:�*
dtype0
�
teacher_dense/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	P�*%
shared_nameteacher_dense/kernel
~
(teacher_dense/kernel/Read/ReadVariableOpReadVariableOpteacher_dense/kernel*
_output_shapes
:	P�*
dtype0
~
teacher_latent/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:P*$
shared_nameteacher_latent/bias
w
'teacher_latent/bias/Read/ReadVariableOpReadVariableOpteacher_latent/bias*
_output_shapes
:P*
dtype0
�
teacher_latent/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�P*&
shared_nameteacher_latent/kernel
�
)teacher_latent/kernel/Read/ReadVariableOpReadVariableOpteacher_latent/kernel*
_output_shapes
:	�P*
dtype0
�
teacher_conv2d_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*&
shared_nameteacher_conv2d_2/bias
{
)teacher_conv2d_2/bias/Read/ReadVariableOpReadVariableOpteacher_conv2d_2/bias*
_output_shapes
:*
dtype0
�
teacher_conv2d_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*(
shared_nameteacher_conv2d_2/kernel
�
+teacher_conv2d_2/kernel/Read/ReadVariableOpReadVariableOpteacher_conv2d_2/kernel*&
_output_shapes
:*
dtype0
�
teacher_conv2d_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*&
shared_nameteacher_conv2d_1/bias
{
)teacher_conv2d_1/bias/Read/ReadVariableOpReadVariableOpteacher_conv2d_1/bias*
_output_shapes
:*
dtype0
�
teacher_conv2d_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*(
shared_nameteacher_conv2d_1/kernel
�
+teacher_conv2d_1/kernel/Read/ReadVariableOpReadVariableOpteacher_conv2d_1/kernel*&
_output_shapes
:*
dtype0
�
serving_default_teacher_inputs_Placeholder*/
_output_shapes
:���������*
dtype0*$
shape:���������
�
StatefulPartitionedCallStatefulPartitionedCallserving_default_teacher_inputs_teacher_conv2d_1/kernelteacher_conv2d_1/biasteacher_conv2d_2/kernelteacher_conv2d_2/biasteacher_latent/kernelteacher_latent/biasteacher_dense/kernelteacher_dense/biasteacher_conv2d_3/kernelteacher_conv2d_3/biasteacher_conv2d_4/kernelteacher_conv2d_4/biasteacher_outputs/kernelteacher_outputs/bias*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *.
f)R'
%__inference_signature_wrapper_6646640

NoOpNoOp
��
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*υ
valueąB�� B��
�
layer-0
layer-1
layer_with_weights-0
layer-2
layer-3
layer-4
layer_with_weights-1
layer-5
layer-6
layer-7
	layer_with_weights-2
	layer-8

layer_with_weights-3

layer-9
layer-10
layer-11
layer_with_weights-4
layer-12
layer-13
layer-14
layer_with_weights-5
layer-15
layer-16
layer_with_weights-6
layer-17
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures*
* 
�
	variables
trainable_variables
regularization_losses
	keras_api
 __call__
*!&call_and_return_all_conditional_losses* 
�
"	variables
#trainable_variables
$regularization_losses
%	keras_api
&__call__
*'&call_and_return_all_conditional_losses

(kernel
)bias
 *_jit_compiled_convolution_op*
�
+	variables
,trainable_variables
-regularization_losses
.	keras_api
/__call__
*0&call_and_return_all_conditional_losses* 
�
1	variables
2trainable_variables
3regularization_losses
4	keras_api
5__call__
*6&call_and_return_all_conditional_losses* 
�
7	variables
8trainable_variables
9regularization_losses
:	keras_api
;__call__
*<&call_and_return_all_conditional_losses

=kernel
>bias
 ?_jit_compiled_convolution_op*
�
@	variables
Atrainable_variables
Bregularization_losses
C	keras_api
D__call__
*E&call_and_return_all_conditional_losses* 
�
F	variables
Gtrainable_variables
Hregularization_losses
I	keras_api
J__call__
*K&call_and_return_all_conditional_losses* 
�
L	variables
Mtrainable_variables
Nregularization_losses
O	keras_api
P__call__
*Q&call_and_return_all_conditional_losses

Rkernel
Sbias*
�
T	variables
Utrainable_variables
Vregularization_losses
W	keras_api
X__call__
*Y&call_and_return_all_conditional_losses

Zkernel
[bias*
�
\	variables
]trainable_variables
^regularization_losses
_	keras_api
`__call__
*a&call_and_return_all_conditional_losses* 
�
b	variables
ctrainable_variables
dregularization_losses
e	keras_api
f__call__
*g&call_and_return_all_conditional_losses* 
�
h	variables
itrainable_variables
jregularization_losses
k	keras_api
l__call__
*m&call_and_return_all_conditional_losses

nkernel
obias
 p_jit_compiled_convolution_op*
�
q	variables
rtrainable_variables
sregularization_losses
t	keras_api
u__call__
*v&call_and_return_all_conditional_losses* 
�
w	variables
xtrainable_variables
yregularization_losses
z	keras_api
{__call__
*|&call_and_return_all_conditional_losses* 
�
}	variables
~trainable_variables
regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses
�kernel
	�bias
!�_jit_compiled_convolution_op*
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses* 
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses
�kernel
	�bias
!�_jit_compiled_convolution_op*
n
(0
)1
=2
>3
R4
S5
Z6
[7
n8
o9
�10
�11
�12
�13*
n
(0
)1
=2
>3
R4
S5
Z6
[7
n8
o9
�10
�11
�12
�13*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
:
�trace_0
�trace_1
�trace_2
�trace_3* 
:
�trace_0
�trace_1
�trace_2
�trace_3* 
* 
�
	�iter
�beta_1
�beta_2

�decay
�learning_rate(m�)m�=m�>m�Rm�Sm�Zm�[m�nm�om�	�m�	�m�	�m�	�m�(v�)v�=v�>v�Rv�Sv�Zv�[v�nv�ov�	�v�	�v�	�v�	�v�*

�serving_default* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
	variables
trainable_variables
regularization_losses
 __call__
*!&call_and_return_all_conditional_losses
&!"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 

(0
)1*

(0
)1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
"	variables
#trainable_variables
$regularization_losses
&__call__
*'&call_and_return_all_conditional_losses
&'"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
ga
VARIABLE_VALUEteacher_conv2d_1/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE*
c]
VARIABLE_VALUEteacher_conv2d_1/bias4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
+	variables
,trainable_variables
-regularization_losses
/__call__
*0&call_and_return_all_conditional_losses
&0"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
1	variables
2trainable_variables
3regularization_losses
5__call__
*6&call_and_return_all_conditional_losses
&6"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 

=0
>1*

=0
>1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
7	variables
8trainable_variables
9regularization_losses
;__call__
*<&call_and_return_all_conditional_losses
&<"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
ga
VARIABLE_VALUEteacher_conv2d_2/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE*
c]
VARIABLE_VALUEteacher_conv2d_2/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
@	variables
Atrainable_variables
Bregularization_losses
D__call__
*E&call_and_return_all_conditional_losses
&E"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
F	variables
Gtrainable_variables
Hregularization_losses
J__call__
*K&call_and_return_all_conditional_losses
&K"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 

R0
S1*

R0
S1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
L	variables
Mtrainable_variables
Nregularization_losses
P__call__
*Q&call_and_return_all_conditional_losses
&Q"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
e_
VARIABLE_VALUEteacher_latent/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE*
a[
VARIABLE_VALUEteacher_latent/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE*

Z0
[1*

Z0
[1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
T	variables
Utrainable_variables
Vregularization_losses
X__call__
*Y&call_and_return_all_conditional_losses
&Y"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
d^
VARIABLE_VALUEteacher_dense/kernel6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUE*
`Z
VARIABLE_VALUEteacher_dense/bias4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
\	variables
]trainable_variables
^regularization_losses
`__call__
*a&call_and_return_all_conditional_losses
&a"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
b	variables
ctrainable_variables
dregularization_losses
f__call__
*g&call_and_return_all_conditional_losses
&g"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 

n0
o1*

n0
o1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
h	variables
itrainable_variables
jregularization_losses
l__call__
*m&call_and_return_all_conditional_losses
&m"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
ga
VARIABLE_VALUEteacher_conv2d_3/kernel6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUE*
c]
VARIABLE_VALUEteacher_conv2d_3/bias4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
q	variables
rtrainable_variables
sregularization_losses
u__call__
*v&call_and_return_all_conditional_losses
&v"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
w	variables
xtrainable_variables
yregularization_losses
{__call__
*|&call_and_return_all_conditional_losses
&|"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 

�0
�1*

�0
�1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
}	variables
~trainable_variables
regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
ga
VARIABLE_VALUEteacher_conv2d_4/kernel6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUE*
c]
VARIABLE_VALUEteacher_conv2d_4/bias4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 

�0
�1*

�0
�1*
* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
f`
VARIABLE_VALUEteacher_outputs/kernel6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUE*
b\
VARIABLE_VALUEteacher_outputs/bias4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
�
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14
15
16
17*

�0*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
LF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE*
NH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE*
^X
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
<
�	variables
�	keras_api

�total

�count*

�0
�1*

�	variables*
SM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_conv2d_1/kernel/mRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_conv2d_1/bias/mPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_conv2d_2/kernel/mRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_conv2d_2/bias/mPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_latent/kernel/mRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
�~
VARIABLE_VALUEAdam/teacher_latent/bias/mPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_dense/kernel/mRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
�}
VARIABLE_VALUEAdam/teacher_dense/bias/mPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_conv2d_3/kernel/mRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_conv2d_3/bias/mPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_conv2d_4/kernel/mRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_conv2d_4/bias/mPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_outputs/kernel/mRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
�
VARIABLE_VALUEAdam/teacher_outputs/bias/mPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_conv2d_1/kernel/vRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_conv2d_1/bias/vPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_conv2d_2/kernel/vRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_conv2d_2/bias/vPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_latent/kernel/vRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
�~
VARIABLE_VALUEAdam/teacher_latent/bias/vPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_dense/kernel/vRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
�}
VARIABLE_VALUEAdam/teacher_dense/bias/vPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_conv2d_3/kernel/vRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_conv2d_3/bias/vPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_conv2d_4/kernel/vRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_conv2d_4/bias/vPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
��
VARIABLE_VALUEAdam/teacher_outputs/kernel/vRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
�
VARIABLE_VALUEAdam/teacher_outputs/bias/vPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
�
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename+teacher_conv2d_1/kernel/Read/ReadVariableOp)teacher_conv2d_1/bias/Read/ReadVariableOp+teacher_conv2d_2/kernel/Read/ReadVariableOp)teacher_conv2d_2/bias/Read/ReadVariableOp)teacher_latent/kernel/Read/ReadVariableOp'teacher_latent/bias/Read/ReadVariableOp(teacher_dense/kernel/Read/ReadVariableOp&teacher_dense/bias/Read/ReadVariableOp+teacher_conv2d_3/kernel/Read/ReadVariableOp)teacher_conv2d_3/bias/Read/ReadVariableOp+teacher_conv2d_4/kernel/Read/ReadVariableOp)teacher_conv2d_4/bias/Read/ReadVariableOp*teacher_outputs/kernel/Read/ReadVariableOp(teacher_outputs/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOp2Adam/teacher_conv2d_1/kernel/m/Read/ReadVariableOp0Adam/teacher_conv2d_1/bias/m/Read/ReadVariableOp2Adam/teacher_conv2d_2/kernel/m/Read/ReadVariableOp0Adam/teacher_conv2d_2/bias/m/Read/ReadVariableOp0Adam/teacher_latent/kernel/m/Read/ReadVariableOp.Adam/teacher_latent/bias/m/Read/ReadVariableOp/Adam/teacher_dense/kernel/m/Read/ReadVariableOp-Adam/teacher_dense/bias/m/Read/ReadVariableOp2Adam/teacher_conv2d_3/kernel/m/Read/ReadVariableOp0Adam/teacher_conv2d_3/bias/m/Read/ReadVariableOp2Adam/teacher_conv2d_4/kernel/m/Read/ReadVariableOp0Adam/teacher_conv2d_4/bias/m/Read/ReadVariableOp1Adam/teacher_outputs/kernel/m/Read/ReadVariableOp/Adam/teacher_outputs/bias/m/Read/ReadVariableOp2Adam/teacher_conv2d_1/kernel/v/Read/ReadVariableOp0Adam/teacher_conv2d_1/bias/v/Read/ReadVariableOp2Adam/teacher_conv2d_2/kernel/v/Read/ReadVariableOp0Adam/teacher_conv2d_2/bias/v/Read/ReadVariableOp0Adam/teacher_latent/kernel/v/Read/ReadVariableOp.Adam/teacher_latent/bias/v/Read/ReadVariableOp/Adam/teacher_dense/kernel/v/Read/ReadVariableOp-Adam/teacher_dense/bias/v/Read/ReadVariableOp2Adam/teacher_conv2d_3/kernel/v/Read/ReadVariableOp0Adam/teacher_conv2d_3/bias/v/Read/ReadVariableOp2Adam/teacher_conv2d_4/kernel/v/Read/ReadVariableOp0Adam/teacher_conv2d_4/bias/v/Read/ReadVariableOp1Adam/teacher_outputs/kernel/v/Read/ReadVariableOp/Adam/teacher_outputs/bias/v/Read/ReadVariableOpConst*>
Tin7
523	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *)
f$R"
 __inference__traced_save_6647297
�
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameteacher_conv2d_1/kernelteacher_conv2d_1/biasteacher_conv2d_2/kernelteacher_conv2d_2/biasteacher_latent/kernelteacher_latent/biasteacher_dense/kernelteacher_dense/biasteacher_conv2d_3/kernelteacher_conv2d_3/biasteacher_conv2d_4/kernelteacher_conv2d_4/biasteacher_outputs/kernelteacher_outputs/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotalcountAdam/teacher_conv2d_1/kernel/mAdam/teacher_conv2d_1/bias/mAdam/teacher_conv2d_2/kernel/mAdam/teacher_conv2d_2/bias/mAdam/teacher_latent/kernel/mAdam/teacher_latent/bias/mAdam/teacher_dense/kernel/mAdam/teacher_dense/bias/mAdam/teacher_conv2d_3/kernel/mAdam/teacher_conv2d_3/bias/mAdam/teacher_conv2d_4/kernel/mAdam/teacher_conv2d_4/bias/mAdam/teacher_outputs/kernel/mAdam/teacher_outputs/bias/mAdam/teacher_conv2d_1/kernel/vAdam/teacher_conv2d_1/bias/vAdam/teacher_conv2d_2/kernel/vAdam/teacher_conv2d_2/bias/vAdam/teacher_latent/kernel/vAdam/teacher_latent/bias/vAdam/teacher_dense/kernel/vAdam/teacher_dense/bias/vAdam/teacher_conv2d_3/kernel/vAdam/teacher_conv2d_3/bias/vAdam/teacher_conv2d_4/kernel/vAdam/teacher_conv2d_4/bias/vAdam/teacher_outputs/kernel/vAdam/teacher_outputs/bias/v*=
Tin6
422*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *,
f'R%
#__inference__traced_restore_6647454��

�
g
K__inference_teacher_relu_5_layer_call_and_return_conditional_losses_6646184

inputs
identity`
ReluReluinputs*
T0*A
_output_shapes/
-:+���������������������������t
IdentityIdentityRelu:activations:0*
T0*A
_output_shapes/
-:+���������������������������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-:+���������������������������:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
L
0__inference_teacher_relu_1_layer_call_fn_6646909

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_1_layer_call_and_return_conditional_losses_6646049h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
g
K__inference_teacher_relu_5_layer_call_and_return_conditional_losses_6647107

inputs
identity`
ReluReluinputs*
T0*A
_output_shapes/
-:+���������������������������t
IdentityIdentityRelu:activations:0*
T0*A
_output_shapes/
-:+���������������������������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-:+���������������������������:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
M__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_6646173

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+���������������������������*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+���������������������������y
IdentityIdentityBiasAdd:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+���������������������������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
h
L__inference_teacher_flatten_layer_call_and_return_conditional_losses_6646964

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"����b  ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:����������Y
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
h
L__inference_teacher_flatten_layer_call_and_return_conditional_losses_6646081

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"����b  ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:����������Y
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�H
�
D__inference_teacher_layer_call_and_return_conditional_losses_6646550
teacher_inputs_2
teacher_conv2d_1_6646505:&
teacher_conv2d_1_6646507:2
teacher_conv2d_2_6646512:&
teacher_conv2d_2_6646514:)
teacher_latent_6646519:	�P$
teacher_latent_6646521:P(
teacher_dense_6646524:	P�$
teacher_dense_6646526:	�2
teacher_conv2d_3_6646531:&
teacher_conv2d_3_6646533:2
teacher_conv2d_4_6646538:&
teacher_conv2d_4_6646540:1
teacher_outputs_6646544:%
teacher_outputs_6646546:
identity��(teacher_conv2d_1/StatefulPartitionedCall�(teacher_conv2d_2/StatefulPartitionedCall�(teacher_conv2d_3/StatefulPartitionedCall�(teacher_conv2d_4/StatefulPartitionedCall�%teacher_dense/StatefulPartitionedCall�&teacher_latent/StatefulPartitionedCall�'teacher_outputs/StatefulPartitionedCall�
teacher_reshape/PartitionedCallPartitionedCallteacher_inputs_*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *U
fPRN
L__inference_teacher_reshape_layer_call_and_return_conditional_losses_6646026�
(teacher_conv2d_1/StatefulPartitionedCallStatefulPartitionedCall(teacher_reshape/PartitionedCall:output:0teacher_conv2d_1_6646505teacher_conv2d_1_6646507*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_6646038�
teacher_relu_1/PartitionedCallPartitionedCall1teacher_conv2d_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_1_layer_call_and_return_conditional_losses_6646049�
teacher_pool_1/PartitionedCallPartitionedCall'teacher_relu_1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_pool_1_layer_call_and_return_conditional_losses_6645983�
(teacher_conv2d_2/StatefulPartitionedCallStatefulPartitionedCall'teacher_pool_1/PartitionedCall:output:0teacher_conv2d_2_6646512teacher_conv2d_2_6646514*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_6646062�
teacher_relu_2/PartitionedCallPartitionedCall1teacher_conv2d_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_2_layer_call_and_return_conditional_losses_6646073�
teacher_flatten/PartitionedCallPartitionedCall'teacher_relu_2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *U
fPRN
L__inference_teacher_flatten_layer_call_and_return_conditional_losses_6646081�
&teacher_latent/StatefulPartitionedCallStatefulPartitionedCall(teacher_flatten/PartitionedCall:output:0teacher_latent_6646519teacher_latent_6646521*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������P*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_latent_layer_call_and_return_conditional_losses_6646094�
%teacher_dense/StatefulPartitionedCallStatefulPartitionedCall/teacher_latent/StatefulPartitionedCall:output:0teacher_dense_6646524teacher_dense_6646526*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *S
fNRL
J__inference_teacher_dense_layer_call_and_return_conditional_losses_6646110�
 teacher_reshape2/PartitionedCallPartitionedCall.teacher_dense/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_reshape2_layer_call_and_return_conditional_losses_6646130�
teacher_relu_3/PartitionedCallPartitionedCall)teacher_reshape2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_3_layer_call_and_return_conditional_losses_6646137�
(teacher_conv2d_3/StatefulPartitionedCallStatefulPartitionedCall'teacher_relu_3/PartitionedCall:output:0teacher_conv2d_3_6646531teacher_conv2d_3_6646533*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_conv2d_3_layer_call_and_return_conditional_losses_6646149�
teacher_relu_4/PartitionedCallPartitionedCall1teacher_conv2d_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_4_layer_call_and_return_conditional_losses_6646160�
"teacher_upsampling/PartitionedCallPartitionedCall'teacher_relu_4/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_teacher_upsampling_layer_call_and_return_conditional_losses_6646002�
(teacher_conv2d_4/StatefulPartitionedCallStatefulPartitionedCall+teacher_upsampling/PartitionedCall:output:0teacher_conv2d_4_6646538teacher_conv2d_4_6646540*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_6646173�
teacher_relu_5/PartitionedCallPartitionedCall1teacher_conv2d_4/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_5_layer_call_and_return_conditional_losses_6646184�
'teacher_outputs/StatefulPartitionedCallStatefulPartitionedCall'teacher_relu_5/PartitionedCall:output:0teacher_outputs_6646544teacher_outputs_6646546*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *U
fPRN
L__inference_teacher_outputs_layer_call_and_return_conditional_losses_6646197�
IdentityIdentity0teacher_outputs/StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp)^teacher_conv2d_1/StatefulPartitionedCall)^teacher_conv2d_2/StatefulPartitionedCall)^teacher_conv2d_3/StatefulPartitionedCall)^teacher_conv2d_4/StatefulPartitionedCall&^teacher_dense/StatefulPartitionedCall'^teacher_latent/StatefulPartitionedCall(^teacher_outputs/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*J
_input_shapes9
7:���������: : : : : : : : : : : : : : 2T
(teacher_conv2d_1/StatefulPartitionedCall(teacher_conv2d_1/StatefulPartitionedCall2T
(teacher_conv2d_2/StatefulPartitionedCall(teacher_conv2d_2/StatefulPartitionedCall2T
(teacher_conv2d_3/StatefulPartitionedCall(teacher_conv2d_3/StatefulPartitionedCall2T
(teacher_conv2d_4/StatefulPartitionedCall(teacher_conv2d_4/StatefulPartitionedCall2N
%teacher_dense/StatefulPartitionedCall%teacher_dense/StatefulPartitionedCall2P
&teacher_latent/StatefulPartitionedCall&teacher_latent/StatefulPartitionedCall2R
'teacher_outputs/StatefulPartitionedCall'teacher_outputs/StatefulPartitionedCall:` \
/
_output_shapes
:���������
)
_user_specified_nameteacher_inputs_
�
�
2__inference_teacher_conv2d_2_layer_call_fn_6646933

inputs!
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_6646062w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�g
�
D__inference_teacher_layer_call_and_return_conditional_losses_6646786

inputsI
/teacher_conv2d_1_conv2d_readvariableop_resource:>
0teacher_conv2d_1_biasadd_readvariableop_resource:I
/teacher_conv2d_2_conv2d_readvariableop_resource:>
0teacher_conv2d_2_biasadd_readvariableop_resource:@
-teacher_latent_matmul_readvariableop_resource:	�P<
.teacher_latent_biasadd_readvariableop_resource:P?
,teacher_dense_matmul_readvariableop_resource:	P�<
-teacher_dense_biasadd_readvariableop_resource:	�I
/teacher_conv2d_3_conv2d_readvariableop_resource:>
0teacher_conv2d_3_biasadd_readvariableop_resource:I
/teacher_conv2d_4_conv2d_readvariableop_resource:>
0teacher_conv2d_4_biasadd_readvariableop_resource:H
.teacher_outputs_conv2d_readvariableop_resource:=
/teacher_outputs_biasadd_readvariableop_resource:
identity��'teacher_conv2d_1/BiasAdd/ReadVariableOp�&teacher_conv2d_1/Conv2D/ReadVariableOp�'teacher_conv2d_2/BiasAdd/ReadVariableOp�&teacher_conv2d_2/Conv2D/ReadVariableOp�'teacher_conv2d_3/BiasAdd/ReadVariableOp�&teacher_conv2d_3/Conv2D/ReadVariableOp�'teacher_conv2d_4/BiasAdd/ReadVariableOp�&teacher_conv2d_4/Conv2D/ReadVariableOp�$teacher_dense/BiasAdd/ReadVariableOp�#teacher_dense/MatMul/ReadVariableOp�%teacher_latent/BiasAdd/ReadVariableOp�$teacher_latent/MatMul/ReadVariableOp�&teacher_outputs/BiasAdd/ReadVariableOp�%teacher_outputs/Conv2D/ReadVariableOpK
teacher_reshape/ShapeShapeinputs*
T0*
_output_shapes
:m
#teacher_reshape/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: o
%teacher_reshape/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:o
%teacher_reshape/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
teacher_reshape/strided_sliceStridedSliceteacher_reshape/Shape:output:0,teacher_reshape/strided_slice/stack:output:0.teacher_reshape/strided_slice/stack_1:output:0.teacher_reshape/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maska
teacher_reshape/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :a
teacher_reshape/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :a
teacher_reshape/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :�
teacher_reshape/Reshape/shapePack&teacher_reshape/strided_slice:output:0(teacher_reshape/Reshape/shape/1:output:0(teacher_reshape/Reshape/shape/2:output:0(teacher_reshape/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:�
teacher_reshape/ReshapeReshapeinputs&teacher_reshape/Reshape/shape:output:0*
T0*/
_output_shapes
:����������
&teacher_conv2d_1/Conv2D/ReadVariableOpReadVariableOp/teacher_conv2d_1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
teacher_conv2d_1/Conv2DConv2D teacher_reshape/Reshape:output:0.teacher_conv2d_1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������*
paddingSAME*
strides
�
'teacher_conv2d_1/BiasAdd/ReadVariableOpReadVariableOp0teacher_conv2d_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
teacher_conv2d_1/BiasAddBiasAdd teacher_conv2d_1/Conv2D:output:0/teacher_conv2d_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������x
teacher_relu_1/ReluRelu!teacher_conv2d_1/BiasAdd:output:0*
T0*/
_output_shapes
:����������
teacher_pool_1/AvgPoolAvgPool!teacher_relu_1/Relu:activations:0*
T0*/
_output_shapes
:���������	*
ksize
*
paddingVALID*
strides
�
&teacher_conv2d_2/Conv2D/ReadVariableOpReadVariableOp/teacher_conv2d_2_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
teacher_conv2d_2/Conv2DConv2Dteacher_pool_1/AvgPool:output:0.teacher_conv2d_2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
'teacher_conv2d_2/BiasAdd/ReadVariableOpReadVariableOp0teacher_conv2d_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
teacher_conv2d_2/BiasAddBiasAdd teacher_conv2d_2/Conv2D:output:0/teacher_conv2d_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	x
teacher_relu_2/ReluRelu!teacher_conv2d_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������	f
teacher_flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"����b  �
teacher_flatten/ReshapeReshape!teacher_relu_2/Relu:activations:0teacher_flatten/Const:output:0*
T0*(
_output_shapes
:�����������
$teacher_latent/MatMul/ReadVariableOpReadVariableOp-teacher_latent_matmul_readvariableop_resource*
_output_shapes
:	�P*
dtype0�
teacher_latent/MatMulMatMul teacher_flatten/Reshape:output:0,teacher_latent/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P�
%teacher_latent/BiasAdd/ReadVariableOpReadVariableOp.teacher_latent_biasadd_readvariableop_resource*
_output_shapes
:P*
dtype0�
teacher_latent/BiasAddBiasAddteacher_latent/MatMul:product:0-teacher_latent/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������Pn
teacher_latent/ReluReluteacher_latent/BiasAdd:output:0*
T0*'
_output_shapes
:���������P�
#teacher_dense/MatMul/ReadVariableOpReadVariableOp,teacher_dense_matmul_readvariableop_resource*
_output_shapes
:	P�*
dtype0�
teacher_dense/MatMulMatMul!teacher_latent/Relu:activations:0+teacher_dense/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
$teacher_dense/BiasAdd/ReadVariableOpReadVariableOp-teacher_dense_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0�
teacher_dense/BiasAddBiasAddteacher_dense/MatMul:product:0,teacher_dense/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������d
teacher_reshape2/ShapeShapeteacher_dense/BiasAdd:output:0*
T0*
_output_shapes
:n
$teacher_reshape2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: p
&teacher_reshape2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:p
&teacher_reshape2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
teacher_reshape2/strided_sliceStridedSliceteacher_reshape2/Shape:output:0-teacher_reshape2/strided_slice/stack:output:0/teacher_reshape2/strided_slice/stack_1:output:0/teacher_reshape2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskb
 teacher_reshape2/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :	b
 teacher_reshape2/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :b
 teacher_reshape2/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :�
teacher_reshape2/Reshape/shapePack'teacher_reshape2/strided_slice:output:0)teacher_reshape2/Reshape/shape/1:output:0)teacher_reshape2/Reshape/shape/2:output:0)teacher_reshape2/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:�
teacher_reshape2/ReshapeReshapeteacher_dense/BiasAdd:output:0'teacher_reshape2/Reshape/shape:output:0*
T0*/
_output_shapes
:���������	x
teacher_relu_3/ReluRelu!teacher_reshape2/Reshape:output:0*
T0*/
_output_shapes
:���������	�
&teacher_conv2d_3/Conv2D/ReadVariableOpReadVariableOp/teacher_conv2d_3_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
teacher_conv2d_3/Conv2DConv2D!teacher_relu_3/Relu:activations:0.teacher_conv2d_3/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
'teacher_conv2d_3/BiasAdd/ReadVariableOpReadVariableOp0teacher_conv2d_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
teacher_conv2d_3/BiasAddBiasAdd teacher_conv2d_3/Conv2D:output:0/teacher_conv2d_3/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	x
teacher_relu_4/ReluRelu!teacher_conv2d_3/BiasAdd:output:0*
T0*/
_output_shapes
:���������	i
teacher_upsampling/ConstConst*
_output_shapes
:*
dtype0*
valueB"	      k
teacher_upsampling/Const_1Const*
_output_shapes
:*
dtype0*
valueB"      �
teacher_upsampling/mulMul!teacher_upsampling/Const:output:0#teacher_upsampling/Const_1:output:0*
T0*
_output_shapes
:�
/teacher_upsampling/resize/ResizeNearestNeighborResizeNearestNeighbor!teacher_relu_4/Relu:activations:0teacher_upsampling/mul:z:0*
T0*/
_output_shapes
:���������*
half_pixel_centers(�
&teacher_conv2d_4/Conv2D/ReadVariableOpReadVariableOp/teacher_conv2d_4_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
teacher_conv2d_4/Conv2DConv2D@teacher_upsampling/resize/ResizeNearestNeighbor:resized_images:0.teacher_conv2d_4/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������*
paddingSAME*
strides
�
'teacher_conv2d_4/BiasAdd/ReadVariableOpReadVariableOp0teacher_conv2d_4_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
teacher_conv2d_4/BiasAddBiasAdd teacher_conv2d_4/Conv2D:output:0/teacher_conv2d_4/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������x
teacher_relu_5/ReluRelu!teacher_conv2d_4/BiasAdd:output:0*
T0*/
_output_shapes
:����������
%teacher_outputs/Conv2D/ReadVariableOpReadVariableOp.teacher_outputs_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
teacher_outputs/Conv2DConv2D!teacher_relu_5/Relu:activations:0-teacher_outputs/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������*
paddingSAME*
strides
�
&teacher_outputs/BiasAdd/ReadVariableOpReadVariableOp/teacher_outputs_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
teacher_outputs/BiasAddBiasAddteacher_outputs/Conv2D:output:0.teacher_outputs/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������x
teacher_outputs/ReluRelu teacher_outputs/BiasAdd:output:0*
T0*/
_output_shapes
:���������y
IdentityIdentity"teacher_outputs/Relu:activations:0^NoOp*
T0*/
_output_shapes
:����������
NoOpNoOp(^teacher_conv2d_1/BiasAdd/ReadVariableOp'^teacher_conv2d_1/Conv2D/ReadVariableOp(^teacher_conv2d_2/BiasAdd/ReadVariableOp'^teacher_conv2d_2/Conv2D/ReadVariableOp(^teacher_conv2d_3/BiasAdd/ReadVariableOp'^teacher_conv2d_3/Conv2D/ReadVariableOp(^teacher_conv2d_4/BiasAdd/ReadVariableOp'^teacher_conv2d_4/Conv2D/ReadVariableOp%^teacher_dense/BiasAdd/ReadVariableOp$^teacher_dense/MatMul/ReadVariableOp&^teacher_latent/BiasAdd/ReadVariableOp%^teacher_latent/MatMul/ReadVariableOp'^teacher_outputs/BiasAdd/ReadVariableOp&^teacher_outputs/Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*J
_input_shapes9
7:���������: : : : : : : : : : : : : : 2R
'teacher_conv2d_1/BiasAdd/ReadVariableOp'teacher_conv2d_1/BiasAdd/ReadVariableOp2P
&teacher_conv2d_1/Conv2D/ReadVariableOp&teacher_conv2d_1/Conv2D/ReadVariableOp2R
'teacher_conv2d_2/BiasAdd/ReadVariableOp'teacher_conv2d_2/BiasAdd/ReadVariableOp2P
&teacher_conv2d_2/Conv2D/ReadVariableOp&teacher_conv2d_2/Conv2D/ReadVariableOp2R
'teacher_conv2d_3/BiasAdd/ReadVariableOp'teacher_conv2d_3/BiasAdd/ReadVariableOp2P
&teacher_conv2d_3/Conv2D/ReadVariableOp&teacher_conv2d_3/Conv2D/ReadVariableOp2R
'teacher_conv2d_4/BiasAdd/ReadVariableOp'teacher_conv2d_4/BiasAdd/ReadVariableOp2P
&teacher_conv2d_4/Conv2D/ReadVariableOp&teacher_conv2d_4/Conv2D/ReadVariableOp2L
$teacher_dense/BiasAdd/ReadVariableOp$teacher_dense/BiasAdd/ReadVariableOp2J
#teacher_dense/MatMul/ReadVariableOp#teacher_dense/MatMul/ReadVariableOp2N
%teacher_latent/BiasAdd/ReadVariableOp%teacher_latent/BiasAdd/ReadVariableOp2L
$teacher_latent/MatMul/ReadVariableOp$teacher_latent/MatMul/ReadVariableOp2P
&teacher_outputs/BiasAdd/ReadVariableOp&teacher_outputs/BiasAdd/ReadVariableOp2N
%teacher_outputs/Conv2D/ReadVariableOp%teacher_outputs/Conv2D/ReadVariableOp:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
g
K__inference_teacher_relu_4_layer_call_and_return_conditional_losses_6646160

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:���������	b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�	
�
J__inference_teacher_dense_layer_call_and_return_conditional_losses_6646110

inputs1
matmul_readvariableop_resource:	P�.
biasadd_readvariableop_resource:	�
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	P�*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������`
IdentityIdentityBiasAdd:output:0^NoOp*
T0*(
_output_shapes
:����������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������P: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������P
 
_user_specified_nameinputs
�

�
K__inference_teacher_latent_layer_call_and_return_conditional_losses_6646094

inputs1
matmul_readvariableop_resource:	�P-
biasadd_readvariableop_resource:P
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�P*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������Pr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:P*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������PP
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������Pa
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������Pw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�g
�
D__inference_teacher_layer_call_and_return_conditional_losses_6646866

inputsI
/teacher_conv2d_1_conv2d_readvariableop_resource:>
0teacher_conv2d_1_biasadd_readvariableop_resource:I
/teacher_conv2d_2_conv2d_readvariableop_resource:>
0teacher_conv2d_2_biasadd_readvariableop_resource:@
-teacher_latent_matmul_readvariableop_resource:	�P<
.teacher_latent_biasadd_readvariableop_resource:P?
,teacher_dense_matmul_readvariableop_resource:	P�<
-teacher_dense_biasadd_readvariableop_resource:	�I
/teacher_conv2d_3_conv2d_readvariableop_resource:>
0teacher_conv2d_3_biasadd_readvariableop_resource:I
/teacher_conv2d_4_conv2d_readvariableop_resource:>
0teacher_conv2d_4_biasadd_readvariableop_resource:H
.teacher_outputs_conv2d_readvariableop_resource:=
/teacher_outputs_biasadd_readvariableop_resource:
identity��'teacher_conv2d_1/BiasAdd/ReadVariableOp�&teacher_conv2d_1/Conv2D/ReadVariableOp�'teacher_conv2d_2/BiasAdd/ReadVariableOp�&teacher_conv2d_2/Conv2D/ReadVariableOp�'teacher_conv2d_3/BiasAdd/ReadVariableOp�&teacher_conv2d_3/Conv2D/ReadVariableOp�'teacher_conv2d_4/BiasAdd/ReadVariableOp�&teacher_conv2d_4/Conv2D/ReadVariableOp�$teacher_dense/BiasAdd/ReadVariableOp�#teacher_dense/MatMul/ReadVariableOp�%teacher_latent/BiasAdd/ReadVariableOp�$teacher_latent/MatMul/ReadVariableOp�&teacher_outputs/BiasAdd/ReadVariableOp�%teacher_outputs/Conv2D/ReadVariableOpK
teacher_reshape/ShapeShapeinputs*
T0*
_output_shapes
:m
#teacher_reshape/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: o
%teacher_reshape/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:o
%teacher_reshape/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
teacher_reshape/strided_sliceStridedSliceteacher_reshape/Shape:output:0,teacher_reshape/strided_slice/stack:output:0.teacher_reshape/strided_slice/stack_1:output:0.teacher_reshape/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maska
teacher_reshape/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :a
teacher_reshape/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :a
teacher_reshape/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :�
teacher_reshape/Reshape/shapePack&teacher_reshape/strided_slice:output:0(teacher_reshape/Reshape/shape/1:output:0(teacher_reshape/Reshape/shape/2:output:0(teacher_reshape/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:�
teacher_reshape/ReshapeReshapeinputs&teacher_reshape/Reshape/shape:output:0*
T0*/
_output_shapes
:����������
&teacher_conv2d_1/Conv2D/ReadVariableOpReadVariableOp/teacher_conv2d_1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
teacher_conv2d_1/Conv2DConv2D teacher_reshape/Reshape:output:0.teacher_conv2d_1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������*
paddingSAME*
strides
�
'teacher_conv2d_1/BiasAdd/ReadVariableOpReadVariableOp0teacher_conv2d_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
teacher_conv2d_1/BiasAddBiasAdd teacher_conv2d_1/Conv2D:output:0/teacher_conv2d_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������x
teacher_relu_1/ReluRelu!teacher_conv2d_1/BiasAdd:output:0*
T0*/
_output_shapes
:����������
teacher_pool_1/AvgPoolAvgPool!teacher_relu_1/Relu:activations:0*
T0*/
_output_shapes
:���������	*
ksize
*
paddingVALID*
strides
�
&teacher_conv2d_2/Conv2D/ReadVariableOpReadVariableOp/teacher_conv2d_2_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
teacher_conv2d_2/Conv2DConv2Dteacher_pool_1/AvgPool:output:0.teacher_conv2d_2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
'teacher_conv2d_2/BiasAdd/ReadVariableOpReadVariableOp0teacher_conv2d_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
teacher_conv2d_2/BiasAddBiasAdd teacher_conv2d_2/Conv2D:output:0/teacher_conv2d_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	x
teacher_relu_2/ReluRelu!teacher_conv2d_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������	f
teacher_flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"����b  �
teacher_flatten/ReshapeReshape!teacher_relu_2/Relu:activations:0teacher_flatten/Const:output:0*
T0*(
_output_shapes
:�����������
$teacher_latent/MatMul/ReadVariableOpReadVariableOp-teacher_latent_matmul_readvariableop_resource*
_output_shapes
:	�P*
dtype0�
teacher_latent/MatMulMatMul teacher_flatten/Reshape:output:0,teacher_latent/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P�
%teacher_latent/BiasAdd/ReadVariableOpReadVariableOp.teacher_latent_biasadd_readvariableop_resource*
_output_shapes
:P*
dtype0�
teacher_latent/BiasAddBiasAddteacher_latent/MatMul:product:0-teacher_latent/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������Pn
teacher_latent/ReluReluteacher_latent/BiasAdd:output:0*
T0*'
_output_shapes
:���������P�
#teacher_dense/MatMul/ReadVariableOpReadVariableOp,teacher_dense_matmul_readvariableop_resource*
_output_shapes
:	P�*
dtype0�
teacher_dense/MatMulMatMul!teacher_latent/Relu:activations:0+teacher_dense/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
$teacher_dense/BiasAdd/ReadVariableOpReadVariableOp-teacher_dense_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0�
teacher_dense/BiasAddBiasAddteacher_dense/MatMul:product:0,teacher_dense/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������d
teacher_reshape2/ShapeShapeteacher_dense/BiasAdd:output:0*
T0*
_output_shapes
:n
$teacher_reshape2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: p
&teacher_reshape2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:p
&teacher_reshape2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
teacher_reshape2/strided_sliceStridedSliceteacher_reshape2/Shape:output:0-teacher_reshape2/strided_slice/stack:output:0/teacher_reshape2/strided_slice/stack_1:output:0/teacher_reshape2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskb
 teacher_reshape2/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :	b
 teacher_reshape2/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :b
 teacher_reshape2/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :�
teacher_reshape2/Reshape/shapePack'teacher_reshape2/strided_slice:output:0)teacher_reshape2/Reshape/shape/1:output:0)teacher_reshape2/Reshape/shape/2:output:0)teacher_reshape2/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:�
teacher_reshape2/ReshapeReshapeteacher_dense/BiasAdd:output:0'teacher_reshape2/Reshape/shape:output:0*
T0*/
_output_shapes
:���������	x
teacher_relu_3/ReluRelu!teacher_reshape2/Reshape:output:0*
T0*/
_output_shapes
:���������	�
&teacher_conv2d_3/Conv2D/ReadVariableOpReadVariableOp/teacher_conv2d_3_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
teacher_conv2d_3/Conv2DConv2D!teacher_relu_3/Relu:activations:0.teacher_conv2d_3/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
'teacher_conv2d_3/BiasAdd/ReadVariableOpReadVariableOp0teacher_conv2d_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
teacher_conv2d_3/BiasAddBiasAdd teacher_conv2d_3/Conv2D:output:0/teacher_conv2d_3/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	x
teacher_relu_4/ReluRelu!teacher_conv2d_3/BiasAdd:output:0*
T0*/
_output_shapes
:���������	i
teacher_upsampling/ConstConst*
_output_shapes
:*
dtype0*
valueB"	      k
teacher_upsampling/Const_1Const*
_output_shapes
:*
dtype0*
valueB"      �
teacher_upsampling/mulMul!teacher_upsampling/Const:output:0#teacher_upsampling/Const_1:output:0*
T0*
_output_shapes
:�
/teacher_upsampling/resize/ResizeNearestNeighborResizeNearestNeighbor!teacher_relu_4/Relu:activations:0teacher_upsampling/mul:z:0*
T0*/
_output_shapes
:���������*
half_pixel_centers(�
&teacher_conv2d_4/Conv2D/ReadVariableOpReadVariableOp/teacher_conv2d_4_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
teacher_conv2d_4/Conv2DConv2D@teacher_upsampling/resize/ResizeNearestNeighbor:resized_images:0.teacher_conv2d_4/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������*
paddingSAME*
strides
�
'teacher_conv2d_4/BiasAdd/ReadVariableOpReadVariableOp0teacher_conv2d_4_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
teacher_conv2d_4/BiasAddBiasAdd teacher_conv2d_4/Conv2D:output:0/teacher_conv2d_4/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������x
teacher_relu_5/ReluRelu!teacher_conv2d_4/BiasAdd:output:0*
T0*/
_output_shapes
:����������
%teacher_outputs/Conv2D/ReadVariableOpReadVariableOp.teacher_outputs_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
teacher_outputs/Conv2DConv2D!teacher_relu_5/Relu:activations:0-teacher_outputs/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������*
paddingSAME*
strides
�
&teacher_outputs/BiasAdd/ReadVariableOpReadVariableOp/teacher_outputs_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
teacher_outputs/BiasAddBiasAddteacher_outputs/Conv2D:output:0.teacher_outputs/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������x
teacher_outputs/ReluRelu teacher_outputs/BiasAdd:output:0*
T0*/
_output_shapes
:���������y
IdentityIdentity"teacher_outputs/Relu:activations:0^NoOp*
T0*/
_output_shapes
:����������
NoOpNoOp(^teacher_conv2d_1/BiasAdd/ReadVariableOp'^teacher_conv2d_1/Conv2D/ReadVariableOp(^teacher_conv2d_2/BiasAdd/ReadVariableOp'^teacher_conv2d_2/Conv2D/ReadVariableOp(^teacher_conv2d_3/BiasAdd/ReadVariableOp'^teacher_conv2d_3/Conv2D/ReadVariableOp(^teacher_conv2d_4/BiasAdd/ReadVariableOp'^teacher_conv2d_4/Conv2D/ReadVariableOp%^teacher_dense/BiasAdd/ReadVariableOp$^teacher_dense/MatMul/ReadVariableOp&^teacher_latent/BiasAdd/ReadVariableOp%^teacher_latent/MatMul/ReadVariableOp'^teacher_outputs/BiasAdd/ReadVariableOp&^teacher_outputs/Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*J
_input_shapes9
7:���������: : : : : : : : : : : : : : 2R
'teacher_conv2d_1/BiasAdd/ReadVariableOp'teacher_conv2d_1/BiasAdd/ReadVariableOp2P
&teacher_conv2d_1/Conv2D/ReadVariableOp&teacher_conv2d_1/Conv2D/ReadVariableOp2R
'teacher_conv2d_2/BiasAdd/ReadVariableOp'teacher_conv2d_2/BiasAdd/ReadVariableOp2P
&teacher_conv2d_2/Conv2D/ReadVariableOp&teacher_conv2d_2/Conv2D/ReadVariableOp2R
'teacher_conv2d_3/BiasAdd/ReadVariableOp'teacher_conv2d_3/BiasAdd/ReadVariableOp2P
&teacher_conv2d_3/Conv2D/ReadVariableOp&teacher_conv2d_3/Conv2D/ReadVariableOp2R
'teacher_conv2d_4/BiasAdd/ReadVariableOp'teacher_conv2d_4/BiasAdd/ReadVariableOp2P
&teacher_conv2d_4/Conv2D/ReadVariableOp&teacher_conv2d_4/Conv2D/ReadVariableOp2L
$teacher_dense/BiasAdd/ReadVariableOp$teacher_dense/BiasAdd/ReadVariableOp2J
#teacher_dense/MatMul/ReadVariableOp#teacher_dense/MatMul/ReadVariableOp2N
%teacher_latent/BiasAdd/ReadVariableOp%teacher_latent/BiasAdd/ReadVariableOp2L
$teacher_latent/MatMul/ReadVariableOp$teacher_latent/MatMul/ReadVariableOp2P
&teacher_outputs/BiasAdd/ReadVariableOp&teacher_outputs/BiasAdd/ReadVariableOp2N
%teacher_outputs/Conv2D/ReadVariableOp%teacher_outputs/Conv2D/ReadVariableOp:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�H
�
D__inference_teacher_layer_call_and_return_conditional_losses_6646599
teacher_inputs_2
teacher_conv2d_1_6646554:&
teacher_conv2d_1_6646556:2
teacher_conv2d_2_6646561:&
teacher_conv2d_2_6646563:)
teacher_latent_6646568:	�P$
teacher_latent_6646570:P(
teacher_dense_6646573:	P�$
teacher_dense_6646575:	�2
teacher_conv2d_3_6646580:&
teacher_conv2d_3_6646582:2
teacher_conv2d_4_6646587:&
teacher_conv2d_4_6646589:1
teacher_outputs_6646593:%
teacher_outputs_6646595:
identity��(teacher_conv2d_1/StatefulPartitionedCall�(teacher_conv2d_2/StatefulPartitionedCall�(teacher_conv2d_3/StatefulPartitionedCall�(teacher_conv2d_4/StatefulPartitionedCall�%teacher_dense/StatefulPartitionedCall�&teacher_latent/StatefulPartitionedCall�'teacher_outputs/StatefulPartitionedCall�
teacher_reshape/PartitionedCallPartitionedCallteacher_inputs_*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *U
fPRN
L__inference_teacher_reshape_layer_call_and_return_conditional_losses_6646026�
(teacher_conv2d_1/StatefulPartitionedCallStatefulPartitionedCall(teacher_reshape/PartitionedCall:output:0teacher_conv2d_1_6646554teacher_conv2d_1_6646556*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_6646038�
teacher_relu_1/PartitionedCallPartitionedCall1teacher_conv2d_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_1_layer_call_and_return_conditional_losses_6646049�
teacher_pool_1/PartitionedCallPartitionedCall'teacher_relu_1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_pool_1_layer_call_and_return_conditional_losses_6645983�
(teacher_conv2d_2/StatefulPartitionedCallStatefulPartitionedCall'teacher_pool_1/PartitionedCall:output:0teacher_conv2d_2_6646561teacher_conv2d_2_6646563*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_6646062�
teacher_relu_2/PartitionedCallPartitionedCall1teacher_conv2d_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_2_layer_call_and_return_conditional_losses_6646073�
teacher_flatten/PartitionedCallPartitionedCall'teacher_relu_2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *U
fPRN
L__inference_teacher_flatten_layer_call_and_return_conditional_losses_6646081�
&teacher_latent/StatefulPartitionedCallStatefulPartitionedCall(teacher_flatten/PartitionedCall:output:0teacher_latent_6646568teacher_latent_6646570*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������P*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_latent_layer_call_and_return_conditional_losses_6646094�
%teacher_dense/StatefulPartitionedCallStatefulPartitionedCall/teacher_latent/StatefulPartitionedCall:output:0teacher_dense_6646573teacher_dense_6646575*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *S
fNRL
J__inference_teacher_dense_layer_call_and_return_conditional_losses_6646110�
 teacher_reshape2/PartitionedCallPartitionedCall.teacher_dense/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_reshape2_layer_call_and_return_conditional_losses_6646130�
teacher_relu_3/PartitionedCallPartitionedCall)teacher_reshape2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_3_layer_call_and_return_conditional_losses_6646137�
(teacher_conv2d_3/StatefulPartitionedCallStatefulPartitionedCall'teacher_relu_3/PartitionedCall:output:0teacher_conv2d_3_6646580teacher_conv2d_3_6646582*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_conv2d_3_layer_call_and_return_conditional_losses_6646149�
teacher_relu_4/PartitionedCallPartitionedCall1teacher_conv2d_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_4_layer_call_and_return_conditional_losses_6646160�
"teacher_upsampling/PartitionedCallPartitionedCall'teacher_relu_4/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_teacher_upsampling_layer_call_and_return_conditional_losses_6646002�
(teacher_conv2d_4/StatefulPartitionedCallStatefulPartitionedCall+teacher_upsampling/PartitionedCall:output:0teacher_conv2d_4_6646587teacher_conv2d_4_6646589*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_6646173�
teacher_relu_5/PartitionedCallPartitionedCall1teacher_conv2d_4/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_5_layer_call_and_return_conditional_losses_6646184�
'teacher_outputs/StatefulPartitionedCallStatefulPartitionedCall'teacher_relu_5/PartitionedCall:output:0teacher_outputs_6646593teacher_outputs_6646595*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *U
fPRN
L__inference_teacher_outputs_layer_call_and_return_conditional_losses_6646197�
IdentityIdentity0teacher_outputs/StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp)^teacher_conv2d_1/StatefulPartitionedCall)^teacher_conv2d_2/StatefulPartitionedCall)^teacher_conv2d_3/StatefulPartitionedCall)^teacher_conv2d_4/StatefulPartitionedCall&^teacher_dense/StatefulPartitionedCall'^teacher_latent/StatefulPartitionedCall(^teacher_outputs/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*J
_input_shapes9
7:���������: : : : : : : : : : : : : : 2T
(teacher_conv2d_1/StatefulPartitionedCall(teacher_conv2d_1/StatefulPartitionedCall2T
(teacher_conv2d_2/StatefulPartitionedCall(teacher_conv2d_2/StatefulPartitionedCall2T
(teacher_conv2d_3/StatefulPartitionedCall(teacher_conv2d_3/StatefulPartitionedCall2T
(teacher_conv2d_4/StatefulPartitionedCall(teacher_conv2d_4/StatefulPartitionedCall2N
%teacher_dense/StatefulPartitionedCall%teacher_dense/StatefulPartitionedCall2P
&teacher_latent/StatefulPartitionedCall&teacher_latent/StatefulPartitionedCall2R
'teacher_outputs/StatefulPartitionedCall'teacher_outputs/StatefulPartitionedCall:` \
/
_output_shapes
:���������
)
_user_specified_nameteacher_inputs_
�
�
)__inference_teacher_layer_call_fn_6646235
teacher_inputs_!
unknown:
	unknown_0:#
	unknown_1:
	unknown_2:
	unknown_3:	�P
	unknown_4:P
	unknown_5:	P�
	unknown_6:	�#
	unknown_7:
	unknown_8:#
	unknown_9:

unknown_10:$

unknown_11:

unknown_12:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallteacher_inputs_unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_teacher_layer_call_and_return_conditional_losses_6646204�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*J
_input_shapes9
7:���������: : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:` \
/
_output_shapes
:���������
)
_user_specified_nameteacher_inputs_
�u
�
"__inference__wrapped_model_6645974
teacher_inputs_Q
7teacher_teacher_conv2d_1_conv2d_readvariableop_resource:F
8teacher_teacher_conv2d_1_biasadd_readvariableop_resource:Q
7teacher_teacher_conv2d_2_conv2d_readvariableop_resource:F
8teacher_teacher_conv2d_2_biasadd_readvariableop_resource:H
5teacher_teacher_latent_matmul_readvariableop_resource:	�PD
6teacher_teacher_latent_biasadd_readvariableop_resource:PG
4teacher_teacher_dense_matmul_readvariableop_resource:	P�D
5teacher_teacher_dense_biasadd_readvariableop_resource:	�Q
7teacher_teacher_conv2d_3_conv2d_readvariableop_resource:F
8teacher_teacher_conv2d_3_biasadd_readvariableop_resource:Q
7teacher_teacher_conv2d_4_conv2d_readvariableop_resource:F
8teacher_teacher_conv2d_4_biasadd_readvariableop_resource:P
6teacher_teacher_outputs_conv2d_readvariableop_resource:E
7teacher_teacher_outputs_biasadd_readvariableop_resource:
identity��/teacher/teacher_conv2d_1/BiasAdd/ReadVariableOp�.teacher/teacher_conv2d_1/Conv2D/ReadVariableOp�/teacher/teacher_conv2d_2/BiasAdd/ReadVariableOp�.teacher/teacher_conv2d_2/Conv2D/ReadVariableOp�/teacher/teacher_conv2d_3/BiasAdd/ReadVariableOp�.teacher/teacher_conv2d_3/Conv2D/ReadVariableOp�/teacher/teacher_conv2d_4/BiasAdd/ReadVariableOp�.teacher/teacher_conv2d_4/Conv2D/ReadVariableOp�,teacher/teacher_dense/BiasAdd/ReadVariableOp�+teacher/teacher_dense/MatMul/ReadVariableOp�-teacher/teacher_latent/BiasAdd/ReadVariableOp�,teacher/teacher_latent/MatMul/ReadVariableOp�.teacher/teacher_outputs/BiasAdd/ReadVariableOp�-teacher/teacher_outputs/Conv2D/ReadVariableOp\
teacher/teacher_reshape/ShapeShapeteacher_inputs_*
T0*
_output_shapes
:u
+teacher/teacher_reshape/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: w
-teacher/teacher_reshape/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:w
-teacher/teacher_reshape/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
%teacher/teacher_reshape/strided_sliceStridedSlice&teacher/teacher_reshape/Shape:output:04teacher/teacher_reshape/strided_slice/stack:output:06teacher/teacher_reshape/strided_slice/stack_1:output:06teacher/teacher_reshape/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maski
'teacher/teacher_reshape/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :i
'teacher/teacher_reshape/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :i
'teacher/teacher_reshape/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :�
%teacher/teacher_reshape/Reshape/shapePack.teacher/teacher_reshape/strided_slice:output:00teacher/teacher_reshape/Reshape/shape/1:output:00teacher/teacher_reshape/Reshape/shape/2:output:00teacher/teacher_reshape/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:�
teacher/teacher_reshape/ReshapeReshapeteacher_inputs_.teacher/teacher_reshape/Reshape/shape:output:0*
T0*/
_output_shapes
:����������
.teacher/teacher_conv2d_1/Conv2D/ReadVariableOpReadVariableOp7teacher_teacher_conv2d_1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
teacher/teacher_conv2d_1/Conv2DConv2D(teacher/teacher_reshape/Reshape:output:06teacher/teacher_conv2d_1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������*
paddingSAME*
strides
�
/teacher/teacher_conv2d_1/BiasAdd/ReadVariableOpReadVariableOp8teacher_teacher_conv2d_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
 teacher/teacher_conv2d_1/BiasAddBiasAdd(teacher/teacher_conv2d_1/Conv2D:output:07teacher/teacher_conv2d_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:����������
teacher/teacher_relu_1/ReluRelu)teacher/teacher_conv2d_1/BiasAdd:output:0*
T0*/
_output_shapes
:����������
teacher/teacher_pool_1/AvgPoolAvgPool)teacher/teacher_relu_1/Relu:activations:0*
T0*/
_output_shapes
:���������	*
ksize
*
paddingVALID*
strides
�
.teacher/teacher_conv2d_2/Conv2D/ReadVariableOpReadVariableOp7teacher_teacher_conv2d_2_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
teacher/teacher_conv2d_2/Conv2DConv2D'teacher/teacher_pool_1/AvgPool:output:06teacher/teacher_conv2d_2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
/teacher/teacher_conv2d_2/BiasAdd/ReadVariableOpReadVariableOp8teacher_teacher_conv2d_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
 teacher/teacher_conv2d_2/BiasAddBiasAdd(teacher/teacher_conv2d_2/Conv2D:output:07teacher/teacher_conv2d_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
teacher/teacher_relu_2/ReluRelu)teacher/teacher_conv2d_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������	n
teacher/teacher_flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"����b  �
teacher/teacher_flatten/ReshapeReshape)teacher/teacher_relu_2/Relu:activations:0&teacher/teacher_flatten/Const:output:0*
T0*(
_output_shapes
:�����������
,teacher/teacher_latent/MatMul/ReadVariableOpReadVariableOp5teacher_teacher_latent_matmul_readvariableop_resource*
_output_shapes
:	�P*
dtype0�
teacher/teacher_latent/MatMulMatMul(teacher/teacher_flatten/Reshape:output:04teacher/teacher_latent/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P�
-teacher/teacher_latent/BiasAdd/ReadVariableOpReadVariableOp6teacher_teacher_latent_biasadd_readvariableop_resource*
_output_shapes
:P*
dtype0�
teacher/teacher_latent/BiasAddBiasAdd'teacher/teacher_latent/MatMul:product:05teacher/teacher_latent/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������P~
teacher/teacher_latent/ReluRelu'teacher/teacher_latent/BiasAdd:output:0*
T0*'
_output_shapes
:���������P�
+teacher/teacher_dense/MatMul/ReadVariableOpReadVariableOp4teacher_teacher_dense_matmul_readvariableop_resource*
_output_shapes
:	P�*
dtype0�
teacher/teacher_dense/MatMulMatMul)teacher/teacher_latent/Relu:activations:03teacher/teacher_dense/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
,teacher/teacher_dense/BiasAdd/ReadVariableOpReadVariableOp5teacher_teacher_dense_biasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0�
teacher/teacher_dense/BiasAddBiasAdd&teacher/teacher_dense/MatMul:product:04teacher/teacher_dense/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������t
teacher/teacher_reshape2/ShapeShape&teacher/teacher_dense/BiasAdd:output:0*
T0*
_output_shapes
:v
,teacher/teacher_reshape2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: x
.teacher/teacher_reshape2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:x
.teacher/teacher_reshape2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
&teacher/teacher_reshape2/strided_sliceStridedSlice'teacher/teacher_reshape2/Shape:output:05teacher/teacher_reshape2/strided_slice/stack:output:07teacher/teacher_reshape2/strided_slice/stack_1:output:07teacher/teacher_reshape2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskj
(teacher/teacher_reshape2/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :	j
(teacher/teacher_reshape2/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :j
(teacher/teacher_reshape2/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :�
&teacher/teacher_reshape2/Reshape/shapePack/teacher/teacher_reshape2/strided_slice:output:01teacher/teacher_reshape2/Reshape/shape/1:output:01teacher/teacher_reshape2/Reshape/shape/2:output:01teacher/teacher_reshape2/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:�
 teacher/teacher_reshape2/ReshapeReshape&teacher/teacher_dense/BiasAdd:output:0/teacher/teacher_reshape2/Reshape/shape:output:0*
T0*/
_output_shapes
:���������	�
teacher/teacher_relu_3/ReluRelu)teacher/teacher_reshape2/Reshape:output:0*
T0*/
_output_shapes
:���������	�
.teacher/teacher_conv2d_3/Conv2D/ReadVariableOpReadVariableOp7teacher_teacher_conv2d_3_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
teacher/teacher_conv2d_3/Conv2DConv2D)teacher/teacher_relu_3/Relu:activations:06teacher/teacher_conv2d_3/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
�
/teacher/teacher_conv2d_3/BiasAdd/ReadVariableOpReadVariableOp8teacher_teacher_conv2d_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
 teacher/teacher_conv2d_3/BiasAddBiasAdd(teacher/teacher_conv2d_3/Conv2D:output:07teacher/teacher_conv2d_3/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	�
teacher/teacher_relu_4/ReluRelu)teacher/teacher_conv2d_3/BiasAdd:output:0*
T0*/
_output_shapes
:���������	q
 teacher/teacher_upsampling/ConstConst*
_output_shapes
:*
dtype0*
valueB"	      s
"teacher/teacher_upsampling/Const_1Const*
_output_shapes
:*
dtype0*
valueB"      �
teacher/teacher_upsampling/mulMul)teacher/teacher_upsampling/Const:output:0+teacher/teacher_upsampling/Const_1:output:0*
T0*
_output_shapes
:�
7teacher/teacher_upsampling/resize/ResizeNearestNeighborResizeNearestNeighbor)teacher/teacher_relu_4/Relu:activations:0"teacher/teacher_upsampling/mul:z:0*
T0*/
_output_shapes
:���������*
half_pixel_centers(�
.teacher/teacher_conv2d_4/Conv2D/ReadVariableOpReadVariableOp7teacher_teacher_conv2d_4_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
teacher/teacher_conv2d_4/Conv2DConv2DHteacher/teacher_upsampling/resize/ResizeNearestNeighbor:resized_images:06teacher/teacher_conv2d_4/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������*
paddingSAME*
strides
�
/teacher/teacher_conv2d_4/BiasAdd/ReadVariableOpReadVariableOp8teacher_teacher_conv2d_4_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
 teacher/teacher_conv2d_4/BiasAddBiasAdd(teacher/teacher_conv2d_4/Conv2D:output:07teacher/teacher_conv2d_4/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:����������
teacher/teacher_relu_5/ReluRelu)teacher/teacher_conv2d_4/BiasAdd:output:0*
T0*/
_output_shapes
:����������
-teacher/teacher_outputs/Conv2D/ReadVariableOpReadVariableOp6teacher_teacher_outputs_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
teacher/teacher_outputs/Conv2DConv2D)teacher/teacher_relu_5/Relu:activations:05teacher/teacher_outputs/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������*
paddingSAME*
strides
�
.teacher/teacher_outputs/BiasAdd/ReadVariableOpReadVariableOp7teacher_teacher_outputs_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
teacher/teacher_outputs/BiasAddBiasAdd'teacher/teacher_outputs/Conv2D:output:06teacher/teacher_outputs/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:����������
teacher/teacher_outputs/ReluRelu(teacher/teacher_outputs/BiasAdd:output:0*
T0*/
_output_shapes
:����������
IdentityIdentity*teacher/teacher_outputs/Relu:activations:0^NoOp*
T0*/
_output_shapes
:����������
NoOpNoOp0^teacher/teacher_conv2d_1/BiasAdd/ReadVariableOp/^teacher/teacher_conv2d_1/Conv2D/ReadVariableOp0^teacher/teacher_conv2d_2/BiasAdd/ReadVariableOp/^teacher/teacher_conv2d_2/Conv2D/ReadVariableOp0^teacher/teacher_conv2d_3/BiasAdd/ReadVariableOp/^teacher/teacher_conv2d_3/Conv2D/ReadVariableOp0^teacher/teacher_conv2d_4/BiasAdd/ReadVariableOp/^teacher/teacher_conv2d_4/Conv2D/ReadVariableOp-^teacher/teacher_dense/BiasAdd/ReadVariableOp,^teacher/teacher_dense/MatMul/ReadVariableOp.^teacher/teacher_latent/BiasAdd/ReadVariableOp-^teacher/teacher_latent/MatMul/ReadVariableOp/^teacher/teacher_outputs/BiasAdd/ReadVariableOp.^teacher/teacher_outputs/Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*J
_input_shapes9
7:���������: : : : : : : : : : : : : : 2b
/teacher/teacher_conv2d_1/BiasAdd/ReadVariableOp/teacher/teacher_conv2d_1/BiasAdd/ReadVariableOp2`
.teacher/teacher_conv2d_1/Conv2D/ReadVariableOp.teacher/teacher_conv2d_1/Conv2D/ReadVariableOp2b
/teacher/teacher_conv2d_2/BiasAdd/ReadVariableOp/teacher/teacher_conv2d_2/BiasAdd/ReadVariableOp2`
.teacher/teacher_conv2d_2/Conv2D/ReadVariableOp.teacher/teacher_conv2d_2/Conv2D/ReadVariableOp2b
/teacher/teacher_conv2d_3/BiasAdd/ReadVariableOp/teacher/teacher_conv2d_3/BiasAdd/ReadVariableOp2`
.teacher/teacher_conv2d_3/Conv2D/ReadVariableOp.teacher/teacher_conv2d_3/Conv2D/ReadVariableOp2b
/teacher/teacher_conv2d_4/BiasAdd/ReadVariableOp/teacher/teacher_conv2d_4/BiasAdd/ReadVariableOp2`
.teacher/teacher_conv2d_4/Conv2D/ReadVariableOp.teacher/teacher_conv2d_4/Conv2D/ReadVariableOp2\
,teacher/teacher_dense/BiasAdd/ReadVariableOp,teacher/teacher_dense/BiasAdd/ReadVariableOp2Z
+teacher/teacher_dense/MatMul/ReadVariableOp+teacher/teacher_dense/MatMul/ReadVariableOp2^
-teacher/teacher_latent/BiasAdd/ReadVariableOp-teacher/teacher_latent/BiasAdd/ReadVariableOp2\
,teacher/teacher_latent/MatMul/ReadVariableOp,teacher/teacher_latent/MatMul/ReadVariableOp2`
.teacher/teacher_outputs/BiasAdd/ReadVariableOp.teacher/teacher_outputs/BiasAdd/ReadVariableOp2^
-teacher/teacher_outputs/Conv2D/ReadVariableOp-teacher/teacher_outputs/Conv2D/ReadVariableOp:` \
/
_output_shapes
:���������
)
_user_specified_nameteacher_inputs_
�
i
M__inference_teacher_reshape2_layer_call_and_return_conditional_losses_6647022

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :	Q
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:l
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:���������	`
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
M
1__inference_teacher_reshape_layer_call_fn_6646871

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *U
fPRN
L__inference_teacher_reshape_layer_call_and_return_conditional_losses_6646026h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
0__inference_teacher_latent_layer_call_fn_6646973

inputs
unknown:	�P
	unknown_0:P
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������P*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_latent_layer_call_and_return_conditional_losses_6646094o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������P`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
L
0__inference_teacher_relu_3_layer_call_fn_6647027

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_3_layer_call_and_return_conditional_losses_6646137h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
g
K__inference_teacher_relu_2_layer_call_and_return_conditional_losses_6646953

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:���������	b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
i
M__inference_teacher_reshape2_layer_call_and_return_conditional_losses_6646130

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :	Q
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:l
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:���������	`
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
P
4__inference_teacher_upsampling_layer_call_fn_6647066

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *J
_output_shapes8
6:4������������������������������������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_teacher_upsampling_layer_call_and_return_conditional_losses_6646002�
IdentityIdentityPartitionedCall:output:0*
T0*J
_output_shapes8
6:4������������������������������������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4������������������������������������:r n
J
_output_shapes8
6:4������������������������������������
 
_user_specified_nameinputs
�
�
L__inference_teacher_outputs_layer_call_and_return_conditional_losses_6647127

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+���������������������������*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+���������������������������j
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+���������������������������{
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+���������������������������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
�
1__inference_teacher_outputs_layer_call_fn_6647116

inputs!
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *U
fPRN
L__inference_teacher_outputs_layer_call_and_return_conditional_losses_6646197�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+���������������������������: : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
L
0__inference_teacher_pool_1_layer_call_fn_6646919

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *J
_output_shapes8
6:4������������������������������������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_pool_1_layer_call_and_return_conditional_losses_6645983�
IdentityIdentityPartitionedCall:output:0*
T0*J
_output_shapes8
6:4������������������������������������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4������������������������������������:r n
J
_output_shapes8
6:4������������������������������������
 
_user_specified_nameinputs
�
k
O__inference_teacher_upsampling_layer_call_and_return_conditional_losses_6647078

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:V
ConstConst*
_output_shapes
:*
dtype0*
valueB"      W
mulMulstrided_slice:output:0Const:output:0*
T0*
_output_shapes
:�
resize/ResizeNearestNeighborResizeNearestNeighborinputsmul:z:0*
T0*J
_output_shapes8
6:4������������������������������������*
half_pixel_centers(�
IdentityIdentity-resize/ResizeNearestNeighbor:resized_images:0*
T0*J
_output_shapes8
6:4������������������������������������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4������������������������������������:r n
J
_output_shapes8
6:4������������������������������������
 
_user_specified_nameinputs
�
g
K__inference_teacher_pool_1_layer_call_and_return_conditional_losses_6646924

inputs
identity�
AvgPoolAvgPoolinputs*
T0*J
_output_shapes8
6:4������������������������������������*
ksize
*
paddingVALID*
strides
{
IdentityIdentityAvgPool:output:0*
T0*J
_output_shapes8
6:4������������������������������������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4������������������������������������:r n
J
_output_shapes8
6:4������������������������������������
 
_user_specified_nameinputs
�
L
0__inference_teacher_relu_5_layer_call_fn_6647102

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_5_layer_call_and_return_conditional_losses_6646184z
IdentityIdentityPartitionedCall:output:0*
T0*A
_output_shapes/
-:+���������������������������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-:+���������������������������:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
L
0__inference_teacher_relu_4_layer_call_fn_6647056

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_4_layer_call_and_return_conditional_losses_6646160h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
L__inference_teacher_outputs_layer_call_and_return_conditional_losses_6646197

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+���������������������������*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+���������������������������j
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+���������������������������{
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+���������������������������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�
g
K__inference_teacher_relu_1_layer_call_and_return_conditional_losses_6646914

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:���������b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
2__inference_teacher_conv2d_4_layer_call_fn_6647087

inputs!
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_6646173�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+���������������������������: : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�	
�
J__inference_teacher_dense_layer_call_and_return_conditional_losses_6647003

inputs1
matmul_readvariableop_resource:	P�.
biasadd_readvariableop_resource:	�
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	P�*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:�*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������`
IdentityIdentityBiasAdd:output:0^NoOp*
T0*(
_output_shapes
:����������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������P: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������P
 
_user_specified_nameinputs
�

�
M__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_6646038

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������g
IdentityIdentityBiasAdd:output:0^NoOp*
T0*/
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
M__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_6647097

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+���������������������������*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+���������������������������y
IdentityIdentityBiasAdd:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+���������������������������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:i e
A
_output_shapes/
-:+���������������������������
 
_user_specified_nameinputs
�

�
M__inference_teacher_conv2d_3_layer_call_and_return_conditional_losses_6646149

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	g
IdentityIdentityBiasAdd:output:0^NoOp*
T0*/
_output_shapes
:���������	w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
L
0__inference_teacher_relu_2_layer_call_fn_6646948

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_2_layer_call_and_return_conditional_losses_6646073h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
N
2__inference_teacher_reshape2_layer_call_fn_6647008

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_reshape2_layer_call_and_return_conditional_losses_6646130h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�H
�
D__inference_teacher_layer_call_and_return_conditional_losses_6646437

inputs2
teacher_conv2d_1_6646392:&
teacher_conv2d_1_6646394:2
teacher_conv2d_2_6646399:&
teacher_conv2d_2_6646401:)
teacher_latent_6646406:	�P$
teacher_latent_6646408:P(
teacher_dense_6646411:	P�$
teacher_dense_6646413:	�2
teacher_conv2d_3_6646418:&
teacher_conv2d_3_6646420:2
teacher_conv2d_4_6646425:&
teacher_conv2d_4_6646427:1
teacher_outputs_6646431:%
teacher_outputs_6646433:
identity��(teacher_conv2d_1/StatefulPartitionedCall�(teacher_conv2d_2/StatefulPartitionedCall�(teacher_conv2d_3/StatefulPartitionedCall�(teacher_conv2d_4/StatefulPartitionedCall�%teacher_dense/StatefulPartitionedCall�&teacher_latent/StatefulPartitionedCall�'teacher_outputs/StatefulPartitionedCall�
teacher_reshape/PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *U
fPRN
L__inference_teacher_reshape_layer_call_and_return_conditional_losses_6646026�
(teacher_conv2d_1/StatefulPartitionedCallStatefulPartitionedCall(teacher_reshape/PartitionedCall:output:0teacher_conv2d_1_6646392teacher_conv2d_1_6646394*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_6646038�
teacher_relu_1/PartitionedCallPartitionedCall1teacher_conv2d_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_1_layer_call_and_return_conditional_losses_6646049�
teacher_pool_1/PartitionedCallPartitionedCall'teacher_relu_1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_pool_1_layer_call_and_return_conditional_losses_6645983�
(teacher_conv2d_2/StatefulPartitionedCallStatefulPartitionedCall'teacher_pool_1/PartitionedCall:output:0teacher_conv2d_2_6646399teacher_conv2d_2_6646401*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_6646062�
teacher_relu_2/PartitionedCallPartitionedCall1teacher_conv2d_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_2_layer_call_and_return_conditional_losses_6646073�
teacher_flatten/PartitionedCallPartitionedCall'teacher_relu_2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *U
fPRN
L__inference_teacher_flatten_layer_call_and_return_conditional_losses_6646081�
&teacher_latent/StatefulPartitionedCallStatefulPartitionedCall(teacher_flatten/PartitionedCall:output:0teacher_latent_6646406teacher_latent_6646408*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������P*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_latent_layer_call_and_return_conditional_losses_6646094�
%teacher_dense/StatefulPartitionedCallStatefulPartitionedCall/teacher_latent/StatefulPartitionedCall:output:0teacher_dense_6646411teacher_dense_6646413*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *S
fNRL
J__inference_teacher_dense_layer_call_and_return_conditional_losses_6646110�
 teacher_reshape2/PartitionedCallPartitionedCall.teacher_dense/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_reshape2_layer_call_and_return_conditional_losses_6646130�
teacher_relu_3/PartitionedCallPartitionedCall)teacher_reshape2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_3_layer_call_and_return_conditional_losses_6646137�
(teacher_conv2d_3/StatefulPartitionedCallStatefulPartitionedCall'teacher_relu_3/PartitionedCall:output:0teacher_conv2d_3_6646418teacher_conv2d_3_6646420*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_conv2d_3_layer_call_and_return_conditional_losses_6646149�
teacher_relu_4/PartitionedCallPartitionedCall1teacher_conv2d_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_4_layer_call_and_return_conditional_losses_6646160�
"teacher_upsampling/PartitionedCallPartitionedCall'teacher_relu_4/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_teacher_upsampling_layer_call_and_return_conditional_losses_6646002�
(teacher_conv2d_4/StatefulPartitionedCallStatefulPartitionedCall+teacher_upsampling/PartitionedCall:output:0teacher_conv2d_4_6646425teacher_conv2d_4_6646427*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_6646173�
teacher_relu_5/PartitionedCallPartitionedCall1teacher_conv2d_4/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_5_layer_call_and_return_conditional_losses_6646184�
'teacher_outputs/StatefulPartitionedCallStatefulPartitionedCall'teacher_relu_5/PartitionedCall:output:0teacher_outputs_6646431teacher_outputs_6646433*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *U
fPRN
L__inference_teacher_outputs_layer_call_and_return_conditional_losses_6646197�
IdentityIdentity0teacher_outputs/StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp)^teacher_conv2d_1/StatefulPartitionedCall)^teacher_conv2d_2/StatefulPartitionedCall)^teacher_conv2d_3/StatefulPartitionedCall)^teacher_conv2d_4/StatefulPartitionedCall&^teacher_dense/StatefulPartitionedCall'^teacher_latent/StatefulPartitionedCall(^teacher_outputs/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*J
_input_shapes9
7:���������: : : : : : : : : : : : : : 2T
(teacher_conv2d_1/StatefulPartitionedCall(teacher_conv2d_1/StatefulPartitionedCall2T
(teacher_conv2d_2/StatefulPartitionedCall(teacher_conv2d_2/StatefulPartitionedCall2T
(teacher_conv2d_3/StatefulPartitionedCall(teacher_conv2d_3/StatefulPartitionedCall2T
(teacher_conv2d_4/StatefulPartitionedCall(teacher_conv2d_4/StatefulPartitionedCall2N
%teacher_dense/StatefulPartitionedCall%teacher_dense/StatefulPartitionedCall2P
&teacher_latent/StatefulPartitionedCall&teacher_latent/StatefulPartitionedCall2R
'teacher_outputs/StatefulPartitionedCall'teacher_outputs/StatefulPartitionedCall:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
h
L__inference_teacher_reshape_layer_call_and_return_conditional_losses_6646885

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:l
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:���������`
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
)__inference_teacher_layer_call_fn_6646673

inputs!
unknown:
	unknown_0:#
	unknown_1:
	unknown_2:
	unknown_3:	�P
	unknown_4:P
	unknown_5:	P�
	unknown_6:	�#
	unknown_7:
	unknown_8:#
	unknown_9:

unknown_10:$

unknown_11:

unknown_12:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_teacher_layer_call_and_return_conditional_losses_6646204�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*J
_input_shapes9
7:���������: : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�H
�
D__inference_teacher_layer_call_and_return_conditional_losses_6646204

inputs2
teacher_conv2d_1_6646039:&
teacher_conv2d_1_6646041:2
teacher_conv2d_2_6646063:&
teacher_conv2d_2_6646065:)
teacher_latent_6646095:	�P$
teacher_latent_6646097:P(
teacher_dense_6646111:	P�$
teacher_dense_6646113:	�2
teacher_conv2d_3_6646150:&
teacher_conv2d_3_6646152:2
teacher_conv2d_4_6646174:&
teacher_conv2d_4_6646176:1
teacher_outputs_6646198:%
teacher_outputs_6646200:
identity��(teacher_conv2d_1/StatefulPartitionedCall�(teacher_conv2d_2/StatefulPartitionedCall�(teacher_conv2d_3/StatefulPartitionedCall�(teacher_conv2d_4/StatefulPartitionedCall�%teacher_dense/StatefulPartitionedCall�&teacher_latent/StatefulPartitionedCall�'teacher_outputs/StatefulPartitionedCall�
teacher_reshape/PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *U
fPRN
L__inference_teacher_reshape_layer_call_and_return_conditional_losses_6646026�
(teacher_conv2d_1/StatefulPartitionedCallStatefulPartitionedCall(teacher_reshape/PartitionedCall:output:0teacher_conv2d_1_6646039teacher_conv2d_1_6646041*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_6646038�
teacher_relu_1/PartitionedCallPartitionedCall1teacher_conv2d_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_1_layer_call_and_return_conditional_losses_6646049�
teacher_pool_1/PartitionedCallPartitionedCall'teacher_relu_1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_pool_1_layer_call_and_return_conditional_losses_6645983�
(teacher_conv2d_2/StatefulPartitionedCallStatefulPartitionedCall'teacher_pool_1/PartitionedCall:output:0teacher_conv2d_2_6646063teacher_conv2d_2_6646065*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_6646062�
teacher_relu_2/PartitionedCallPartitionedCall1teacher_conv2d_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_2_layer_call_and_return_conditional_losses_6646073�
teacher_flatten/PartitionedCallPartitionedCall'teacher_relu_2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *U
fPRN
L__inference_teacher_flatten_layer_call_and_return_conditional_losses_6646081�
&teacher_latent/StatefulPartitionedCallStatefulPartitionedCall(teacher_flatten/PartitionedCall:output:0teacher_latent_6646095teacher_latent_6646097*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������P*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_latent_layer_call_and_return_conditional_losses_6646094�
%teacher_dense/StatefulPartitionedCallStatefulPartitionedCall/teacher_latent/StatefulPartitionedCall:output:0teacher_dense_6646111teacher_dense_6646113*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *S
fNRL
J__inference_teacher_dense_layer_call_and_return_conditional_losses_6646110�
 teacher_reshape2/PartitionedCallPartitionedCall.teacher_dense/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_reshape2_layer_call_and_return_conditional_losses_6646130�
teacher_relu_3/PartitionedCallPartitionedCall)teacher_reshape2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_3_layer_call_and_return_conditional_losses_6646137�
(teacher_conv2d_3/StatefulPartitionedCallStatefulPartitionedCall'teacher_relu_3/PartitionedCall:output:0teacher_conv2d_3_6646150teacher_conv2d_3_6646152*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_conv2d_3_layer_call_and_return_conditional_losses_6646149�
teacher_relu_4/PartitionedCallPartitionedCall1teacher_conv2d_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_4_layer_call_and_return_conditional_losses_6646160�
"teacher_upsampling/PartitionedCallPartitionedCall'teacher_relu_4/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_teacher_upsampling_layer_call_and_return_conditional_losses_6646002�
(teacher_conv2d_4/StatefulPartitionedCallStatefulPartitionedCall+teacher_upsampling/PartitionedCall:output:0teacher_conv2d_4_6646174teacher_conv2d_4_6646176*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_6646173�
teacher_relu_5/PartitionedCallPartitionedCall1teacher_conv2d_4/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *T
fORM
K__inference_teacher_relu_5_layer_call_and_return_conditional_losses_6646184�
'teacher_outputs/StatefulPartitionedCallStatefulPartitionedCall'teacher_relu_5/PartitionedCall:output:0teacher_outputs_6646198teacher_outputs_6646200*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *U
fPRN
L__inference_teacher_outputs_layer_call_and_return_conditional_losses_6646197�
IdentityIdentity0teacher_outputs/StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp)^teacher_conv2d_1/StatefulPartitionedCall)^teacher_conv2d_2/StatefulPartitionedCall)^teacher_conv2d_3/StatefulPartitionedCall)^teacher_conv2d_4/StatefulPartitionedCall&^teacher_dense/StatefulPartitionedCall'^teacher_latent/StatefulPartitionedCall(^teacher_outputs/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*J
_input_shapes9
7:���������: : : : : : : : : : : : : : 2T
(teacher_conv2d_1/StatefulPartitionedCall(teacher_conv2d_1/StatefulPartitionedCall2T
(teacher_conv2d_2/StatefulPartitionedCall(teacher_conv2d_2/StatefulPartitionedCall2T
(teacher_conv2d_3/StatefulPartitionedCall(teacher_conv2d_3/StatefulPartitionedCall2T
(teacher_conv2d_4/StatefulPartitionedCall(teacher_conv2d_4/StatefulPartitionedCall2N
%teacher_dense/StatefulPartitionedCall%teacher_dense/StatefulPartitionedCall2P
&teacher_latent/StatefulPartitionedCall&teacher_latent/StatefulPartitionedCall2R
'teacher_outputs/StatefulPartitionedCall'teacher_outputs/StatefulPartitionedCall:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
g
K__inference_teacher_relu_1_layer_call_and_return_conditional_losses_6646049

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:���������b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
/__inference_teacher_dense_layer_call_fn_6646993

inputs
unknown:	P�
	unknown_0:	�
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *S
fNRL
J__inference_teacher_dense_layer_call_and_return_conditional_losses_6646110p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������P: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������P
 
_user_specified_nameinputs
�
�
)__inference_teacher_layer_call_fn_6646706

inputs!
unknown:
	unknown_0:#
	unknown_1:
	unknown_2:
	unknown_3:	�P
	unknown_4:P
	unknown_5:	P�
	unknown_6:	�#
	unknown_7:
	unknown_8:#
	unknown_9:

unknown_10:$

unknown_11:

unknown_12:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_teacher_layer_call_and_return_conditional_losses_6646437�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*J
_input_shapes9
7:���������: : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�i
�
 __inference__traced_save_6647297
file_prefix6
2savev2_teacher_conv2d_1_kernel_read_readvariableop4
0savev2_teacher_conv2d_1_bias_read_readvariableop6
2savev2_teacher_conv2d_2_kernel_read_readvariableop4
0savev2_teacher_conv2d_2_bias_read_readvariableop4
0savev2_teacher_latent_kernel_read_readvariableop2
.savev2_teacher_latent_bias_read_readvariableop3
/savev2_teacher_dense_kernel_read_readvariableop1
-savev2_teacher_dense_bias_read_readvariableop6
2savev2_teacher_conv2d_3_kernel_read_readvariableop4
0savev2_teacher_conv2d_3_bias_read_readvariableop6
2savev2_teacher_conv2d_4_kernel_read_readvariableop4
0savev2_teacher_conv2d_4_bias_read_readvariableop5
1savev2_teacher_outputs_kernel_read_readvariableop3
/savev2_teacher_outputs_bias_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop=
9savev2_adam_teacher_conv2d_1_kernel_m_read_readvariableop;
7savev2_adam_teacher_conv2d_1_bias_m_read_readvariableop=
9savev2_adam_teacher_conv2d_2_kernel_m_read_readvariableop;
7savev2_adam_teacher_conv2d_2_bias_m_read_readvariableop;
7savev2_adam_teacher_latent_kernel_m_read_readvariableop9
5savev2_adam_teacher_latent_bias_m_read_readvariableop:
6savev2_adam_teacher_dense_kernel_m_read_readvariableop8
4savev2_adam_teacher_dense_bias_m_read_readvariableop=
9savev2_adam_teacher_conv2d_3_kernel_m_read_readvariableop;
7savev2_adam_teacher_conv2d_3_bias_m_read_readvariableop=
9savev2_adam_teacher_conv2d_4_kernel_m_read_readvariableop;
7savev2_adam_teacher_conv2d_4_bias_m_read_readvariableop<
8savev2_adam_teacher_outputs_kernel_m_read_readvariableop:
6savev2_adam_teacher_outputs_bias_m_read_readvariableop=
9savev2_adam_teacher_conv2d_1_kernel_v_read_readvariableop;
7savev2_adam_teacher_conv2d_1_bias_v_read_readvariableop=
9savev2_adam_teacher_conv2d_2_kernel_v_read_readvariableop;
7savev2_adam_teacher_conv2d_2_bias_v_read_readvariableop;
7savev2_adam_teacher_latent_kernel_v_read_readvariableop9
5savev2_adam_teacher_latent_bias_v_read_readvariableop:
6savev2_adam_teacher_dense_kernel_v_read_readvariableop8
4savev2_adam_teacher_dense_bias_v_read_readvariableop=
9savev2_adam_teacher_conv2d_3_kernel_v_read_readvariableop;
7savev2_adam_teacher_conv2d_3_bias_v_read_readvariableop=
9savev2_adam_teacher_conv2d_4_kernel_v_read_readvariableop;
7savev2_adam_teacher_conv2d_4_bias_v_read_readvariableop<
8savev2_adam_teacher_outputs_kernel_v_read_readvariableop:
6savev2_adam_teacher_outputs_bias_v_read_readvariableop
savev2_const

identity_1��MergeV2Checkpointsw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part�
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : �
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: �
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:2*
dtype0*�
value�B�2B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:2*
dtype0*w
valuenBl2B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B �
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:02savev2_teacher_conv2d_1_kernel_read_readvariableop0savev2_teacher_conv2d_1_bias_read_readvariableop2savev2_teacher_conv2d_2_kernel_read_readvariableop0savev2_teacher_conv2d_2_bias_read_readvariableop0savev2_teacher_latent_kernel_read_readvariableop.savev2_teacher_latent_bias_read_readvariableop/savev2_teacher_dense_kernel_read_readvariableop-savev2_teacher_dense_bias_read_readvariableop2savev2_teacher_conv2d_3_kernel_read_readvariableop0savev2_teacher_conv2d_3_bias_read_readvariableop2savev2_teacher_conv2d_4_kernel_read_readvariableop0savev2_teacher_conv2d_4_bias_read_readvariableop1savev2_teacher_outputs_kernel_read_readvariableop/savev2_teacher_outputs_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop9savev2_adam_teacher_conv2d_1_kernel_m_read_readvariableop7savev2_adam_teacher_conv2d_1_bias_m_read_readvariableop9savev2_adam_teacher_conv2d_2_kernel_m_read_readvariableop7savev2_adam_teacher_conv2d_2_bias_m_read_readvariableop7savev2_adam_teacher_latent_kernel_m_read_readvariableop5savev2_adam_teacher_latent_bias_m_read_readvariableop6savev2_adam_teacher_dense_kernel_m_read_readvariableop4savev2_adam_teacher_dense_bias_m_read_readvariableop9savev2_adam_teacher_conv2d_3_kernel_m_read_readvariableop7savev2_adam_teacher_conv2d_3_bias_m_read_readvariableop9savev2_adam_teacher_conv2d_4_kernel_m_read_readvariableop7savev2_adam_teacher_conv2d_4_bias_m_read_readvariableop8savev2_adam_teacher_outputs_kernel_m_read_readvariableop6savev2_adam_teacher_outputs_bias_m_read_readvariableop9savev2_adam_teacher_conv2d_1_kernel_v_read_readvariableop7savev2_adam_teacher_conv2d_1_bias_v_read_readvariableop9savev2_adam_teacher_conv2d_2_kernel_v_read_readvariableop7savev2_adam_teacher_conv2d_2_bias_v_read_readvariableop7savev2_adam_teacher_latent_kernel_v_read_readvariableop5savev2_adam_teacher_latent_bias_v_read_readvariableop6savev2_adam_teacher_dense_kernel_v_read_readvariableop4savev2_adam_teacher_dense_bias_v_read_readvariableop9savev2_adam_teacher_conv2d_3_kernel_v_read_readvariableop7savev2_adam_teacher_conv2d_3_bias_v_read_readvariableop9savev2_adam_teacher_conv2d_4_kernel_v_read_readvariableop7savev2_adam_teacher_conv2d_4_bias_v_read_readvariableop8savev2_adam_teacher_outputs_kernel_v_read_readvariableop6savev2_adam_teacher_outputs_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *@
dtypes6
422	�
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:�
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*�
_input_shapes�
�: :::::	�P:P:	P�:�::::::: : : : : : : :::::	�P:P:	P�:�:::::::::::	�P:P:	P�:�::::::: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:,(
&
_output_shapes
:: 

_output_shapes
::,(
&
_output_shapes
:: 

_output_shapes
::%!

_output_shapes
:	�P: 

_output_shapes
:P:%!

_output_shapes
:	P�:!

_output_shapes	
:�:,	(
&
_output_shapes
:: 


_output_shapes
::,(
&
_output_shapes
:: 

_output_shapes
::,(
&
_output_shapes
:: 

_output_shapes
::

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :,(
&
_output_shapes
:: 

_output_shapes
::,(
&
_output_shapes
:: 

_output_shapes
::%!

_output_shapes
:	�P: 

_output_shapes
:P:%!

_output_shapes
:	P�:!

_output_shapes	
:�:,(
&
_output_shapes
:: 

_output_shapes
::, (
&
_output_shapes
:: !

_output_shapes
::,"(
&
_output_shapes
:: #

_output_shapes
::,$(
&
_output_shapes
:: %

_output_shapes
::,&(
&
_output_shapes
:: '

_output_shapes
::%(!

_output_shapes
:	�P: )

_output_shapes
:P:%*!

_output_shapes
:	P�:!+

_output_shapes	
:�:,,(
&
_output_shapes
:: -

_output_shapes
::,.(
&
_output_shapes
:: /

_output_shapes
::,0(
&
_output_shapes
:: 1

_output_shapes
::2

_output_shapes
: 
�

�
M__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_6646062

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	g
IdentityIdentityBiasAdd:output:0^NoOp*
T0*/
_output_shapes
:���������	w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
��
�!
#__inference__traced_restore_6647454
file_prefixB
(assignvariableop_teacher_conv2d_1_kernel:6
(assignvariableop_1_teacher_conv2d_1_bias:D
*assignvariableop_2_teacher_conv2d_2_kernel:6
(assignvariableop_3_teacher_conv2d_2_bias:;
(assignvariableop_4_teacher_latent_kernel:	�P4
&assignvariableop_5_teacher_latent_bias:P:
'assignvariableop_6_teacher_dense_kernel:	P�4
%assignvariableop_7_teacher_dense_bias:	�D
*assignvariableop_8_teacher_conv2d_3_kernel:6
(assignvariableop_9_teacher_conv2d_3_bias:E
+assignvariableop_10_teacher_conv2d_4_kernel:7
)assignvariableop_11_teacher_conv2d_4_bias:D
*assignvariableop_12_teacher_outputs_kernel:6
(assignvariableop_13_teacher_outputs_bias:'
assignvariableop_14_adam_iter:	 )
assignvariableop_15_adam_beta_1: )
assignvariableop_16_adam_beta_2: (
assignvariableop_17_adam_decay: 0
&assignvariableop_18_adam_learning_rate: #
assignvariableop_19_total: #
assignvariableop_20_count: L
2assignvariableop_21_adam_teacher_conv2d_1_kernel_m:>
0assignvariableop_22_adam_teacher_conv2d_1_bias_m:L
2assignvariableop_23_adam_teacher_conv2d_2_kernel_m:>
0assignvariableop_24_adam_teacher_conv2d_2_bias_m:C
0assignvariableop_25_adam_teacher_latent_kernel_m:	�P<
.assignvariableop_26_adam_teacher_latent_bias_m:PB
/assignvariableop_27_adam_teacher_dense_kernel_m:	P�<
-assignvariableop_28_adam_teacher_dense_bias_m:	�L
2assignvariableop_29_adam_teacher_conv2d_3_kernel_m:>
0assignvariableop_30_adam_teacher_conv2d_3_bias_m:L
2assignvariableop_31_adam_teacher_conv2d_4_kernel_m:>
0assignvariableop_32_adam_teacher_conv2d_4_bias_m:K
1assignvariableop_33_adam_teacher_outputs_kernel_m:=
/assignvariableop_34_adam_teacher_outputs_bias_m:L
2assignvariableop_35_adam_teacher_conv2d_1_kernel_v:>
0assignvariableop_36_adam_teacher_conv2d_1_bias_v:L
2assignvariableop_37_adam_teacher_conv2d_2_kernel_v:>
0assignvariableop_38_adam_teacher_conv2d_2_bias_v:C
0assignvariableop_39_adam_teacher_latent_kernel_v:	�P<
.assignvariableop_40_adam_teacher_latent_bias_v:PB
/assignvariableop_41_adam_teacher_dense_kernel_v:	P�<
-assignvariableop_42_adam_teacher_dense_bias_v:	�L
2assignvariableop_43_adam_teacher_conv2d_3_kernel_v:>
0assignvariableop_44_adam_teacher_conv2d_3_bias_v:L
2assignvariableop_45_adam_teacher_conv2d_4_kernel_v:>
0assignvariableop_46_adam_teacher_conv2d_4_bias_v:K
1assignvariableop_47_adam_teacher_outputs_kernel_v:=
/assignvariableop_48_adam_teacher_outputs_bias_v:
identity_50��AssignVariableOp�AssignVariableOp_1�AssignVariableOp_10�AssignVariableOp_11�AssignVariableOp_12�AssignVariableOp_13�AssignVariableOp_14�AssignVariableOp_15�AssignVariableOp_16�AssignVariableOp_17�AssignVariableOp_18�AssignVariableOp_19�AssignVariableOp_2�AssignVariableOp_20�AssignVariableOp_21�AssignVariableOp_22�AssignVariableOp_23�AssignVariableOp_24�AssignVariableOp_25�AssignVariableOp_26�AssignVariableOp_27�AssignVariableOp_28�AssignVariableOp_29�AssignVariableOp_3�AssignVariableOp_30�AssignVariableOp_31�AssignVariableOp_32�AssignVariableOp_33�AssignVariableOp_34�AssignVariableOp_35�AssignVariableOp_36�AssignVariableOp_37�AssignVariableOp_38�AssignVariableOp_39�AssignVariableOp_4�AssignVariableOp_40�AssignVariableOp_41�AssignVariableOp_42�AssignVariableOp_43�AssignVariableOp_44�AssignVariableOp_45�AssignVariableOp_46�AssignVariableOp_47�AssignVariableOp_48�AssignVariableOp_5�AssignVariableOp_6�AssignVariableOp_7�AssignVariableOp_8�AssignVariableOp_9�
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:2*
dtype0*�
value�B�2B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:2*
dtype0*w
valuenBl2B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B �
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*�
_output_shapes�
�::::::::::::::::::::::::::::::::::::::::::::::::::*@
dtypes6
422	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOpAssignVariableOp(assignvariableop_teacher_conv2d_1_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_1AssignVariableOp(assignvariableop_1_teacher_conv2d_1_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_2AssignVariableOp*assignvariableop_2_teacher_conv2d_2_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_3AssignVariableOp(assignvariableop_3_teacher_conv2d_2_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_4AssignVariableOp(assignvariableop_4_teacher_latent_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_5AssignVariableOp&assignvariableop_5_teacher_latent_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_6AssignVariableOp'assignvariableop_6_teacher_dense_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_7AssignVariableOp%assignvariableop_7_teacher_dense_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_8AssignVariableOp*assignvariableop_8_teacher_conv2d_3_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_9AssignVariableOp(assignvariableop_9_teacher_conv2d_3_biasIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_10AssignVariableOp+assignvariableop_10_teacher_conv2d_4_kernelIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_11AssignVariableOp)assignvariableop_11_teacher_conv2d_4_biasIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_12AssignVariableOp*assignvariableop_12_teacher_outputs_kernelIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_13AssignVariableOp(assignvariableop_13_teacher_outputs_biasIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_14AssignVariableOpassignvariableop_14_adam_iterIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_15AssignVariableOpassignvariableop_15_adam_beta_1Identity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_16AssignVariableOpassignvariableop_16_adam_beta_2Identity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_17AssignVariableOpassignvariableop_17_adam_decayIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_18AssignVariableOp&assignvariableop_18_adam_learning_rateIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_19AssignVariableOpassignvariableop_19_totalIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_20AssignVariableOpassignvariableop_20_countIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_21AssignVariableOp2assignvariableop_21_adam_teacher_conv2d_1_kernel_mIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_22AssignVariableOp0assignvariableop_22_adam_teacher_conv2d_1_bias_mIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_23AssignVariableOp2assignvariableop_23_adam_teacher_conv2d_2_kernel_mIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_24AssignVariableOp0assignvariableop_24_adam_teacher_conv2d_2_bias_mIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_25AssignVariableOp0assignvariableop_25_adam_teacher_latent_kernel_mIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_26AssignVariableOp.assignvariableop_26_adam_teacher_latent_bias_mIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_27AssignVariableOp/assignvariableop_27_adam_teacher_dense_kernel_mIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_28AssignVariableOp-assignvariableop_28_adam_teacher_dense_bias_mIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_29AssignVariableOp2assignvariableop_29_adam_teacher_conv2d_3_kernel_mIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_30AssignVariableOp0assignvariableop_30_adam_teacher_conv2d_3_bias_mIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_31AssignVariableOp2assignvariableop_31_adam_teacher_conv2d_4_kernel_mIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_32AssignVariableOp0assignvariableop_32_adam_teacher_conv2d_4_bias_mIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_33AssignVariableOp1assignvariableop_33_adam_teacher_outputs_kernel_mIdentity_33:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_34AssignVariableOp/assignvariableop_34_adam_teacher_outputs_bias_mIdentity_34:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_35AssignVariableOp2assignvariableop_35_adam_teacher_conv2d_1_kernel_vIdentity_35:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_36AssignVariableOp0assignvariableop_36_adam_teacher_conv2d_1_bias_vIdentity_36:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_37AssignVariableOp2assignvariableop_37_adam_teacher_conv2d_2_kernel_vIdentity_37:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_38AssignVariableOp0assignvariableop_38_adam_teacher_conv2d_2_bias_vIdentity_38:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_39AssignVariableOp0assignvariableop_39_adam_teacher_latent_kernel_vIdentity_39:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_40AssignVariableOp.assignvariableop_40_adam_teacher_latent_bias_vIdentity_40:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_41AssignVariableOp/assignvariableop_41_adam_teacher_dense_kernel_vIdentity_41:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_42IdentityRestoreV2:tensors:42"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_42AssignVariableOp-assignvariableop_42_adam_teacher_dense_bias_vIdentity_42:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_43IdentityRestoreV2:tensors:43"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_43AssignVariableOp2assignvariableop_43_adam_teacher_conv2d_3_kernel_vIdentity_43:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_44IdentityRestoreV2:tensors:44"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_44AssignVariableOp0assignvariableop_44_adam_teacher_conv2d_3_bias_vIdentity_44:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_45IdentityRestoreV2:tensors:45"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_45AssignVariableOp2assignvariableop_45_adam_teacher_conv2d_4_kernel_vIdentity_45:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_46IdentityRestoreV2:tensors:46"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_46AssignVariableOp0assignvariableop_46_adam_teacher_conv2d_4_bias_vIdentity_46:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_47IdentityRestoreV2:tensors:47"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_47AssignVariableOp1assignvariableop_47_adam_teacher_outputs_kernel_vIdentity_47:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_48IdentityRestoreV2:tensors:48"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_48AssignVariableOp/assignvariableop_48_adam_teacher_outputs_bias_vIdentity_48:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 �	
Identity_49Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_50IdentityIdentity_49:output:0^NoOp_1*
T0*
_output_shapes
: �
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_50Identity_50:output:0*w
_input_shapesf
d: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382*
AssignVariableOp_39AssignVariableOp_392(
AssignVariableOp_4AssignVariableOp_42*
AssignVariableOp_40AssignVariableOp_402*
AssignVariableOp_41AssignVariableOp_412*
AssignVariableOp_42AssignVariableOp_422*
AssignVariableOp_43AssignVariableOp_432*
AssignVariableOp_44AssignVariableOp_442*
AssignVariableOp_45AssignVariableOp_452*
AssignVariableOp_46AssignVariableOp_462*
AssignVariableOp_47AssignVariableOp_472*
AssignVariableOp_48AssignVariableOp_482(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
�
g
K__inference_teacher_relu_2_layer_call_and_return_conditional_losses_6646073

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:���������	b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
g
K__inference_teacher_pool_1_layer_call_and_return_conditional_losses_6645983

inputs
identity�
AvgPoolAvgPoolinputs*
T0*J
_output_shapes8
6:4������������������������������������*
ksize
*
paddingVALID*
strides
{
IdentityIdentityAvgPool:output:0*
T0*J
_output_shapes8
6:4������������������������������������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4������������������������������������:r n
J
_output_shapes8
6:4������������������������������������
 
_user_specified_nameinputs
�

�
M__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_6646904

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������g
IdentityIdentityBiasAdd:output:0^NoOp*
T0*/
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
2__inference_teacher_conv2d_1_layer_call_fn_6646894

inputs!
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_6646038w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
)__inference_teacher_layer_call_fn_6646501
teacher_inputs_!
unknown:
	unknown_0:#
	unknown_1:
	unknown_2:
	unknown_3:	�P
	unknown_4:P
	unknown_5:	P�
	unknown_6:	�#
	unknown_7:
	unknown_8:#
	unknown_9:

unknown_10:$

unknown_11:

unknown_12:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallteacher_inputs_unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_teacher_layer_call_and_return_conditional_losses_6646437�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*J
_input_shapes9
7:���������: : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:` \
/
_output_shapes
:���������
)
_user_specified_nameteacher_inputs_
�
g
K__inference_teacher_relu_3_layer_call_and_return_conditional_losses_6646137

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:���������	b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
g
K__inference_teacher_relu_4_layer_call_and_return_conditional_losses_6647061

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:���������	b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�

�
K__inference_teacher_latent_layer_call_and_return_conditional_losses_6646984

inputs1
matmul_readvariableop_resource:	�P-
biasadd_readvariableop_resource:P
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�P*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������Pr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:P*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������PP
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������Pa
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������Pw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
%__inference_signature_wrapper_6646640
teacher_inputs_!
unknown:
	unknown_0:#
	unknown_1:
	unknown_2:
	unknown_3:	�P
	unknown_4:P
	unknown_5:	P�
	unknown_6:	�#
	unknown_7:
	unknown_8:#
	unknown_9:

unknown_10:$

unknown_11:

unknown_12:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallteacher_inputs_unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *+
f&R$
"__inference__wrapped_model_6645974w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*J
_input_shapes9
7:���������: : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:` \
/
_output_shapes
:���������
)
_user_specified_nameteacher_inputs_
�
g
K__inference_teacher_relu_3_layer_call_and_return_conditional_losses_6647032

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:���������	b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:���������	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�

�
M__inference_teacher_conv2d_3_layer_call_and_return_conditional_losses_6647051

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	g
IdentityIdentityBiasAdd:output:0^NoOp*
T0*/
_output_shapes
:���������	w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
�
2__inference_teacher_conv2d_3_layer_call_fn_6647041

inputs!
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *V
fQRO
M__inference_teacher_conv2d_3_layer_call_and_return_conditional_losses_6646149w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
M
1__inference_teacher_flatten_layer_call_fn_6646958

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *U
fPRN
L__inference_teacher_flatten_layer_call_and_return_conditional_losses_6646081a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:����������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������	:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�

�
M__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_6646943

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������	g
IdentityIdentityBiasAdd:output:0^NoOp*
T0*/
_output_shapes
:���������	w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:���������	
 
_user_specified_nameinputs
�
h
L__inference_teacher_reshape_layer_call_and_return_conditional_losses_6646026

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :�
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:l
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:���������`
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:���������:W S
/
_output_shapes
:���������
 
_user_specified_nameinputs
�
k
O__inference_teacher_upsampling_layer_call_and_return_conditional_losses_6646002

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:V
ConstConst*
_output_shapes
:*
dtype0*
valueB"      W
mulMulstrided_slice:output:0Const:output:0*
T0*
_output_shapes
:�
resize/ResizeNearestNeighborResizeNearestNeighborinputsmul:z:0*
T0*J
_output_shapes8
6:4������������������������������������*
half_pixel_centers(�
IdentityIdentity-resize/ResizeNearestNeighbor:resized_images:0*
T0*J
_output_shapes8
6:4������������������������������������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4������������������������������������:r n
J
_output_shapes8
6:4������������������������������������
 
_user_specified_nameinputs"�	L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*�
serving_default�
S
teacher_inputs_@
!serving_default_teacher_inputs_:0���������K
teacher_outputs8
StatefulPartitionedCall:0���������tensorflow/serving/predict:��
�
layer-0
layer-1
layer_with_weights-0
layer-2
layer-3
layer-4
layer_with_weights-1
layer-5
layer-6
layer-7
	layer_with_weights-2
	layer-8

layer_with_weights-3

layer-9
layer-10
layer-11
layer_with_weights-4
layer-12
layer-13
layer-14
layer_with_weights-5
layer-15
layer-16
layer_with_weights-6
layer-17
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures"
_tf_keras_network
"
_tf_keras_input_layer
�
	variables
trainable_variables
regularization_losses
	keras_api
 __call__
*!&call_and_return_all_conditional_losses"
_tf_keras_layer
�
"	variables
#trainable_variables
$regularization_losses
%	keras_api
&__call__
*'&call_and_return_all_conditional_losses

(kernel
)bias
 *_jit_compiled_convolution_op"
_tf_keras_layer
�
+	variables
,trainable_variables
-regularization_losses
.	keras_api
/__call__
*0&call_and_return_all_conditional_losses"
_tf_keras_layer
�
1	variables
2trainable_variables
3regularization_losses
4	keras_api
5__call__
*6&call_and_return_all_conditional_losses"
_tf_keras_layer
�
7	variables
8trainable_variables
9regularization_losses
:	keras_api
;__call__
*<&call_and_return_all_conditional_losses

=kernel
>bias
 ?_jit_compiled_convolution_op"
_tf_keras_layer
�
@	variables
Atrainable_variables
Bregularization_losses
C	keras_api
D__call__
*E&call_and_return_all_conditional_losses"
_tf_keras_layer
�
F	variables
Gtrainable_variables
Hregularization_losses
I	keras_api
J__call__
*K&call_and_return_all_conditional_losses"
_tf_keras_layer
�
L	variables
Mtrainable_variables
Nregularization_losses
O	keras_api
P__call__
*Q&call_and_return_all_conditional_losses

Rkernel
Sbias"
_tf_keras_layer
�
T	variables
Utrainable_variables
Vregularization_losses
W	keras_api
X__call__
*Y&call_and_return_all_conditional_losses

Zkernel
[bias"
_tf_keras_layer
�
\	variables
]trainable_variables
^regularization_losses
_	keras_api
`__call__
*a&call_and_return_all_conditional_losses"
_tf_keras_layer
�
b	variables
ctrainable_variables
dregularization_losses
e	keras_api
f__call__
*g&call_and_return_all_conditional_losses"
_tf_keras_layer
�
h	variables
itrainable_variables
jregularization_losses
k	keras_api
l__call__
*m&call_and_return_all_conditional_losses

nkernel
obias
 p_jit_compiled_convolution_op"
_tf_keras_layer
�
q	variables
rtrainable_variables
sregularization_losses
t	keras_api
u__call__
*v&call_and_return_all_conditional_losses"
_tf_keras_layer
�
w	variables
xtrainable_variables
yregularization_losses
z	keras_api
{__call__
*|&call_and_return_all_conditional_losses"
_tf_keras_layer
�
}	variables
~trainable_variables
regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses
�kernel
	�bias
!�_jit_compiled_convolution_op"
_tf_keras_layer
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses
�kernel
	�bias
!�_jit_compiled_convolution_op"
_tf_keras_layer
�
(0
)1
=2
>3
R4
S5
Z6
[7
n8
o9
�10
�11
�12
�13"
trackable_list_wrapper
�
(0
)1
=2
>3
R4
S5
Z6
[7
n8
o9
�10
�11
�12
�13"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
�
�trace_0
�trace_1
�trace_2
�trace_32�
)__inference_teacher_layer_call_fn_6646235
)__inference_teacher_layer_call_fn_6646673
)__inference_teacher_layer_call_fn_6646706
)__inference_teacher_layer_call_fn_6646501�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0z�trace_1z�trace_2z�trace_3
�
�trace_0
�trace_1
�trace_2
�trace_32�
D__inference_teacher_layer_call_and_return_conditional_losses_6646786
D__inference_teacher_layer_call_and_return_conditional_losses_6646866
D__inference_teacher_layer_call_and_return_conditional_losses_6646550
D__inference_teacher_layer_call_and_return_conditional_losses_6646599�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0z�trace_1z�trace_2z�trace_3
�B�
"__inference__wrapped_model_6645974teacher_inputs_"�
���
FullArgSpec
args� 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�
	�iter
�beta_1
�beta_2

�decay
�learning_rate(m�)m�=m�>m�Rm�Sm�Zm�[m�nm�om�	�m�	�m�	�m�	�m�(v�)v�=v�>v�Rv�Sv�Zv�[v�nv�ov�	�v�	�v�	�v�	�v�"
	optimizer
-
�serving_default"
signature_map
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
	variables
trainable_variables
regularization_losses
 __call__
*!&call_and_return_all_conditional_losses
&!"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
1__inference_teacher_reshape_layer_call_fn_6646871�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
L__inference_teacher_reshape_layer_call_and_return_conditional_losses_6646885�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
.
(0
)1"
trackable_list_wrapper
.
(0
)1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
"	variables
#trainable_variables
$regularization_losses
&__call__
*'&call_and_return_all_conditional_losses
&'"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
2__inference_teacher_conv2d_1_layer_call_fn_6646894�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
M__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_6646904�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
1:/2teacher_conv2d_1/kernel
#:!2teacher_conv2d_1/bias
�2��
���
FullArgSpec'
args�
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
+	variables
,trainable_variables
-regularization_losses
/__call__
*0&call_and_return_all_conditional_losses
&0"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
0__inference_teacher_relu_1_layer_call_fn_6646909�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
K__inference_teacher_relu_1_layer_call_and_return_conditional_losses_6646914�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
1	variables
2trainable_variables
3regularization_losses
5__call__
*6&call_and_return_all_conditional_losses
&6"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
0__inference_teacher_pool_1_layer_call_fn_6646919�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
K__inference_teacher_pool_1_layer_call_and_return_conditional_losses_6646924�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
.
=0
>1"
trackable_list_wrapper
.
=0
>1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
7	variables
8trainable_variables
9regularization_losses
;__call__
*<&call_and_return_all_conditional_losses
&<"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
2__inference_teacher_conv2d_2_layer_call_fn_6646933�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
M__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_6646943�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
1:/2teacher_conv2d_2/kernel
#:!2teacher_conv2d_2/bias
�2��
���
FullArgSpec'
args�
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
@	variables
Atrainable_variables
Bregularization_losses
D__call__
*E&call_and_return_all_conditional_losses
&E"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
0__inference_teacher_relu_2_layer_call_fn_6646948�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
K__inference_teacher_relu_2_layer_call_and_return_conditional_losses_6646953�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
F	variables
Gtrainable_variables
Hregularization_losses
J__call__
*K&call_and_return_all_conditional_losses
&K"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
1__inference_teacher_flatten_layer_call_fn_6646958�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
L__inference_teacher_flatten_layer_call_and_return_conditional_losses_6646964�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
.
R0
S1"
trackable_list_wrapper
.
R0
S1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
L	variables
Mtrainable_variables
Nregularization_losses
P__call__
*Q&call_and_return_all_conditional_losses
&Q"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
0__inference_teacher_latent_layer_call_fn_6646973�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
K__inference_teacher_latent_layer_call_and_return_conditional_losses_6646984�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
(:&	�P2teacher_latent/kernel
!:P2teacher_latent/bias
.
Z0
[1"
trackable_list_wrapper
.
Z0
[1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
T	variables
Utrainable_variables
Vregularization_losses
X__call__
*Y&call_and_return_all_conditional_losses
&Y"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
/__inference_teacher_dense_layer_call_fn_6646993�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
J__inference_teacher_dense_layer_call_and_return_conditional_losses_6647003�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
':%	P�2teacher_dense/kernel
!:�2teacher_dense/bias
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
\	variables
]trainable_variables
^regularization_losses
`__call__
*a&call_and_return_all_conditional_losses
&a"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
2__inference_teacher_reshape2_layer_call_fn_6647008�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
M__inference_teacher_reshape2_layer_call_and_return_conditional_losses_6647022�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
b	variables
ctrainable_variables
dregularization_losses
f__call__
*g&call_and_return_all_conditional_losses
&g"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
0__inference_teacher_relu_3_layer_call_fn_6647027�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
K__inference_teacher_relu_3_layer_call_and_return_conditional_losses_6647032�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
.
n0
o1"
trackable_list_wrapper
.
n0
o1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
h	variables
itrainable_variables
jregularization_losses
l__call__
*m&call_and_return_all_conditional_losses
&m"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
2__inference_teacher_conv2d_3_layer_call_fn_6647041�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
M__inference_teacher_conv2d_3_layer_call_and_return_conditional_losses_6647051�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
1:/2teacher_conv2d_3/kernel
#:!2teacher_conv2d_3/bias
�2��
���
FullArgSpec'
args�
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
q	variables
rtrainable_variables
sregularization_losses
u__call__
*v&call_and_return_all_conditional_losses
&v"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
0__inference_teacher_relu_4_layer_call_fn_6647056�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
K__inference_teacher_relu_4_layer_call_and_return_conditional_losses_6647061�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
w	variables
xtrainable_variables
yregularization_losses
{__call__
*|&call_and_return_all_conditional_losses
&|"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
4__inference_teacher_upsampling_layer_call_fn_6647066�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
O__inference_teacher_upsampling_layer_call_and_return_conditional_losses_6647078�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
0
�0
�1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
}	variables
~trainable_variables
regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
2__inference_teacher_conv2d_4_layer_call_fn_6647087�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
M__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_6647097�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
1:/2teacher_conv2d_4/kernel
#:!2teacher_conv2d_4/bias
�2��
���
FullArgSpec'
args�
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
0__inference_teacher_relu_5_layer_call_fn_6647102�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
K__inference_teacher_relu_5_layer_call_and_return_conditional_losses_6647107�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
0
�0
�1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
1__inference_teacher_outputs_layer_call_fn_6647116�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
L__inference_teacher_outputs_layer_call_and_return_conditional_losses_6647127�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
0:.2teacher_outputs/kernel
": 2teacher_outputs/bias
�2��
���
FullArgSpec'
args�
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 0
 "
trackable_list_wrapper
�
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14
15
16
17"
trackable_list_wrapper
(
�0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
)__inference_teacher_layer_call_fn_6646235teacher_inputs_"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
)__inference_teacher_layer_call_fn_6646673inputs"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
)__inference_teacher_layer_call_fn_6646706inputs"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
)__inference_teacher_layer_call_fn_6646501teacher_inputs_"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
D__inference_teacher_layer_call_and_return_conditional_losses_6646786inputs"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
D__inference_teacher_layer_call_and_return_conditional_losses_6646866inputs"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
D__inference_teacher_layer_call_and_return_conditional_losses_6646550teacher_inputs_"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
D__inference_teacher_layer_call_and_return_conditional_losses_6646599teacher_inputs_"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
�B�
%__inference_signature_wrapper_6646640teacher_inputs_"�
���
FullArgSpec
args� 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
1__inference_teacher_reshape_layer_call_fn_6646871inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
L__inference_teacher_reshape_layer_call_and_return_conditional_losses_6646885inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
2__inference_teacher_conv2d_1_layer_call_fn_6646894inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
M__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_6646904inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
0__inference_teacher_relu_1_layer_call_fn_6646909inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
K__inference_teacher_relu_1_layer_call_and_return_conditional_losses_6646914inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
0__inference_teacher_pool_1_layer_call_fn_6646919inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
K__inference_teacher_pool_1_layer_call_and_return_conditional_losses_6646924inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
2__inference_teacher_conv2d_2_layer_call_fn_6646933inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
M__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_6646943inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
0__inference_teacher_relu_2_layer_call_fn_6646948inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
K__inference_teacher_relu_2_layer_call_and_return_conditional_losses_6646953inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
1__inference_teacher_flatten_layer_call_fn_6646958inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
L__inference_teacher_flatten_layer_call_and_return_conditional_losses_6646964inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
0__inference_teacher_latent_layer_call_fn_6646973inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
K__inference_teacher_latent_layer_call_and_return_conditional_losses_6646984inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
/__inference_teacher_dense_layer_call_fn_6646993inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
J__inference_teacher_dense_layer_call_and_return_conditional_losses_6647003inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
2__inference_teacher_reshape2_layer_call_fn_6647008inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
M__inference_teacher_reshape2_layer_call_and_return_conditional_losses_6647022inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
0__inference_teacher_relu_3_layer_call_fn_6647027inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
K__inference_teacher_relu_3_layer_call_and_return_conditional_losses_6647032inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
2__inference_teacher_conv2d_3_layer_call_fn_6647041inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
M__inference_teacher_conv2d_3_layer_call_and_return_conditional_losses_6647051inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
0__inference_teacher_relu_4_layer_call_fn_6647056inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
K__inference_teacher_relu_4_layer_call_and_return_conditional_losses_6647061inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
4__inference_teacher_upsampling_layer_call_fn_6647066inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
O__inference_teacher_upsampling_layer_call_and_return_conditional_losses_6647078inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
2__inference_teacher_conv2d_4_layer_call_fn_6647087inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
M__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_6647097inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
0__inference_teacher_relu_5_layer_call_fn_6647102inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
K__inference_teacher_relu_5_layer_call_and_return_conditional_losses_6647107inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
1__inference_teacher_outputs_layer_call_fn_6647116inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
L__inference_teacher_outputs_layer_call_and_return_conditional_losses_6647127inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
R
�	variables
�	keras_api

�total

�count"
_tf_keras_metric
0
�0
�1"
trackable_list_wrapper
.
�	variables"
_generic_user_object
:  (2total
:  (2count
6:42Adam/teacher_conv2d_1/kernel/m
(:&2Adam/teacher_conv2d_1/bias/m
6:42Adam/teacher_conv2d_2/kernel/m
(:&2Adam/teacher_conv2d_2/bias/m
-:+	�P2Adam/teacher_latent/kernel/m
&:$P2Adam/teacher_latent/bias/m
,:*	P�2Adam/teacher_dense/kernel/m
&:$�2Adam/teacher_dense/bias/m
6:42Adam/teacher_conv2d_3/kernel/m
(:&2Adam/teacher_conv2d_3/bias/m
6:42Adam/teacher_conv2d_4/kernel/m
(:&2Adam/teacher_conv2d_4/bias/m
5:32Adam/teacher_outputs/kernel/m
':%2Adam/teacher_outputs/bias/m
6:42Adam/teacher_conv2d_1/kernel/v
(:&2Adam/teacher_conv2d_1/bias/v
6:42Adam/teacher_conv2d_2/kernel/v
(:&2Adam/teacher_conv2d_2/bias/v
-:+	�P2Adam/teacher_latent/kernel/v
&:$P2Adam/teacher_latent/bias/v
,:*	P�2Adam/teacher_dense/kernel/v
&:$�2Adam/teacher_dense/bias/v
6:42Adam/teacher_conv2d_3/kernel/v
(:&2Adam/teacher_conv2d_3/bias/v
6:42Adam/teacher_conv2d_4/kernel/v
(:&2Adam/teacher_conv2d_4/bias/v
5:32Adam/teacher_outputs/kernel/v
':%2Adam/teacher_outputs/bias/v�
"__inference__wrapped_model_6645974�()=>RSZ[no����@�=
6�3
1�.
teacher_inputs_���������
� "I�F
D
teacher_outputs1�.
teacher_outputs����������
%__inference_signature_wrapper_6646640�()=>RSZ[no����S�P
� 
I�F
D
teacher_inputs_1�.
teacher_inputs_���������"I�F
D
teacher_outputs1�.
teacher_outputs����������
M__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_6646904l()7�4
-�*
(�%
inputs���������
� "-�*
#� 
0���������
� �
2__inference_teacher_conv2d_1_layer_call_fn_6646894_()7�4
-�*
(�%
inputs���������
� " �����������
M__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_6646943l=>7�4
-�*
(�%
inputs���������	
� "-�*
#� 
0���������	
� �
2__inference_teacher_conv2d_2_layer_call_fn_6646933_=>7�4
-�*
(�%
inputs���������	
� " ����������	�
M__inference_teacher_conv2d_3_layer_call_and_return_conditional_losses_6647051lno7�4
-�*
(�%
inputs���������	
� "-�*
#� 
0���������	
� �
2__inference_teacher_conv2d_3_layer_call_fn_6647041_no7�4
-�*
(�%
inputs���������	
� " ����������	�
M__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_6647097���I�F
?�<
:�7
inputs+���������������������������
� "?�<
5�2
0+���������������������������
� �
2__inference_teacher_conv2d_4_layer_call_fn_6647087���I�F
?�<
:�7
inputs+���������������������������
� "2�/+����������������������������
J__inference_teacher_dense_layer_call_and_return_conditional_losses_6647003]Z[/�,
%�"
 �
inputs���������P
� "&�#
�
0����������
� �
/__inference_teacher_dense_layer_call_fn_6646993PZ[/�,
%�"
 �
inputs���������P
� "������������
L__inference_teacher_flatten_layer_call_and_return_conditional_losses_6646964a7�4
-�*
(�%
inputs���������	
� "&�#
�
0����������
� �
1__inference_teacher_flatten_layer_call_fn_6646958T7�4
-�*
(�%
inputs���������	
� "������������
K__inference_teacher_latent_layer_call_and_return_conditional_losses_6646984]RS0�-
&�#
!�
inputs����������
� "%�"
�
0���������P
� �
0__inference_teacher_latent_layer_call_fn_6646973PRS0�-
&�#
!�
inputs����������
� "����������P�
D__inference_teacher_layer_call_and_return_conditional_losses_6646550�()=>RSZ[no����H�E
>�;
1�.
teacher_inputs_���������
p 

 
� "?�<
5�2
0+���������������������������
� �
D__inference_teacher_layer_call_and_return_conditional_losses_6646599�()=>RSZ[no����H�E
>�;
1�.
teacher_inputs_���������
p

 
� "?�<
5�2
0+���������������������������
� �
D__inference_teacher_layer_call_and_return_conditional_losses_6646786�()=>RSZ[no����?�<
5�2
(�%
inputs���������
p 

 
� "-�*
#� 
0���������
� �
D__inference_teacher_layer_call_and_return_conditional_losses_6646866�()=>RSZ[no����?�<
5�2
(�%
inputs���������
p

 
� "-�*
#� 
0���������
� �
)__inference_teacher_layer_call_fn_6646235�()=>RSZ[no����H�E
>�;
1�.
teacher_inputs_���������
p 

 
� "2�/+����������������������������
)__inference_teacher_layer_call_fn_6646501�()=>RSZ[no����H�E
>�;
1�.
teacher_inputs_���������
p

 
� "2�/+����������������������������
)__inference_teacher_layer_call_fn_6646673�()=>RSZ[no����?�<
5�2
(�%
inputs���������
p 

 
� "2�/+����������������������������
)__inference_teacher_layer_call_fn_6646706�()=>RSZ[no����?�<
5�2
(�%
inputs���������
p

 
� "2�/+����������������������������
L__inference_teacher_outputs_layer_call_and_return_conditional_losses_6647127���I�F
?�<
:�7
inputs+���������������������������
� "?�<
5�2
0+���������������������������
� �
1__inference_teacher_outputs_layer_call_fn_6647116���I�F
?�<
:�7
inputs+���������������������������
� "2�/+����������������������������
K__inference_teacher_pool_1_layer_call_and_return_conditional_losses_6646924�R�O
H�E
C�@
inputs4������������������������������������
� "H�E
>�;
04������������������������������������
� �
0__inference_teacher_pool_1_layer_call_fn_6646919�R�O
H�E
C�@
inputs4������������������������������������
� ";�84�������������������������������������
K__inference_teacher_relu_1_layer_call_and_return_conditional_losses_6646914h7�4
-�*
(�%
inputs���������
� "-�*
#� 
0���������
� �
0__inference_teacher_relu_1_layer_call_fn_6646909[7�4
-�*
(�%
inputs���������
� " �����������
K__inference_teacher_relu_2_layer_call_and_return_conditional_losses_6646953h7�4
-�*
(�%
inputs���������	
� "-�*
#� 
0���������	
� �
0__inference_teacher_relu_2_layer_call_fn_6646948[7�4
-�*
(�%
inputs���������	
� " ����������	�
K__inference_teacher_relu_3_layer_call_and_return_conditional_losses_6647032h7�4
-�*
(�%
inputs���������	
� "-�*
#� 
0���������	
� �
0__inference_teacher_relu_3_layer_call_fn_6647027[7�4
-�*
(�%
inputs���������	
� " ����������	�
K__inference_teacher_relu_4_layer_call_and_return_conditional_losses_6647061h7�4
-�*
(�%
inputs���������	
� "-�*
#� 
0���������	
� �
0__inference_teacher_relu_4_layer_call_fn_6647056[7�4
-�*
(�%
inputs���������	
� " ����������	�
K__inference_teacher_relu_5_layer_call_and_return_conditional_losses_6647107�I�F
?�<
:�7
inputs+���������������������������
� "?�<
5�2
0+���������������������������
� �
0__inference_teacher_relu_5_layer_call_fn_6647102I�F
?�<
:�7
inputs+���������������������������
� "2�/+����������������������������
M__inference_teacher_reshape2_layer_call_and_return_conditional_losses_6647022a0�-
&�#
!�
inputs����������
� "-�*
#� 
0���������	
� �
2__inference_teacher_reshape2_layer_call_fn_6647008T0�-
&�#
!�
inputs����������
� " ����������	�
L__inference_teacher_reshape_layer_call_and_return_conditional_losses_6646885h7�4
-�*
(�%
inputs���������
� "-�*
#� 
0���������
� �
1__inference_teacher_reshape_layer_call_fn_6646871[7�4
-�*
(�%
inputs���������
� " �����������
O__inference_teacher_upsampling_layer_call_and_return_conditional_losses_6647078�R�O
H�E
C�@
inputs4������������������������������������
� "H�E
>�;
04������������������������������������
� �
4__inference_teacher_upsampling_layer_call_fn_6647066�R�O
H�E
C�@
inputs4������������������������������������
� ";�84������������������������������������