Ў
Љ
D
AddV2
x"T
y"T
z"T"
Ttype:
2	
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( 
М
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

BiasAdd

value"T	
bias"T
output"T""
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype

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
$
DisableCopyOnRead
resource
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
ћ
FusedBatchNormV3
x"T

scale"U
offset"U	
mean"U
variance"U
y"T

batch_mean"U
batch_variance"U
reserve_space_1"U
reserve_space_2"U
reserve_space_3"U"
Ttype:
2"
Utype:
2"
epsilonfloat%Зб8"&
exponential_avg_factorfloat%  ?";
data_formatstringNHWC:
NHWCNCHWNDHWCNCDHW"
is_trainingbool(
.
Identity

input"T
output"T"	
Ttype
u
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
2	

MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( 
?
Mul
x"T
y"T
z"T"
Ttype:
2	
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
dtypetype
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

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
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
?
Select
	condition

t"T
e"T
output"T"	
Ttype
d
Shape

input"T&
output"out_typeэout_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
С
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
executor_typestring Ј
@
StaticRegexFullMatch	
input

output
"
patternstring
ї
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

VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 "serve*2.12.02unknown8ЂА
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
b
count_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_1
[
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_output_shapes
: *
dtype0
b
total_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_1
[
total_1/Read/ReadVariableOpReadVariableOptotal_1*
_output_shapes
: *
dtype0
b
count_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_2
[
count_2/Read/ReadVariableOpReadVariableOpcount_2*
_output_shapes
: *
dtype0
b
total_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_2
[
total_2/Read/ReadVariableOpReadVariableOptotal_2*
_output_shapes
: *
dtype0

Adam/v/teacher_conv2d_5/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_nameAdam/v/teacher_conv2d_5/bias

0Adam/v/teacher_conv2d_5/bias/Read/ReadVariableOpReadVariableOpAdam/v/teacher_conv2d_5/bias*
_output_shapes
:*
dtype0

Adam/m/teacher_conv2d_5/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_nameAdam/m/teacher_conv2d_5/bias

0Adam/m/teacher_conv2d_5/bias/Read/ReadVariableOpReadVariableOpAdam/m/teacher_conv2d_5/bias*
_output_shapes
:*
dtype0
 
Adam/v/teacher_conv2d_5/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*/
shared_name Adam/v/teacher_conv2d_5/kernel

2Adam/v/teacher_conv2d_5/kernel/Read/ReadVariableOpReadVariableOpAdam/v/teacher_conv2d_5/kernel*&
_output_shapes
:*
dtype0
 
Adam/m/teacher_conv2d_5/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*/
shared_name Adam/m/teacher_conv2d_5/kernel

2Adam/m/teacher_conv2d_5/kernel/Read/ReadVariableOpReadVariableOpAdam/m/teacher_conv2d_5/kernel*&
_output_shapes
:*
dtype0

Adam/v/teacher_conv2d_4/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_nameAdam/v/teacher_conv2d_4/bias

0Adam/v/teacher_conv2d_4/bias/Read/ReadVariableOpReadVariableOpAdam/v/teacher_conv2d_4/bias*
_output_shapes
:*
dtype0

Adam/m/teacher_conv2d_4/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_nameAdam/m/teacher_conv2d_4/bias

0Adam/m/teacher_conv2d_4/bias/Read/ReadVariableOpReadVariableOpAdam/m/teacher_conv2d_4/bias*
_output_shapes
:*
dtype0
 
Adam/v/teacher_conv2d_4/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*/
shared_name Adam/v/teacher_conv2d_4/kernel

2Adam/v/teacher_conv2d_4/kernel/Read/ReadVariableOpReadVariableOpAdam/v/teacher_conv2d_4/kernel*&
_output_shapes
:*
dtype0
 
Adam/m/teacher_conv2d_4/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*/
shared_name Adam/m/teacher_conv2d_4/kernel

2Adam/m/teacher_conv2d_4/kernel/Read/ReadVariableOpReadVariableOpAdam/m/teacher_conv2d_4/kernel*&
_output_shapes
:*
dtype0

Adam/v/techer_conv2d_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*,
shared_nameAdam/v/techer_conv2d_3/bias

/Adam/v/techer_conv2d_3/bias/Read/ReadVariableOpReadVariableOpAdam/v/techer_conv2d_3/bias*
_output_shapes
:*
dtype0

Adam/m/techer_conv2d_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*,
shared_nameAdam/m/techer_conv2d_3/bias

/Adam/m/techer_conv2d_3/bias/Read/ReadVariableOpReadVariableOpAdam/m/techer_conv2d_3/bias*
_output_shapes
:*
dtype0

Adam/v/techer_conv2d_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_nameAdam/v/techer_conv2d_3/kernel

1Adam/v/techer_conv2d_3/kernel/Read/ReadVariableOpReadVariableOpAdam/v/techer_conv2d_3/kernel*&
_output_shapes
:*
dtype0

Adam/m/techer_conv2d_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_nameAdam/m/techer_conv2d_3/kernel

1Adam/m/techer_conv2d_3/kernel/Read/ReadVariableOpReadVariableOpAdam/m/techer_conv2d_3/kernel*&
_output_shapes
:*
dtype0

Adam/v/teacher_dense_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:т*,
shared_nameAdam/v/teacher_dense_2/bias

/Adam/v/teacher_dense_2/bias/Read/ReadVariableOpReadVariableOpAdam/v/teacher_dense_2/bias*
_output_shapes	
:т*
dtype0

Adam/m/teacher_dense_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:т*,
shared_nameAdam/m/teacher_dense_2/bias

/Adam/m/teacher_dense_2/bias/Read/ReadVariableOpReadVariableOpAdam/m/teacher_dense_2/bias*
_output_shapes	
:т*
dtype0

Adam/v/teacher_dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	Pт*.
shared_nameAdam/v/teacher_dense_2/kernel

1Adam/v/teacher_dense_2/kernel/Read/ReadVariableOpReadVariableOpAdam/v/teacher_dense_2/kernel*
_output_shapes
:	Pт*
dtype0

Adam/m/teacher_dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	Pт*.
shared_nameAdam/m/teacher_dense_2/kernel

1Adam/m/teacher_dense_2/kernel/Read/ReadVariableOpReadVariableOpAdam/m/teacher_dense_2/kernel*
_output_shapes
:	Pт*
dtype0

Adam/v/teacher_dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:P*,
shared_nameAdam/v/teacher_dense_1/bias

/Adam/v/teacher_dense_1/bias/Read/ReadVariableOpReadVariableOpAdam/v/teacher_dense_1/bias*
_output_shapes
:P*
dtype0

Adam/m/teacher_dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:P*,
shared_nameAdam/m/teacher_dense_1/bias

/Adam/m/teacher_dense_1/bias/Read/ReadVariableOpReadVariableOpAdam/m/teacher_dense_1/bias*
_output_shapes
:P*
dtype0

Adam/v/teacher_dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	тP*.
shared_nameAdam/v/teacher_dense_1/kernel

1Adam/v/teacher_dense_1/kernel/Read/ReadVariableOpReadVariableOpAdam/v/teacher_dense_1/kernel*
_output_shapes
:	тP*
dtype0

Adam/m/teacher_dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	тP*.
shared_nameAdam/m/teacher_dense_1/kernel

1Adam/m/teacher_dense_1/kernel/Read/ReadVariableOpReadVariableOpAdam/m/teacher_dense_1/kernel*
_output_shapes
:	тP*
dtype0

Adam/v/teacher_conv2d_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_nameAdam/v/teacher_conv2d_2/bias

0Adam/v/teacher_conv2d_2/bias/Read/ReadVariableOpReadVariableOpAdam/v/teacher_conv2d_2/bias*
_output_shapes
:*
dtype0

Adam/m/teacher_conv2d_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_nameAdam/m/teacher_conv2d_2/bias

0Adam/m/teacher_conv2d_2/bias/Read/ReadVariableOpReadVariableOpAdam/m/teacher_conv2d_2/bias*
_output_shapes
:*
dtype0
 
Adam/v/teacher_conv2d_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*/
shared_name Adam/v/teacher_conv2d_2/kernel

2Adam/v/teacher_conv2d_2/kernel/Read/ReadVariableOpReadVariableOpAdam/v/teacher_conv2d_2/kernel*&
_output_shapes
:*
dtype0
 
Adam/m/teacher_conv2d_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*/
shared_name Adam/m/teacher_conv2d_2/kernel

2Adam/m/teacher_conv2d_2/kernel/Read/ReadVariableOpReadVariableOpAdam/m/teacher_conv2d_2/kernel*&
_output_shapes
:*
dtype0

Adam/v/teacher_conv2d_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_nameAdam/v/teacher_conv2d_1/bias

0Adam/v/teacher_conv2d_1/bias/Read/ReadVariableOpReadVariableOpAdam/v/teacher_conv2d_1/bias*
_output_shapes
:*
dtype0

Adam/m/teacher_conv2d_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*-
shared_nameAdam/m/teacher_conv2d_1/bias

0Adam/m/teacher_conv2d_1/bias/Read/ReadVariableOpReadVariableOpAdam/m/teacher_conv2d_1/bias*
_output_shapes
:*
dtype0
 
Adam/v/teacher_conv2d_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*/
shared_name Adam/v/teacher_conv2d_1/kernel

2Adam/v/teacher_conv2d_1/kernel/Read/ReadVariableOpReadVariableOpAdam/v/teacher_conv2d_1/kernel*&
_output_shapes
:*
dtype0
 
Adam/m/teacher_conv2d_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*/
shared_name Adam/m/teacher_conv2d_1/kernel

2Adam/m/teacher_conv2d_1/kernel/Read/ReadVariableOpReadVariableOpAdam/m/teacher_conv2d_1/kernel*&
_output_shapes
:*
dtype0

Adam/v/teacher_layer_norm/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*/
shared_name Adam/v/teacher_layer_norm/beta

2Adam/v/teacher_layer_norm/beta/Read/ReadVariableOpReadVariableOpAdam/v/teacher_layer_norm/beta*"
_output_shapes
:*
dtype0

Adam/m/teacher_layer_norm/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*/
shared_name Adam/m/teacher_layer_norm/beta

2Adam/m/teacher_layer_norm/beta/Read/ReadVariableOpReadVariableOpAdam/m/teacher_layer_norm/beta*"
_output_shapes
:*
dtype0

Adam/v/teacher_layer_norm/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*0
shared_name!Adam/v/teacher_layer_norm/gamma

3Adam/v/teacher_layer_norm/gamma/Read/ReadVariableOpReadVariableOpAdam/v/teacher_layer_norm/gamma*"
_output_shapes
:*
dtype0

Adam/m/teacher_layer_norm/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*0
shared_name!Adam/m/teacher_layer_norm/gamma

3Adam/m/teacher_layer_norm/gamma/Read/ReadVariableOpReadVariableOpAdam/m/teacher_layer_norm/gamma*"
_output_shapes
:*
dtype0
n
learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namelearning_rate
g
!learning_rate/Read/ReadVariableOpReadVariableOplearning_rate*
_output_shapes
: *
dtype0
f
	iterationVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	iteration
_
iteration/Read/ReadVariableOpReadVariableOp	iteration*
_output_shapes
: *
dtype0	

teacher_conv2d_5/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*&
shared_nameteacher_conv2d_5/bias
{
)teacher_conv2d_5/bias/Read/ReadVariableOpReadVariableOpteacher_conv2d_5/bias*
_output_shapes
:*
dtype0

teacher_conv2d_5/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*(
shared_nameteacher_conv2d_5/kernel

+teacher_conv2d_5/kernel/Read/ReadVariableOpReadVariableOpteacher_conv2d_5/kernel*&
_output_shapes
:*
dtype0

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

teacher_conv2d_4/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*(
shared_nameteacher_conv2d_4/kernel

+teacher_conv2d_4/kernel/Read/ReadVariableOpReadVariableOpteacher_conv2d_4/kernel*&
_output_shapes
:*
dtype0

techer_conv2d_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*%
shared_nametecher_conv2d_3/bias
y
(techer_conv2d_3/bias/Read/ReadVariableOpReadVariableOptecher_conv2d_3/bias*
_output_shapes
:*
dtype0

techer_conv2d_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*'
shared_nametecher_conv2d_3/kernel

*techer_conv2d_3/kernel/Read/ReadVariableOpReadVariableOptecher_conv2d_3/kernel*&
_output_shapes
:*
dtype0

teacher_dense_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:т*%
shared_nameteacher_dense_2/bias
z
(teacher_dense_2/bias/Read/ReadVariableOpReadVariableOpteacher_dense_2/bias*
_output_shapes	
:т*
dtype0

teacher_dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	Pт*'
shared_nameteacher_dense_2/kernel

*teacher_dense_2/kernel/Read/ReadVariableOpReadVariableOpteacher_dense_2/kernel*
_output_shapes
:	Pт*
dtype0

teacher_dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:P*%
shared_nameteacher_dense_1/bias
y
(teacher_dense_1/bias/Read/ReadVariableOpReadVariableOpteacher_dense_1/bias*
_output_shapes
:P*
dtype0

teacher_dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	тP*'
shared_nameteacher_dense_1/kernel

*teacher_dense_1/kernel/Read/ReadVariableOpReadVariableOpteacher_dense_1/kernel*
_output_shapes
:	тP*
dtype0

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

teacher_conv2d_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*(
shared_nameteacher_conv2d_2/kernel

+teacher_conv2d_2/kernel/Read/ReadVariableOpReadVariableOpteacher_conv2d_2/kernel*&
_output_shapes
:*
dtype0

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

teacher_conv2d_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*(
shared_nameteacher_conv2d_1/kernel

+teacher_conv2d_1/kernel/Read/ReadVariableOpReadVariableOpteacher_conv2d_1/kernel*&
_output_shapes
:*
dtype0

teacher_layer_norm/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*(
shared_nameteacher_layer_norm/beta

+teacher_layer_norm/beta/Read/ReadVariableOpReadVariableOpteacher_layer_norm/beta*"
_output_shapes
:*
dtype0

teacher_layer_norm/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*)
shared_nameteacher_layer_norm/gamma

,teacher_layer_norm/gamma/Read/ReadVariableOpReadVariableOpteacher_layer_norm/gamma*"
_output_shapes
:*
dtype0

serving_default_teacher_inputPlaceholder*(
_output_shapes
:џџџџџџџџџќ*
dtype0*
shape:џџџџџџџџџќ
о
StatefulPartitionedCallStatefulPartitionedCallserving_default_teacher_inputteacher_layer_norm/gammateacher_layer_norm/betateacher_conv2d_1/kernelteacher_conv2d_1/biasteacher_conv2d_2/kernelteacher_conv2d_2/biasteacher_dense_1/kernelteacher_dense_1/biasteacher_dense_2/kernelteacher_dense_2/biastecher_conv2d_3/kerneltecher_conv2d_3/biasteacher_conv2d_4/kernelteacher_conv2d_4/biasteacher_conv2d_5/kernelteacher_conv2d_5/bias*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ*2
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8 *.
f)R'
%__inference_signature_wrapper_2240974

NoOpNoOp
њ}
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*Е}
valueЋ}BЈ} BЁ}
ж
layer-0
layer_with_weights-0
layer-1
layer_with_weights-1
layer-2
layer-3
layer_with_weights-2
layer-4
layer-5
layer_with_weights-3
layer-6
layer_with_weights-4
layer-7
	layer-8

layer-9
layer_with_weights-5
layer-10
layer-11
layer_with_weights-6
layer-12
layer_with_weights-7
layer-13
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures*

	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses* 
Џ
	variables
trainable_variables
 regularization_losses
!	keras_api
"__call__
*#&call_and_return_all_conditional_losses
$axis
	%gamma
&beta*
Ш
'	variables
(trainable_variables
)regularization_losses
*	keras_api
+__call__
*,&call_and_return_all_conditional_losses

-kernel
.bias
 /_jit_compiled_convolution_op*

0	variables
1trainable_variables
2regularization_losses
3	keras_api
4__call__
*5&call_and_return_all_conditional_losses* 
Ш
6	variables
7trainable_variables
8regularization_losses
9	keras_api
:__call__
*;&call_and_return_all_conditional_losses

<kernel
=bias
 >_jit_compiled_convolution_op*

?	variables
@trainable_variables
Aregularization_losses
B	keras_api
C__call__
*D&call_and_return_all_conditional_losses* 
І
E	variables
Ftrainable_variables
Gregularization_losses
H	keras_api
I__call__
*J&call_and_return_all_conditional_losses

Kkernel
Lbias*
І
M	variables
Ntrainable_variables
Oregularization_losses
P	keras_api
Q__call__
*R&call_and_return_all_conditional_losses

Skernel
Tbias*

U	variables
Vtrainable_variables
Wregularization_losses
X	keras_api
Y__call__
*Z&call_and_return_all_conditional_losses* 

[	variables
\trainable_variables
]regularization_losses
^	keras_api
___call__
*`&call_and_return_all_conditional_losses* 
Ш
a	variables
btrainable_variables
cregularization_losses
d	keras_api
e__call__
*f&call_and_return_all_conditional_losses

gkernel
hbias
 i_jit_compiled_convolution_op*

j	variables
ktrainable_variables
lregularization_losses
m	keras_api
n__call__
*o&call_and_return_all_conditional_losses* 
Ш
p	variables
qtrainable_variables
rregularization_losses
s	keras_api
t__call__
*u&call_and_return_all_conditional_losses

vkernel
wbias
 x_jit_compiled_convolution_op*
Ъ
y	variables
ztrainable_variables
{regularization_losses
|	keras_api
}__call__
*~&call_and_return_all_conditional_losses

kernel
	bias
!_jit_compiled_convolution_op*
{
%0
&1
-2
.3
<4
=5
K6
L7
S8
T9
g10
h11
v12
w13
14
15*
{
%0
&1
-2
.3
<4
=5
K6
L7
S8
T9
g10
h11
v12
w13
14
15*
* 
Е
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
:
trace_0
trace_1
trace_2
trace_3* 
:
trace_0
trace_1
trace_2
trace_3* 
* 


_variables
_iterations
_learning_rate
_index_dict

_momentums
_velocities
_update_step_xla*

serving_default* 
* 
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses* 

trace_0* 

trace_0* 

%0
&1*

%0
&1*
* 

non_trainable_variables
layers
 metrics
 Ёlayer_regularization_losses
Ђlayer_metrics
	variables
trainable_variables
 regularization_losses
"__call__
*#&call_and_return_all_conditional_losses
&#"call_and_return_conditional_losses*

Ѓtrace_0* 

Єtrace_0* 
* 
ga
VARIABLE_VALUEteacher_layer_norm/gamma5layer_with_weights-0/gamma/.ATTRIBUTES/VARIABLE_VALUE*
e_
VARIABLE_VALUEteacher_layer_norm/beta4layer_with_weights-0/beta/.ATTRIBUTES/VARIABLE_VALUE*

-0
.1*

-0
.1*
* 

Ѕnon_trainable_variables
Іlayers
Їmetrics
 Јlayer_regularization_losses
Љlayer_metrics
'	variables
(trainable_variables
)regularization_losses
+__call__
*,&call_and_return_all_conditional_losses
&,"call_and_return_conditional_losses*

Њtrace_0* 

Ћtrace_0* 
ga
VARIABLE_VALUEteacher_conv2d_1/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE*
c]
VARIABLE_VALUEteacher_conv2d_1/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 

Ќnon_trainable_variables
­layers
Ўmetrics
 Џlayer_regularization_losses
Аlayer_metrics
0	variables
1trainable_variables
2regularization_losses
4__call__
*5&call_and_return_all_conditional_losses
&5"call_and_return_conditional_losses* 

Бtrace_0* 

Вtrace_0* 

<0
=1*

<0
=1*
* 

Гnon_trainable_variables
Дlayers
Еmetrics
 Жlayer_regularization_losses
Зlayer_metrics
6	variables
7trainable_variables
8regularization_losses
:__call__
*;&call_and_return_all_conditional_losses
&;"call_and_return_conditional_losses*

Иtrace_0* 

Йtrace_0* 
ga
VARIABLE_VALUEteacher_conv2d_2/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE*
c]
VARIABLE_VALUEteacher_conv2d_2/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 

Кnon_trainable_variables
Лlayers
Мmetrics
 Нlayer_regularization_losses
Оlayer_metrics
?	variables
@trainable_variables
Aregularization_losses
C__call__
*D&call_and_return_all_conditional_losses
&D"call_and_return_conditional_losses* 

Пtrace_0* 

Рtrace_0* 

K0
L1*

K0
L1*
* 

Сnon_trainable_variables
Тlayers
Уmetrics
 Фlayer_regularization_losses
Хlayer_metrics
E	variables
Ftrainable_variables
Gregularization_losses
I__call__
*J&call_and_return_all_conditional_losses
&J"call_and_return_conditional_losses*

Цtrace_0* 

Чtrace_0* 
f`
VARIABLE_VALUEteacher_dense_1/kernel6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUE*
b\
VARIABLE_VALUEteacher_dense_1/bias4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUE*

S0
T1*

S0
T1*
* 

Шnon_trainable_variables
Щlayers
Ъmetrics
 Ыlayer_regularization_losses
Ьlayer_metrics
M	variables
Ntrainable_variables
Oregularization_losses
Q__call__
*R&call_and_return_all_conditional_losses
&R"call_and_return_conditional_losses*

Эtrace_0* 

Юtrace_0* 
f`
VARIABLE_VALUEteacher_dense_2/kernel6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUE*
b\
VARIABLE_VALUEteacher_dense_2/bias4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 

Яnon_trainable_variables
аlayers
бmetrics
 вlayer_regularization_losses
гlayer_metrics
U	variables
Vtrainable_variables
Wregularization_losses
Y__call__
*Z&call_and_return_all_conditional_losses
&Z"call_and_return_conditional_losses* 

дtrace_0* 

еtrace_0* 
* 
* 
* 

жnon_trainable_variables
зlayers
иmetrics
 йlayer_regularization_losses
кlayer_metrics
[	variables
\trainable_variables
]regularization_losses
___call__
*`&call_and_return_all_conditional_losses
&`"call_and_return_conditional_losses* 

лtrace_0* 

мtrace_0* 

g0
h1*

g0
h1*
* 

нnon_trainable_variables
оlayers
пmetrics
 рlayer_regularization_losses
сlayer_metrics
a	variables
btrainable_variables
cregularization_losses
e__call__
*f&call_and_return_all_conditional_losses
&f"call_and_return_conditional_losses*

тtrace_0* 

уtrace_0* 
f`
VARIABLE_VALUEtecher_conv2d_3/kernel6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUE*
b\
VARIABLE_VALUEtecher_conv2d_3/bias4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 

фnon_trainable_variables
хlayers
цmetrics
 чlayer_regularization_losses
шlayer_metrics
j	variables
ktrainable_variables
lregularization_losses
n__call__
*o&call_and_return_all_conditional_losses
&o"call_and_return_conditional_losses* 

щtrace_0* 

ъtrace_0* 

v0
w1*

v0
w1*
* 

ыnon_trainable_variables
ьlayers
эmetrics
 юlayer_regularization_losses
яlayer_metrics
p	variables
qtrainable_variables
rregularization_losses
t__call__
*u&call_and_return_all_conditional_losses
&u"call_and_return_conditional_losses*

№trace_0* 

ёtrace_0* 
ga
VARIABLE_VALUEteacher_conv2d_4/kernel6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUE*
c]
VARIABLE_VALUEteacher_conv2d_4/bias4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 

0
1*

0
1*
* 

ђnon_trainable_variables
ѓlayers
єmetrics
 ѕlayer_regularization_losses
іlayer_metrics
y	variables
ztrainable_variables
{regularization_losses
}__call__
*~&call_and_return_all_conditional_losses
&~"call_and_return_conditional_losses*

їtrace_0* 

јtrace_0* 
ga
VARIABLE_VALUEteacher_conv2d_5/kernel6layer_with_weights-7/kernel/.ATTRIBUTES/VARIABLE_VALUE*
c]
VARIABLE_VALUEteacher_conv2d_5/bias4layer_with_weights-7/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
j
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
13*

љ0
њ1
ћ2*
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
Ѓ
0
ќ1
§2
ў3
џ4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32*
SM
VARIABLE_VALUE	iteration0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUElearning_rate3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
* 

ќ0
ў1
2
3
4
5
6
7
8
9
10
11
12
13
14
15*

§0
џ1
2
3
4
5
6
7
8
9
10
11
12
13
14
15*
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
	variables
	keras_api

total

count*
M
 	variables
Ё	keras_api

Ђtotal

Ѓcount
Є
_fn_kwargs*
M
Ѕ	variables
І	keras_api

Їtotal

Јcount
Љ
_fn_kwargs*
jd
VARIABLE_VALUEAdam/m/teacher_layer_norm/gamma1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUE*
jd
VARIABLE_VALUEAdam/v/teacher_layer_norm/gamma1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUEAdam/m/teacher_layer_norm/beta1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUEAdam/v/teacher_layer_norm/beta1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUEAdam/m/teacher_conv2d_1/kernel1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUEAdam/v/teacher_conv2d_1/kernel1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUEAdam/m/teacher_conv2d_1/bias1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUEAdam/v/teacher_conv2d_1/bias1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUEAdam/m/teacher_conv2d_2/kernel1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUE*
jd
VARIABLE_VALUEAdam/v/teacher_conv2d_2/kernel2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUE*
hb
VARIABLE_VALUEAdam/m/teacher_conv2d_2/bias2optimizer/_variables/11/.ATTRIBUTES/VARIABLE_VALUE*
hb
VARIABLE_VALUEAdam/v/teacher_conv2d_2/bias2optimizer/_variables/12/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUEAdam/m/teacher_dense_1/kernel2optimizer/_variables/13/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUEAdam/v/teacher_dense_1/kernel2optimizer/_variables/14/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUEAdam/m/teacher_dense_1/bias2optimizer/_variables/15/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUEAdam/v/teacher_dense_1/bias2optimizer/_variables/16/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUEAdam/m/teacher_dense_2/kernel2optimizer/_variables/17/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUEAdam/v/teacher_dense_2/kernel2optimizer/_variables/18/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUEAdam/m/teacher_dense_2/bias2optimizer/_variables/19/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUEAdam/v/teacher_dense_2/bias2optimizer/_variables/20/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUEAdam/m/techer_conv2d_3/kernel2optimizer/_variables/21/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUEAdam/v/techer_conv2d_3/kernel2optimizer/_variables/22/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUEAdam/m/techer_conv2d_3/bias2optimizer/_variables/23/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUEAdam/v/techer_conv2d_3/bias2optimizer/_variables/24/.ATTRIBUTES/VARIABLE_VALUE*
jd
VARIABLE_VALUEAdam/m/teacher_conv2d_4/kernel2optimizer/_variables/25/.ATTRIBUTES/VARIABLE_VALUE*
jd
VARIABLE_VALUEAdam/v/teacher_conv2d_4/kernel2optimizer/_variables/26/.ATTRIBUTES/VARIABLE_VALUE*
hb
VARIABLE_VALUEAdam/m/teacher_conv2d_4/bias2optimizer/_variables/27/.ATTRIBUTES/VARIABLE_VALUE*
hb
VARIABLE_VALUEAdam/v/teacher_conv2d_4/bias2optimizer/_variables/28/.ATTRIBUTES/VARIABLE_VALUE*
jd
VARIABLE_VALUEAdam/m/teacher_conv2d_5/kernel2optimizer/_variables/29/.ATTRIBUTES/VARIABLE_VALUE*
jd
VARIABLE_VALUEAdam/v/teacher_conv2d_5/kernel2optimizer/_variables/30/.ATTRIBUTES/VARIABLE_VALUE*
hb
VARIABLE_VALUEAdam/m/teacher_conv2d_5/bias2optimizer/_variables/31/.ATTRIBUTES/VARIABLE_VALUE*
hb
VARIABLE_VALUEAdam/v/teacher_conv2d_5/bias2optimizer/_variables/32/.ATTRIBUTES/VARIABLE_VALUE*

0
1*

	variables*
UO
VARIABLE_VALUEtotal_24keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
UO
VARIABLE_VALUEcount_24keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*

Ђ0
Ѓ1*

 	variables*
UO
VARIABLE_VALUEtotal_14keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE*
UO
VARIABLE_VALUEcount_14keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE*
* 

Ї0
Ј1*

Ѕ	variables*
SM
VARIABLE_VALUEtotal4keras_api/metrics/2/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/2/count/.ATTRIBUTES/VARIABLE_VALUE*
* 
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
ї
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filenameteacher_layer_norm/gammateacher_layer_norm/betateacher_conv2d_1/kernelteacher_conv2d_1/biasteacher_conv2d_2/kernelteacher_conv2d_2/biasteacher_dense_1/kernelteacher_dense_1/biasteacher_dense_2/kernelteacher_dense_2/biastecher_conv2d_3/kerneltecher_conv2d_3/biasteacher_conv2d_4/kernelteacher_conv2d_4/biasteacher_conv2d_5/kernelteacher_conv2d_5/bias	iterationlearning_rateAdam/m/teacher_layer_norm/gammaAdam/v/teacher_layer_norm/gammaAdam/m/teacher_layer_norm/betaAdam/v/teacher_layer_norm/betaAdam/m/teacher_conv2d_1/kernelAdam/v/teacher_conv2d_1/kernelAdam/m/teacher_conv2d_1/biasAdam/v/teacher_conv2d_1/biasAdam/m/teacher_conv2d_2/kernelAdam/v/teacher_conv2d_2/kernelAdam/m/teacher_conv2d_2/biasAdam/v/teacher_conv2d_2/biasAdam/m/teacher_dense_1/kernelAdam/v/teacher_dense_1/kernelAdam/m/teacher_dense_1/biasAdam/v/teacher_dense_1/biasAdam/m/teacher_dense_2/kernelAdam/v/teacher_dense_2/kernelAdam/m/teacher_dense_2/biasAdam/v/teacher_dense_2/biasAdam/m/techer_conv2d_3/kernelAdam/v/techer_conv2d_3/kernelAdam/m/techer_conv2d_3/biasAdam/v/techer_conv2d_3/biasAdam/m/teacher_conv2d_4/kernelAdam/v/teacher_conv2d_4/kernelAdam/m/teacher_conv2d_4/biasAdam/v/teacher_conv2d_4/biasAdam/m/teacher_conv2d_5/kernelAdam/v/teacher_conv2d_5/kernelAdam/m/teacher_conv2d_5/biasAdam/v/teacher_conv2d_5/biastotal_2count_2total_1count_1totalcountConst*E
Tin>
<2:*
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
GPU 2J 8 *)
f$R"
 __inference__traced_save_2241958
ђ
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameteacher_layer_norm/gammateacher_layer_norm/betateacher_conv2d_1/kernelteacher_conv2d_1/biasteacher_conv2d_2/kernelteacher_conv2d_2/biasteacher_dense_1/kernelteacher_dense_1/biasteacher_dense_2/kernelteacher_dense_2/biastecher_conv2d_3/kerneltecher_conv2d_3/biasteacher_conv2d_4/kernelteacher_conv2d_4/biasteacher_conv2d_5/kernelteacher_conv2d_5/bias	iterationlearning_rateAdam/m/teacher_layer_norm/gammaAdam/v/teacher_layer_norm/gammaAdam/m/teacher_layer_norm/betaAdam/v/teacher_layer_norm/betaAdam/m/teacher_conv2d_1/kernelAdam/v/teacher_conv2d_1/kernelAdam/m/teacher_conv2d_1/biasAdam/v/teacher_conv2d_1/biasAdam/m/teacher_conv2d_2/kernelAdam/v/teacher_conv2d_2/kernelAdam/m/teacher_conv2d_2/biasAdam/v/teacher_conv2d_2/biasAdam/m/teacher_dense_1/kernelAdam/v/teacher_dense_1/kernelAdam/m/teacher_dense_1/biasAdam/v/teacher_dense_1/biasAdam/m/teacher_dense_2/kernelAdam/v/teacher_dense_2/kernelAdam/m/teacher_dense_2/biasAdam/v/teacher_dense_2/biasAdam/m/techer_conv2d_3/kernelAdam/v/techer_conv2d_3/kernelAdam/m/techer_conv2d_3/biasAdam/v/techer_conv2d_3/biasAdam/m/teacher_conv2d_4/kernelAdam/v/teacher_conv2d_4/kernelAdam/m/teacher_conv2d_4/biasAdam/v/teacher_conv2d_4/biasAdam/m/teacher_conv2d_5/kernelAdam/v/teacher_conv2d_5/kernelAdam/m/teacher_conv2d_5/biasAdam/v/teacher_conv2d_5/biastotal_2count_2total_1count_1totalcount*D
Tin=
;29*
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
GPU 2J 8 *,
f'R%
#__inference__traced_restore_2242136


M__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_2241414

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identityЂBiasAdd/ReadVariableOpЂConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ*
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
:џџџџџџџџџX
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:џџџџџџџџџi
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџw
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
гЂ
г
G__inference_sequential_layer_call_and_return_conditional_losses_2241310

inputsJ
4teacher_layer_norm_reshape_2_readvariableop_resource:J
4teacher_layer_norm_reshape_3_readvariableop_resource:I
/teacher_conv2d_1_conv2d_readvariableop_resource:>
0teacher_conv2d_1_biasadd_readvariableop_resource:I
/teacher_conv2d_2_conv2d_readvariableop_resource:>
0teacher_conv2d_2_biasadd_readvariableop_resource:A
.teacher_dense_1_matmul_readvariableop_resource:	тP=
/teacher_dense_1_biasadd_readvariableop_resource:PA
.teacher_dense_2_matmul_readvariableop_resource:	Pт>
/teacher_dense_2_biasadd_readvariableop_resource:	тH
.techer_conv2d_3_conv2d_readvariableop_resource:=
/techer_conv2d_3_biasadd_readvariableop_resource:I
/teacher_conv2d_4_conv2d_readvariableop_resource:>
0teacher_conv2d_4_biasadd_readvariableop_resource:I
/teacher_conv2d_5_conv2d_readvariableop_resource:>
0teacher_conv2d_5_biasadd_readvariableop_resource:
identityЂ'teacher_conv2d_1/BiasAdd/ReadVariableOpЂ&teacher_conv2d_1/Conv2D/ReadVariableOpЂ'teacher_conv2d_2/BiasAdd/ReadVariableOpЂ&teacher_conv2d_2/Conv2D/ReadVariableOpЂ'teacher_conv2d_4/BiasAdd/ReadVariableOpЂ&teacher_conv2d_4/Conv2D/ReadVariableOpЂ'teacher_conv2d_5/BiasAdd/ReadVariableOpЂ&teacher_conv2d_5/Conv2D/ReadVariableOpЂ&teacher_dense_1/BiasAdd/ReadVariableOpЂ%teacher_dense_1/MatMul/ReadVariableOpЂ&teacher_dense_2/BiasAdd/ReadVariableOpЂ%teacher_dense_2/MatMul/ReadVariableOpЂ+teacher_layer_norm/Reshape_2/ReadVariableOpЂ+teacher_layer_norm/Reshape_3/ReadVariableOpЂ&techer_conv2d_3/BiasAdd/ReadVariableOpЂ%techer_conv2d_3/Conv2D/ReadVariableOpY
teacher_reshape/ShapeShapeinputs*
T0*
_output_shapes
::эЯm
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
valueB:Ё
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
value	B :љ
teacher_reshape/Reshape/shapePack&teacher_reshape/strided_slice:output:0(teacher_reshape/Reshape/shape/1:output:0(teacher_reshape/Reshape/shape/2:output:0(teacher_reshape/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:
teacher_reshape/ReshapeReshapeinputs&teacher_reshape/Reshape/shape:output:0*
T0*/
_output_shapes
:џџџџџџџџџv
teacher_layer_norm/ShapeShape teacher_reshape/Reshape:output:0*
T0*
_output_shapes
::эЯp
&teacher_layer_norm/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(teacher_layer_norm/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(teacher_layer_norm/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:А
 teacher_layer_norm/strided_sliceStridedSlice!teacher_layer_norm/Shape:output:0/teacher_layer_norm/strided_slice/stack:output:01teacher_layer_norm/strided_slice/stack_1:output:01teacher_layer_norm/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskZ
teacher_layer_norm/mul/xConst*
_output_shapes
: *
dtype0*
value	B :
teacher_layer_norm/mulMul!teacher_layer_norm/mul/x:output:0)teacher_layer_norm/strided_slice:output:0*
T0*
_output_shapes
: r
(teacher_layer_norm/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:t
*teacher_layer_norm/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*teacher_layer_norm/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:И
"teacher_layer_norm/strided_slice_1StridedSlice!teacher_layer_norm/Shape:output:01teacher_layer_norm/strided_slice_1/stack:output:03teacher_layer_norm/strided_slice_1/stack_1:output:03teacher_layer_norm/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask\
teacher_layer_norm/mul_1/xConst*
_output_shapes
: *
dtype0*
value	B :
teacher_layer_norm/mul_1Mul#teacher_layer_norm/mul_1/x:output:0+teacher_layer_norm/strided_slice_1:output:0*
T0*
_output_shapes
: r
(teacher_layer_norm/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:t
*teacher_layer_norm/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*teacher_layer_norm/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:И
"teacher_layer_norm/strided_slice_2StridedSlice!teacher_layer_norm/Shape:output:01teacher_layer_norm/strided_slice_2/stack:output:03teacher_layer_norm/strided_slice_2/stack_1:output:03teacher_layer_norm/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
teacher_layer_norm/mul_2Multeacher_layer_norm/mul_1:z:0+teacher_layer_norm/strided_slice_2:output:0*
T0*
_output_shapes
: r
(teacher_layer_norm/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:t
*teacher_layer_norm/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*teacher_layer_norm/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:И
"teacher_layer_norm/strided_slice_3StridedSlice!teacher_layer_norm/Shape:output:01teacher_layer_norm/strided_slice_3/stack:output:03teacher_layer_norm/strided_slice_3/stack_1:output:03teacher_layer_norm/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
teacher_layer_norm/mul_3Multeacher_layer_norm/mul_2:z:0+teacher_layer_norm/strided_slice_3:output:0*
T0*
_output_shapes
: d
"teacher_layer_norm/Reshape/shape/0Const*
_output_shapes
: *
dtype0*
value	B :d
"teacher_layer_norm/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :ъ
 teacher_layer_norm/Reshape/shapePack+teacher_layer_norm/Reshape/shape/0:output:0teacher_layer_norm/mul:z:0teacher_layer_norm/mul_3:z:0+teacher_layer_norm/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:­
teacher_layer_norm/ReshapeReshape teacher_reshape/Reshape:output:0)teacher_layer_norm/Reshape/shape:output:0*
T0*0
_output_shapes
:џџџџџџџџџќp
teacher_layer_norm/ones/packedPackteacher_layer_norm/mul:z:0*
N*
T0*
_output_shapes
:b
teacher_layer_norm/ones/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
teacher_layer_norm/onesFill'teacher_layer_norm/ones/packed:output:0&teacher_layer_norm/ones/Const:output:0*
T0*#
_output_shapes
:џџџџџџџџџq
teacher_layer_norm/zeros/packedPackteacher_layer_norm/mul:z:0*
N*
T0*
_output_shapes
:c
teacher_layer_norm/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    Ё
teacher_layer_norm/zerosFill(teacher_layer_norm/zeros/packed:output:0'teacher_layer_norm/zeros/Const:output:0*
T0*#
_output_shapes
:џџџџџџџџџ[
teacher_layer_norm/ConstConst*
_output_shapes
: *
dtype0*
valueB ]
teacher_layer_norm/Const_1Const*
_output_shapes
: *
dtype0*
valueB 
#teacher_layer_norm/FusedBatchNormV3FusedBatchNormV3#teacher_layer_norm/Reshape:output:0 teacher_layer_norm/ones:output:0!teacher_layer_norm/zeros:output:0!teacher_layer_norm/Const:output:0#teacher_layer_norm/Const_1:output:0*
T0*
U0*p
_output_shapes^
\:џџџџџџџџџќ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:*
data_formatNCHW*
epsilon%o:­
teacher_layer_norm/Reshape_1Reshape'teacher_layer_norm/FusedBatchNormV3:y:0!teacher_layer_norm/Shape:output:0*
T0*/
_output_shapes
:џџџџџџџџџЄ
+teacher_layer_norm/Reshape_2/ReadVariableOpReadVariableOp4teacher_layer_norm_reshape_2_readvariableop_resource*"
_output_shapes
:*
dtype0{
"teacher_layer_norm/Reshape_2/shapeConst*
_output_shapes
:*
dtype0*%
valueB"            К
teacher_layer_norm/Reshape_2Reshape3teacher_layer_norm/Reshape_2/ReadVariableOp:value:0+teacher_layer_norm/Reshape_2/shape:output:0*
T0*&
_output_shapes
:Є
+teacher_layer_norm/Reshape_3/ReadVariableOpReadVariableOp4teacher_layer_norm_reshape_3_readvariableop_resource*"
_output_shapes
:*
dtype0{
"teacher_layer_norm/Reshape_3/shapeConst*
_output_shapes
:*
dtype0*%
valueB"            К
teacher_layer_norm/Reshape_3Reshape3teacher_layer_norm/Reshape_3/ReadVariableOp:value:0+teacher_layer_norm/Reshape_3/shape:output:0*
T0*&
_output_shapes
:Ї
teacher_layer_norm/mul_4Mul%teacher_layer_norm/Reshape_1:output:0%teacher_layer_norm/Reshape_2:output:0*
T0*/
_output_shapes
:џџџџџџџџџ
teacher_layer_norm/addAddV2teacher_layer_norm/mul_4:z:0%teacher_layer_norm/Reshape_3:output:0*
T0*/
_output_shapes
:џџџџџџџџџ
&teacher_conv2d_1/Conv2D/ReadVariableOpReadVariableOp/teacher_conv2d_1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Я
teacher_conv2d_1/Conv2DConv2Dteacher_layer_norm/add:z:0.teacher_conv2d_1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ*
paddingSAME*
strides

'teacher_conv2d_1/BiasAdd/ReadVariableOpReadVariableOp0teacher_conv2d_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0А
teacher_conv2d_1/BiasAddBiasAdd teacher_conv2d_1/Conv2D:output:0/teacher_conv2d_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџz
teacher_conv2d_1/ReluRelu!teacher_conv2d_1/BiasAdd:output:0*
T0*/
_output_shapes
:џџџџџџџџџУ
teacher_averagepool_1/AvgPoolAvgPool#teacher_conv2d_1/Relu:activations:0*
T0*/
_output_shapes
:џџџџџџџџџ	*
ksize
*
paddingVALID*
strides

&teacher_conv2d_2/Conv2D/ReadVariableOpReadVariableOp/teacher_conv2d_2_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0л
teacher_conv2d_2/Conv2DConv2D&teacher_averagepool_1/AvgPool:output:0.teacher_conv2d_2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ	*
paddingSAME*
strides

'teacher_conv2d_2/BiasAdd/ReadVariableOpReadVariableOp0teacher_conv2d_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0А
teacher_conv2d_2/BiasAddBiasAdd teacher_conv2d_2/Conv2D:output:0/teacher_conv2d_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ	z
teacher_conv2d_2/ReluRelu!teacher_conv2d_2/BiasAdd:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	h
teacher_flatten_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџb  
teacher_flatten_1/ReshapeReshape#teacher_conv2d_2/Relu:activations:0 teacher_flatten_1/Const:output:0*
T0*(
_output_shapes
:џџџџџџџџџт
%teacher_dense_1/MatMul/ReadVariableOpReadVariableOp.teacher_dense_1_matmul_readvariableop_resource*
_output_shapes
:	тP*
dtype0Ѕ
teacher_dense_1/MatMulMatMul"teacher_flatten_1/Reshape:output:0-teacher_dense_1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџP
&teacher_dense_1/BiasAdd/ReadVariableOpReadVariableOp/teacher_dense_1_biasadd_readvariableop_resource*
_output_shapes
:P*
dtype0І
teacher_dense_1/BiasAddBiasAdd teacher_dense_1/MatMul:product:0.teacher_dense_1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџPp
teacher_dense_1/ReluRelu teacher_dense_1/BiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџP
%teacher_dense_2/MatMul/ReadVariableOpReadVariableOp.teacher_dense_2_matmul_readvariableop_resource*
_output_shapes
:	Pт*
dtype0І
teacher_dense_2/MatMulMatMul"teacher_dense_1/Relu:activations:0-teacher_dense_2/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџт
&teacher_dense_2/BiasAdd/ReadVariableOpReadVariableOp/teacher_dense_2_biasadd_readvariableop_resource*
_output_shapes	
:т*
dtype0Ї
teacher_dense_2/BiasAddBiasAdd teacher_dense_2/MatMul:product:0.teacher_dense_2/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџтu
teacher_reshape_2/ShapeShape teacher_dense_2/BiasAdd:output:0*
T0*
_output_shapes
::эЯo
%teacher_reshape_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: q
'teacher_reshape_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:q
'teacher_reshape_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ћ
teacher_reshape_2/strided_sliceStridedSlice teacher_reshape_2/Shape:output:0.teacher_reshape_2/strided_slice/stack:output:00teacher_reshape_2/strided_slice/stack_1:output:00teacher_reshape_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskc
!teacher_reshape_2/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :	c
!teacher_reshape_2/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :c
!teacher_reshape_2/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :
teacher_reshape_2/Reshape/shapePack(teacher_reshape_2/strided_slice:output:0*teacher_reshape_2/Reshape/shape/1:output:0*teacher_reshape_2/Reshape/shape/2:output:0*teacher_reshape_2/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:Њ
teacher_reshape_2/ReshapeReshape teacher_dense_2/BiasAdd:output:0(teacher_reshape_2/Reshape/shape:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	
teacher_activation_1/ReluRelu"teacher_reshape_2/Reshape:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	
%techer_conv2d_3/Conv2D/ReadVariableOpReadVariableOp.techer_conv2d_3_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0к
techer_conv2d_3/Conv2DConv2D'teacher_activation_1/Relu:activations:0-techer_conv2d_3/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ	*
paddingSAME*
strides

&techer_conv2d_3/BiasAdd/ReadVariableOpReadVariableOp/techer_conv2d_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0­
techer_conv2d_3/BiasAddBiasAddtecher_conv2d_3/Conv2D:output:0.techer_conv2d_3/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ	x
techer_conv2d_3/ReluRelu techer_conv2d_3/BiasAdd:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	i
teacher_upsample_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"	      k
teacher_upsample_1/Const_1Const*
_output_shapes
:*
dtype0*
valueB"      
teacher_upsample_1/mulMul!teacher_upsample_1/Const:output:0#teacher_upsample_1/Const_1:output:0*
T0*
_output_shapes
:м
/teacher_upsample_1/resize/ResizeNearestNeighborResizeNearestNeighbor"techer_conv2d_3/Relu:activations:0teacher_upsample_1/mul:z:0*
T0*/
_output_shapes
:џџџџџџџџџ*
half_pixel_centers(
&teacher_conv2d_4/Conv2D/ReadVariableOpReadVariableOp/teacher_conv2d_4_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0ѕ
teacher_conv2d_4/Conv2DConv2D@teacher_upsample_1/resize/ResizeNearestNeighbor:resized_images:0.teacher_conv2d_4/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ*
paddingSAME*
strides

'teacher_conv2d_4/BiasAdd/ReadVariableOpReadVariableOp0teacher_conv2d_4_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0А
teacher_conv2d_4/BiasAddBiasAdd teacher_conv2d_4/Conv2D:output:0/teacher_conv2d_4/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџz
teacher_conv2d_4/ReluRelu!teacher_conv2d_4/BiasAdd:output:0*
T0*/
_output_shapes
:џџџџџџџџџ
&teacher_conv2d_5/Conv2D/ReadVariableOpReadVariableOp/teacher_conv2d_5_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0и
teacher_conv2d_5/Conv2DConv2D#teacher_conv2d_4/Relu:activations:0.teacher_conv2d_5/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ*
paddingSAME*
strides

'teacher_conv2d_5/BiasAdd/ReadVariableOpReadVariableOp0teacher_conv2d_5_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0А
teacher_conv2d_5/BiasAddBiasAdd teacher_conv2d_5/Conv2D:output:0/teacher_conv2d_5/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџx
IdentityIdentity!teacher_conv2d_5/BiasAdd:output:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџс
NoOpNoOp(^teacher_conv2d_1/BiasAdd/ReadVariableOp'^teacher_conv2d_1/Conv2D/ReadVariableOp(^teacher_conv2d_2/BiasAdd/ReadVariableOp'^teacher_conv2d_2/Conv2D/ReadVariableOp(^teacher_conv2d_4/BiasAdd/ReadVariableOp'^teacher_conv2d_4/Conv2D/ReadVariableOp(^teacher_conv2d_5/BiasAdd/ReadVariableOp'^teacher_conv2d_5/Conv2D/ReadVariableOp'^teacher_dense_1/BiasAdd/ReadVariableOp&^teacher_dense_1/MatMul/ReadVariableOp'^teacher_dense_2/BiasAdd/ReadVariableOp&^teacher_dense_2/MatMul/ReadVariableOp,^teacher_layer_norm/Reshape_2/ReadVariableOp,^teacher_layer_norm/Reshape_3/ReadVariableOp'^techer_conv2d_3/BiasAdd/ReadVariableOp&^techer_conv2d_3/Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*G
_input_shapes6
4:џџџџџџџџџќ: : : : : : : : : : : : : : : : 2R
'teacher_conv2d_1/BiasAdd/ReadVariableOp'teacher_conv2d_1/BiasAdd/ReadVariableOp2P
&teacher_conv2d_1/Conv2D/ReadVariableOp&teacher_conv2d_1/Conv2D/ReadVariableOp2R
'teacher_conv2d_2/BiasAdd/ReadVariableOp'teacher_conv2d_2/BiasAdd/ReadVariableOp2P
&teacher_conv2d_2/Conv2D/ReadVariableOp&teacher_conv2d_2/Conv2D/ReadVariableOp2R
'teacher_conv2d_4/BiasAdd/ReadVariableOp'teacher_conv2d_4/BiasAdd/ReadVariableOp2P
&teacher_conv2d_4/Conv2D/ReadVariableOp&teacher_conv2d_4/Conv2D/ReadVariableOp2R
'teacher_conv2d_5/BiasAdd/ReadVariableOp'teacher_conv2d_5/BiasAdd/ReadVariableOp2P
&teacher_conv2d_5/Conv2D/ReadVariableOp&teacher_conv2d_5/Conv2D/ReadVariableOp2P
&teacher_dense_1/BiasAdd/ReadVariableOp&teacher_dense_1/BiasAdd/ReadVariableOp2N
%teacher_dense_1/MatMul/ReadVariableOp%teacher_dense_1/MatMul/ReadVariableOp2P
&teacher_dense_2/BiasAdd/ReadVariableOp&teacher_dense_2/BiasAdd/ReadVariableOp2N
%teacher_dense_2/MatMul/ReadVariableOp%teacher_dense_2/MatMul/ReadVariableOp2Z
+teacher_layer_norm/Reshape_2/ReadVariableOp+teacher_layer_norm/Reshape_2/ReadVariableOp2Z
+teacher_layer_norm/Reshape_3/ReadVariableOp+teacher_layer_norm/Reshape_3/ReadVariableOp2P
&techer_conv2d_3/BiasAdd/ReadVariableOp&techer_conv2d_3/BiasAdd/ReadVariableOp2N
%techer_conv2d_3/Conv2D/ReadVariableOp%techer_conv2d_3/Conv2D/ReadVariableOp:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
C
	
G__inference_sequential_layer_call_and_return_conditional_losses_2240761

inputs0
teacher_layer_norm_2240715:0
teacher_layer_norm_2240717:2
teacher_conv2d_1_2240720:&
teacher_conv2d_1_2240722:2
teacher_conv2d_2_2240726:&
teacher_conv2d_2_2240728:*
teacher_dense_1_2240732:	тP%
teacher_dense_1_2240734:P*
teacher_dense_2_2240737:	Pт&
teacher_dense_2_2240739:	т1
techer_conv2d_3_2240744:%
techer_conv2d_3_2240746:2
teacher_conv2d_4_2240750:&
teacher_conv2d_4_2240752:2
teacher_conv2d_5_2240755:&
teacher_conv2d_5_2240757:
identityЂ(teacher_conv2d_1/StatefulPartitionedCallЂ(teacher_conv2d_2/StatefulPartitionedCallЂ(teacher_conv2d_4/StatefulPartitionedCallЂ(teacher_conv2d_5/StatefulPartitionedCallЂ'teacher_dense_1/StatefulPartitionedCallЂ'teacher_dense_2/StatefulPartitionedCallЂ*teacher_layer_norm/StatefulPartitionedCallЂ'techer_conv2d_3/StatefulPartitionedCallЯ
teacher_reshape/PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_teacher_reshape_layer_call_and_return_conditional_losses_2240318Х
*teacher_layer_norm/StatefulPartitionedCallStatefulPartitionedCall(teacher_reshape/PartitionedCall:output:0teacher_layer_norm_2240715teacher_layer_norm_2240717*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_teacher_layer_norm_layer_call_and_return_conditional_losses_2240376Ш
(teacher_conv2d_1/StatefulPartitionedCallStatefulPartitionedCall3teacher_layer_norm/StatefulPartitionedCall:output:0teacher_conv2d_1_2240720teacher_conv2d_1_2240722*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_2240393
%teacher_averagepool_1/PartitionedCallPartitionedCall1teacher_conv2d_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *[
fVRT
R__inference_teacher_averagepool_1_layer_call_and_return_conditional_losses_2240275У
(teacher_conv2d_2/StatefulPartitionedCallStatefulPartitionedCall.teacher_averagepool_1/PartitionedCall:output:0teacher_conv2d_2_2240726teacher_conv2d_2_2240728*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_2240411ї
!teacher_flatten_1/PartitionedCallPartitionedCall1teacher_conv2d_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџт* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *W
fRRP
N__inference_teacher_flatten_1_layer_call_and_return_conditional_losses_2240423Г
'teacher_dense_1/StatefulPartitionedCallStatefulPartitionedCall*teacher_flatten_1/PartitionedCall:output:0teacher_dense_1_2240732teacher_dense_1_2240734*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџP*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_teacher_dense_1_layer_call_and_return_conditional_losses_2240436К
'teacher_dense_2/StatefulPartitionedCallStatefulPartitionedCall0teacher_dense_1/StatefulPartitionedCall:output:0teacher_dense_2_2240737teacher_dense_2_2240739*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџт*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_teacher_dense_2_layer_call_and_return_conditional_losses_2240452§
!teacher_reshape_2/PartitionedCallPartitionedCall0teacher_dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *W
fRRP
N__inference_teacher_reshape_2_layer_call_and_return_conditional_losses_2240472§
$teacher_activation_1/PartitionedCallPartitionedCall*teacher_reshape_2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Z
fURS
Q__inference_teacher_activation_1_layer_call_and_return_conditional_losses_2240479О
'techer_conv2d_3/StatefulPartitionedCallStatefulPartitionedCall-teacher_activation_1/PartitionedCall:output:0techer_conv2d_3_2240744techer_conv2d_3_2240746*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_techer_conv2d_3_layer_call_and_return_conditional_losses_2240492
"teacher_upsample_1/PartitionedCallPartitionedCall0techer_conv2d_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_teacher_upsample_1_layer_call_and_return_conditional_losses_2240294в
(teacher_conv2d_4/StatefulPartitionedCallStatefulPartitionedCall+teacher_upsample_1/PartitionedCall:output:0teacher_conv2d_4_2240750teacher_conv2d_4_2240752*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_2240510и
(teacher_conv2d_5/StatefulPartitionedCallStatefulPartitionedCall1teacher_conv2d_4/StatefulPartitionedCall:output:0teacher_conv2d_5_2240755teacher_conv2d_5_2240757*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_teacher_conv2d_5_layer_call_and_return_conditional_losses_2240526
IdentityIdentity1teacher_conv2d_5/StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ
NoOpNoOp)^teacher_conv2d_1/StatefulPartitionedCall)^teacher_conv2d_2/StatefulPartitionedCall)^teacher_conv2d_4/StatefulPartitionedCall)^teacher_conv2d_5/StatefulPartitionedCall(^teacher_dense_1/StatefulPartitionedCall(^teacher_dense_2/StatefulPartitionedCall+^teacher_layer_norm/StatefulPartitionedCall(^techer_conv2d_3/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*G
_input_shapes6
4:џџџџџџџџџќ: : : : : : : : : : : : : : : : 2T
(teacher_conv2d_1/StatefulPartitionedCall(teacher_conv2d_1/StatefulPartitionedCall2T
(teacher_conv2d_2/StatefulPartitionedCall(teacher_conv2d_2/StatefulPartitionedCall2T
(teacher_conv2d_4/StatefulPartitionedCall(teacher_conv2d_4/StatefulPartitionedCall2T
(teacher_conv2d_5/StatefulPartitionedCall(teacher_conv2d_5/StatefulPartitionedCall2R
'teacher_dense_1/StatefulPartitionedCall'teacher_dense_1/StatefulPartitionedCall2R
'teacher_dense_2/StatefulPartitionedCall'teacher_dense_2/StatefulPartitionedCall2X
*teacher_layer_norm/StatefulPartitionedCall*teacher_layer_norm/StatefulPartitionedCall2R
'techer_conv2d_3/StatefulPartitionedCall'techer_conv2d_3/StatefulPartitionedCall:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
Ї

ў
L__inference_teacher_dense_1_layer_call_and_return_conditional_losses_2240436

inputs1
matmul_readvariableop_resource:	тP-
biasadd_readvariableop_resource:P
identityЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	тP*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџPr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:P*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџPP
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџPa
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџPw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:џџџџџџџџџт: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:џџџџџџџџџт
 
_user_specified_nameinputs
ж	
џ
L__inference_teacher_dense_2_layer_call_and_return_conditional_losses_2241494

inputs1
matmul_readvariableop_resource:	Pт.
biasadd_readvariableop_resource:	т
identityЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	Pт*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџтs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:т*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџт`
IdentityIdentityBiasAdd:output:0^NoOp*
T0*(
_output_shapes
:џџџџџџџџџтw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџP: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:џџџџџџџџџP
 
_user_specified_nameinputs
Ё
ж
,__inference_sequential_layer_call_fn_2240833
teacher_input
unknown:
	unknown_0:#
	unknown_1:
	unknown_2:#
	unknown_3:
	unknown_4:
	unknown_5:	тP
	unknown_6:P
	unknown_7:	Pт
	unknown_8:	т#
	unknown_9:

unknown_10:$

unknown_11:

unknown_12:$

unknown_13:

unknown_14:
identityЂStatefulPartitionedCallИ
StatefulPartitionedCallStatefulPartitionedCallteacher_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ*2
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_sequential_layer_call_and_return_conditional_losses_2240761
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*G
_input_shapes6
4:џџџџџџџџџќ: : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
(
_output_shapes
:џџџџџџџџџќ
'
_user_specified_nameteacher_input


M__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_2240411

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identityЂBiasAdd/ReadVariableOpЂConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ	*
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
:џџџџџџџџџ	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџ	w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:џџџџџџџџџ	
 
_user_specified_nameinputs
з
R
6__inference_teacher_activation_1_layer_call_fn_2241518

inputs
identityФ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Z
fURS
Q__inference_teacher_activation_1_layer_call_and_return_conditional_losses_2240479h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ	:W S
/
_output_shapes
:џџџџџџџџџ	
 
_user_specified_nameinputs
ж
 
1__inference_teacher_dense_2_layer_call_fn_2241484

inputs
unknown:	Pт
	unknown_0:	т
identityЂStatefulPartitionedCallт
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџт*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_teacher_dense_2_layer_call_and_return_conditional_losses_2240452p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:џџџџџџџџџт`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџP: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:џџџџџџџџџP
 
_user_specified_nameinputs
у
h
L__inference_teacher_reshape_layer_call_and_return_conditional_losses_2240318

inputs
identityI
ShapeShapeinputs*
T0*
_output_shapes
::эЯ]
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
valueB:б
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
value	B :Љ
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:l
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:џџџџџџџџџ`
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:џџџџџџџџџќ:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
Р
P
4__inference_teacher_upsample_1_layer_call_fn_2241548

inputs
identityн
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_teacher_upsample_1_layer_call_and_return_conditional_losses_2240294
IdentityIdentityPartitionedCall:output:0*
T0*J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ:r n
J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
Ц
S
7__inference_teacher_averagepool_1_layer_call_fn_2241419

inputs
identityр
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *[
fVRT
R__inference_teacher_averagepool_1_layer_call_and_return_conditional_losses_2240275
IdentityIdentityPartitionedCall:output:0*
T0*J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ:r n
J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
Ѕ
k
O__inference_teacher_upsample_1_layer_call_and_return_conditional_losses_2241560

inputs
identityI
ShapeShapeinputs*
T0*
_output_shapes
::эЯ]
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
valueB:Н
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
:Е
resize/ResizeNearestNeighborResizeNearestNeighborinputsmul:z:0*
T0*J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ*
half_pixel_centers(
IdentityIdentity-resize/ResizeNearestNeighbor:resized_images:0*
T0*J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ:r n
J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
х
j
N__inference_teacher_reshape_2_layer_call_and_return_conditional_losses_2240472

inputs
identityI
ShapeShapeinputs*
T0*
_output_shapes
::эЯ]
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
valueB:б
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
value	B :Љ
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:l
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	`
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:џџџџџџџџџт:P L
(
_output_shapes
:џџџџџџџџџт
 
_user_specified_nameinputs
њ
І
1__inference_techer_conv2d_3_layer_call_fn_2241532

inputs!
unknown:
	unknown_0:
identityЂStatefulPartitionedCallщ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_techer_conv2d_3_layer_call_and_return_conditional_losses_2240492w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџ	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ	: : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:џџџџџџџџџ	
 
_user_specified_nameinputs


M__inference_teacher_conv2d_5_layer_call_and_return_conditional_losses_2241599

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identityЂBiasAdd/ReadVariableOpЂConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ћ
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџy
IdentityIdentityBiasAdd:output:0^NoOp*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџw
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:i e
A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs

Я
,__inference_sequential_layer_call_fn_2241048

inputs
unknown:
	unknown_0:#
	unknown_1:
	unknown_2:#
	unknown_3:
	unknown_4:
	unknown_5:	тP
	unknown_6:P
	unknown_7:	Pт
	unknown_8:	т#
	unknown_9:

unknown_10:$

unknown_11:

unknown_12:$

unknown_13:

unknown_14:
identityЂStatefulPartitionedCallБ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ*2
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_sequential_layer_call_and_return_conditional_losses_2240761
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*G
_input_shapes6
4:џџџџџџџџџќ: : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
а
j
N__inference_teacher_flatten_1_layer_call_and_return_conditional_losses_2241455

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџb  ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:џџџџџџџџџтY
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:џџџџџџџџџт"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ	:W S
/
_output_shapes
:џџџџџџџџџ	
 
_user_specified_nameinputs
ыН

"__inference__wrapped_model_2240266
teacher_inputU
?sequential_teacher_layer_norm_reshape_2_readvariableop_resource:U
?sequential_teacher_layer_norm_reshape_3_readvariableop_resource:T
:sequential_teacher_conv2d_1_conv2d_readvariableop_resource:I
;sequential_teacher_conv2d_1_biasadd_readvariableop_resource:T
:sequential_teacher_conv2d_2_conv2d_readvariableop_resource:I
;sequential_teacher_conv2d_2_biasadd_readvariableop_resource:L
9sequential_teacher_dense_1_matmul_readvariableop_resource:	тPH
:sequential_teacher_dense_1_biasadd_readvariableop_resource:PL
9sequential_teacher_dense_2_matmul_readvariableop_resource:	PтI
:sequential_teacher_dense_2_biasadd_readvariableop_resource:	тS
9sequential_techer_conv2d_3_conv2d_readvariableop_resource:H
:sequential_techer_conv2d_3_biasadd_readvariableop_resource:T
:sequential_teacher_conv2d_4_conv2d_readvariableop_resource:I
;sequential_teacher_conv2d_4_biasadd_readvariableop_resource:T
:sequential_teacher_conv2d_5_conv2d_readvariableop_resource:I
;sequential_teacher_conv2d_5_biasadd_readvariableop_resource:
identityЂ2sequential/teacher_conv2d_1/BiasAdd/ReadVariableOpЂ1sequential/teacher_conv2d_1/Conv2D/ReadVariableOpЂ2sequential/teacher_conv2d_2/BiasAdd/ReadVariableOpЂ1sequential/teacher_conv2d_2/Conv2D/ReadVariableOpЂ2sequential/teacher_conv2d_4/BiasAdd/ReadVariableOpЂ1sequential/teacher_conv2d_4/Conv2D/ReadVariableOpЂ2sequential/teacher_conv2d_5/BiasAdd/ReadVariableOpЂ1sequential/teacher_conv2d_5/Conv2D/ReadVariableOpЂ1sequential/teacher_dense_1/BiasAdd/ReadVariableOpЂ0sequential/teacher_dense_1/MatMul/ReadVariableOpЂ1sequential/teacher_dense_2/BiasAdd/ReadVariableOpЂ0sequential/teacher_dense_2/MatMul/ReadVariableOpЂ6sequential/teacher_layer_norm/Reshape_2/ReadVariableOpЂ6sequential/teacher_layer_norm/Reshape_3/ReadVariableOpЂ1sequential/techer_conv2d_3/BiasAdd/ReadVariableOpЂ0sequential/techer_conv2d_3/Conv2D/ReadVariableOpk
 sequential/teacher_reshape/ShapeShapeteacher_input*
T0*
_output_shapes
::эЯx
.sequential/teacher_reshape/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: z
0sequential/teacher_reshape/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0sequential/teacher_reshape/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:и
(sequential/teacher_reshape/strided_sliceStridedSlice)sequential/teacher_reshape/Shape:output:07sequential/teacher_reshape/strided_slice/stack:output:09sequential/teacher_reshape/strided_slice/stack_1:output:09sequential/teacher_reshape/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskl
*sequential/teacher_reshape/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :l
*sequential/teacher_reshape/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :l
*sequential/teacher_reshape/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :А
(sequential/teacher_reshape/Reshape/shapePack1sequential/teacher_reshape/strided_slice:output:03sequential/teacher_reshape/Reshape/shape/1:output:03sequential/teacher_reshape/Reshape/shape/2:output:03sequential/teacher_reshape/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:Љ
"sequential/teacher_reshape/ReshapeReshapeteacher_input1sequential/teacher_reshape/Reshape/shape:output:0*
T0*/
_output_shapes
:џџџџџџџџџ
#sequential/teacher_layer_norm/ShapeShape+sequential/teacher_reshape/Reshape:output:0*
T0*
_output_shapes
::эЯ{
1sequential/teacher_layer_norm/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: }
3sequential/teacher_layer_norm/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:}
3sequential/teacher_layer_norm/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ч
+sequential/teacher_layer_norm/strided_sliceStridedSlice,sequential/teacher_layer_norm/Shape:output:0:sequential/teacher_layer_norm/strided_slice/stack:output:0<sequential/teacher_layer_norm/strided_slice/stack_1:output:0<sequential/teacher_layer_norm/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maske
#sequential/teacher_layer_norm/mul/xConst*
_output_shapes
: *
dtype0*
value	B :­
!sequential/teacher_layer_norm/mulMul,sequential/teacher_layer_norm/mul/x:output:04sequential/teacher_layer_norm/strided_slice:output:0*
T0*
_output_shapes
: }
3sequential/teacher_layer_norm/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:
5sequential/teacher_layer_norm/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
5sequential/teacher_layer_norm/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:я
-sequential/teacher_layer_norm/strided_slice_1StridedSlice,sequential/teacher_layer_norm/Shape:output:0<sequential/teacher_layer_norm/strided_slice_1/stack:output:0>sequential/teacher_layer_norm/strided_slice_1/stack_1:output:0>sequential/teacher_layer_norm/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskg
%sequential/teacher_layer_norm/mul_1/xConst*
_output_shapes
: *
dtype0*
value	B :Г
#sequential/teacher_layer_norm/mul_1Mul.sequential/teacher_layer_norm/mul_1/x:output:06sequential/teacher_layer_norm/strided_slice_1:output:0*
T0*
_output_shapes
: }
3sequential/teacher_layer_norm/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:
5sequential/teacher_layer_norm/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
5sequential/teacher_layer_norm/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:я
-sequential/teacher_layer_norm/strided_slice_2StridedSlice,sequential/teacher_layer_norm/Shape:output:0<sequential/teacher_layer_norm/strided_slice_2/stack:output:0>sequential/teacher_layer_norm/strided_slice_2/stack_1:output:0>sequential/teacher_layer_norm/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskЌ
#sequential/teacher_layer_norm/mul_2Mul'sequential/teacher_layer_norm/mul_1:z:06sequential/teacher_layer_norm/strided_slice_2:output:0*
T0*
_output_shapes
: }
3sequential/teacher_layer_norm/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
5sequential/teacher_layer_norm/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
5sequential/teacher_layer_norm/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:я
-sequential/teacher_layer_norm/strided_slice_3StridedSlice,sequential/teacher_layer_norm/Shape:output:0<sequential/teacher_layer_norm/strided_slice_3/stack:output:0>sequential/teacher_layer_norm/strided_slice_3/stack_1:output:0>sequential/teacher_layer_norm/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskЌ
#sequential/teacher_layer_norm/mul_3Mul'sequential/teacher_layer_norm/mul_2:z:06sequential/teacher_layer_norm/strided_slice_3:output:0*
T0*
_output_shapes
: o
-sequential/teacher_layer_norm/Reshape/shape/0Const*
_output_shapes
: *
dtype0*
value	B :o
-sequential/teacher_layer_norm/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :Ё
+sequential/teacher_layer_norm/Reshape/shapePack6sequential/teacher_layer_norm/Reshape/shape/0:output:0%sequential/teacher_layer_norm/mul:z:0'sequential/teacher_layer_norm/mul_3:z:06sequential/teacher_layer_norm/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:Ю
%sequential/teacher_layer_norm/ReshapeReshape+sequential/teacher_reshape/Reshape:output:04sequential/teacher_layer_norm/Reshape/shape:output:0*
T0*0
_output_shapes
:џџџџџџџџџќ
)sequential/teacher_layer_norm/ones/packedPack%sequential/teacher_layer_norm/mul:z:0*
N*
T0*
_output_shapes
:m
(sequential/teacher_layer_norm/ones/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?П
"sequential/teacher_layer_norm/onesFill2sequential/teacher_layer_norm/ones/packed:output:01sequential/teacher_layer_norm/ones/Const:output:0*
T0*#
_output_shapes
:џџџџџџџџџ
*sequential/teacher_layer_norm/zeros/packedPack%sequential/teacher_layer_norm/mul:z:0*
N*
T0*
_output_shapes
:n
)sequential/teacher_layer_norm/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    Т
#sequential/teacher_layer_norm/zerosFill3sequential/teacher_layer_norm/zeros/packed:output:02sequential/teacher_layer_norm/zeros/Const:output:0*
T0*#
_output_shapes
:џџџџџџџџџf
#sequential/teacher_layer_norm/ConstConst*
_output_shapes
: *
dtype0*
valueB h
%sequential/teacher_layer_norm/Const_1Const*
_output_shapes
: *
dtype0*
valueB и
.sequential/teacher_layer_norm/FusedBatchNormV3FusedBatchNormV3.sequential/teacher_layer_norm/Reshape:output:0+sequential/teacher_layer_norm/ones:output:0,sequential/teacher_layer_norm/zeros:output:0,sequential/teacher_layer_norm/Const:output:0.sequential/teacher_layer_norm/Const_1:output:0*
T0*
U0*p
_output_shapes^
\:џџџџџџџџџќ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:*
data_formatNCHW*
epsilon%o:Ю
'sequential/teacher_layer_norm/Reshape_1Reshape2sequential/teacher_layer_norm/FusedBatchNormV3:y:0,sequential/teacher_layer_norm/Shape:output:0*
T0*/
_output_shapes
:џџџџџџџџџК
6sequential/teacher_layer_norm/Reshape_2/ReadVariableOpReadVariableOp?sequential_teacher_layer_norm_reshape_2_readvariableop_resource*"
_output_shapes
:*
dtype0
-sequential/teacher_layer_norm/Reshape_2/shapeConst*
_output_shapes
:*
dtype0*%
valueB"            л
'sequential/teacher_layer_norm/Reshape_2Reshape>sequential/teacher_layer_norm/Reshape_2/ReadVariableOp:value:06sequential/teacher_layer_norm/Reshape_2/shape:output:0*
T0*&
_output_shapes
:К
6sequential/teacher_layer_norm/Reshape_3/ReadVariableOpReadVariableOp?sequential_teacher_layer_norm_reshape_3_readvariableop_resource*"
_output_shapes
:*
dtype0
-sequential/teacher_layer_norm/Reshape_3/shapeConst*
_output_shapes
:*
dtype0*%
valueB"            л
'sequential/teacher_layer_norm/Reshape_3Reshape>sequential/teacher_layer_norm/Reshape_3/ReadVariableOp:value:06sequential/teacher_layer_norm/Reshape_3/shape:output:0*
T0*&
_output_shapes
:Ш
#sequential/teacher_layer_norm/mul_4Mul0sequential/teacher_layer_norm/Reshape_1:output:00sequential/teacher_layer_norm/Reshape_2:output:0*
T0*/
_output_shapes
:џџџџџџџџџП
!sequential/teacher_layer_norm/addAddV2'sequential/teacher_layer_norm/mul_4:z:00sequential/teacher_layer_norm/Reshape_3:output:0*
T0*/
_output_shapes
:џџџџџџџџџД
1sequential/teacher_conv2d_1/Conv2D/ReadVariableOpReadVariableOp:sequential_teacher_conv2d_1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0№
"sequential/teacher_conv2d_1/Conv2DConv2D%sequential/teacher_layer_norm/add:z:09sequential/teacher_conv2d_1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ*
paddingSAME*
strides
Њ
2sequential/teacher_conv2d_1/BiasAdd/ReadVariableOpReadVariableOp;sequential_teacher_conv2d_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0б
#sequential/teacher_conv2d_1/BiasAddBiasAdd+sequential/teacher_conv2d_1/Conv2D:output:0:sequential/teacher_conv2d_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ
 sequential/teacher_conv2d_1/ReluRelu,sequential/teacher_conv2d_1/BiasAdd:output:0*
T0*/
_output_shapes
:џџџџџџџџџй
(sequential/teacher_averagepool_1/AvgPoolAvgPool.sequential/teacher_conv2d_1/Relu:activations:0*
T0*/
_output_shapes
:џџџџџџџџџ	*
ksize
*
paddingVALID*
strides
Д
1sequential/teacher_conv2d_2/Conv2D/ReadVariableOpReadVariableOp:sequential_teacher_conv2d_2_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0ќ
"sequential/teacher_conv2d_2/Conv2DConv2D1sequential/teacher_averagepool_1/AvgPool:output:09sequential/teacher_conv2d_2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ	*
paddingSAME*
strides
Њ
2sequential/teacher_conv2d_2/BiasAdd/ReadVariableOpReadVariableOp;sequential_teacher_conv2d_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0б
#sequential/teacher_conv2d_2/BiasAddBiasAdd+sequential/teacher_conv2d_2/Conv2D:output:0:sequential/teacher_conv2d_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ	
 sequential/teacher_conv2d_2/ReluRelu,sequential/teacher_conv2d_2/BiasAdd:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	s
"sequential/teacher_flatten_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџb  П
$sequential/teacher_flatten_1/ReshapeReshape.sequential/teacher_conv2d_2/Relu:activations:0+sequential/teacher_flatten_1/Const:output:0*
T0*(
_output_shapes
:џџџџџџџџџтЋ
0sequential/teacher_dense_1/MatMul/ReadVariableOpReadVariableOp9sequential_teacher_dense_1_matmul_readvariableop_resource*
_output_shapes
:	тP*
dtype0Ц
!sequential/teacher_dense_1/MatMulMatMul-sequential/teacher_flatten_1/Reshape:output:08sequential/teacher_dense_1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџPЈ
1sequential/teacher_dense_1/BiasAdd/ReadVariableOpReadVariableOp:sequential_teacher_dense_1_biasadd_readvariableop_resource*
_output_shapes
:P*
dtype0Ч
"sequential/teacher_dense_1/BiasAddBiasAdd+sequential/teacher_dense_1/MatMul:product:09sequential/teacher_dense_1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџP
sequential/teacher_dense_1/ReluRelu+sequential/teacher_dense_1/BiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџPЋ
0sequential/teacher_dense_2/MatMul/ReadVariableOpReadVariableOp9sequential_teacher_dense_2_matmul_readvariableop_resource*
_output_shapes
:	Pт*
dtype0Ч
!sequential/teacher_dense_2/MatMulMatMul-sequential/teacher_dense_1/Relu:activations:08sequential/teacher_dense_2/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџтЉ
1sequential/teacher_dense_2/BiasAdd/ReadVariableOpReadVariableOp:sequential_teacher_dense_2_biasadd_readvariableop_resource*
_output_shapes	
:т*
dtype0Ш
"sequential/teacher_dense_2/BiasAddBiasAdd+sequential/teacher_dense_2/MatMul:product:09sequential/teacher_dense_2/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџт
"sequential/teacher_reshape_2/ShapeShape+sequential/teacher_dense_2/BiasAdd:output:0*
T0*
_output_shapes
::эЯz
0sequential/teacher_reshape_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: |
2sequential/teacher_reshape_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:|
2sequential/teacher_reshape_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:т
*sequential/teacher_reshape_2/strided_sliceStridedSlice+sequential/teacher_reshape_2/Shape:output:09sequential/teacher_reshape_2/strided_slice/stack:output:0;sequential/teacher_reshape_2/strided_slice/stack_1:output:0;sequential/teacher_reshape_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskn
,sequential/teacher_reshape_2/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :	n
,sequential/teacher_reshape_2/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :n
,sequential/teacher_reshape_2/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :К
*sequential/teacher_reshape_2/Reshape/shapePack3sequential/teacher_reshape_2/strided_slice:output:05sequential/teacher_reshape_2/Reshape/shape/1:output:05sequential/teacher_reshape_2/Reshape/shape/2:output:05sequential/teacher_reshape_2/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:Ы
$sequential/teacher_reshape_2/ReshapeReshape+sequential/teacher_dense_2/BiasAdd:output:03sequential/teacher_reshape_2/Reshape/shape:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	
$sequential/teacher_activation_1/ReluRelu-sequential/teacher_reshape_2/Reshape:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	В
0sequential/techer_conv2d_3/Conv2D/ReadVariableOpReadVariableOp9sequential_techer_conv2d_3_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0ћ
!sequential/techer_conv2d_3/Conv2DConv2D2sequential/teacher_activation_1/Relu:activations:08sequential/techer_conv2d_3/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ	*
paddingSAME*
strides
Ј
1sequential/techer_conv2d_3/BiasAdd/ReadVariableOpReadVariableOp:sequential_techer_conv2d_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0Ю
"sequential/techer_conv2d_3/BiasAddBiasAdd*sequential/techer_conv2d_3/Conv2D:output:09sequential/techer_conv2d_3/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ	
sequential/techer_conv2d_3/ReluRelu+sequential/techer_conv2d_3/BiasAdd:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	t
#sequential/teacher_upsample_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"	      v
%sequential/teacher_upsample_1/Const_1Const*
_output_shapes
:*
dtype0*
valueB"      Ћ
!sequential/teacher_upsample_1/mulMul,sequential/teacher_upsample_1/Const:output:0.sequential/teacher_upsample_1/Const_1:output:0*
T0*
_output_shapes
:§
:sequential/teacher_upsample_1/resize/ResizeNearestNeighborResizeNearestNeighbor-sequential/techer_conv2d_3/Relu:activations:0%sequential/teacher_upsample_1/mul:z:0*
T0*/
_output_shapes
:џџџџџџџџџ*
half_pixel_centers(Д
1sequential/teacher_conv2d_4/Conv2D/ReadVariableOpReadVariableOp:sequential_teacher_conv2d_4_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0
"sequential/teacher_conv2d_4/Conv2DConv2DKsequential/teacher_upsample_1/resize/ResizeNearestNeighbor:resized_images:09sequential/teacher_conv2d_4/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ*
paddingSAME*
strides
Њ
2sequential/teacher_conv2d_4/BiasAdd/ReadVariableOpReadVariableOp;sequential_teacher_conv2d_4_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0б
#sequential/teacher_conv2d_4/BiasAddBiasAdd+sequential/teacher_conv2d_4/Conv2D:output:0:sequential/teacher_conv2d_4/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ
 sequential/teacher_conv2d_4/ReluRelu,sequential/teacher_conv2d_4/BiasAdd:output:0*
T0*/
_output_shapes
:џџџџџџџџџД
1sequential/teacher_conv2d_5/Conv2D/ReadVariableOpReadVariableOp:sequential_teacher_conv2d_5_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0љ
"sequential/teacher_conv2d_5/Conv2DConv2D.sequential/teacher_conv2d_4/Relu:activations:09sequential/teacher_conv2d_5/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ*
paddingSAME*
strides
Њ
2sequential/teacher_conv2d_5/BiasAdd/ReadVariableOpReadVariableOp;sequential_teacher_conv2d_5_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0б
#sequential/teacher_conv2d_5/BiasAddBiasAdd+sequential/teacher_conv2d_5/Conv2D:output:0:sequential/teacher_conv2d_5/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ
IdentityIdentity,sequential/teacher_conv2d_5/BiasAdd:output:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџ
NoOpNoOp3^sequential/teacher_conv2d_1/BiasAdd/ReadVariableOp2^sequential/teacher_conv2d_1/Conv2D/ReadVariableOp3^sequential/teacher_conv2d_2/BiasAdd/ReadVariableOp2^sequential/teacher_conv2d_2/Conv2D/ReadVariableOp3^sequential/teacher_conv2d_4/BiasAdd/ReadVariableOp2^sequential/teacher_conv2d_4/Conv2D/ReadVariableOp3^sequential/teacher_conv2d_5/BiasAdd/ReadVariableOp2^sequential/teacher_conv2d_5/Conv2D/ReadVariableOp2^sequential/teacher_dense_1/BiasAdd/ReadVariableOp1^sequential/teacher_dense_1/MatMul/ReadVariableOp2^sequential/teacher_dense_2/BiasAdd/ReadVariableOp1^sequential/teacher_dense_2/MatMul/ReadVariableOp7^sequential/teacher_layer_norm/Reshape_2/ReadVariableOp7^sequential/teacher_layer_norm/Reshape_3/ReadVariableOp2^sequential/techer_conv2d_3/BiasAdd/ReadVariableOp1^sequential/techer_conv2d_3/Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*G
_input_shapes6
4:џџџџџџџџџќ: : : : : : : : : : : : : : : : 2h
2sequential/teacher_conv2d_1/BiasAdd/ReadVariableOp2sequential/teacher_conv2d_1/BiasAdd/ReadVariableOp2f
1sequential/teacher_conv2d_1/Conv2D/ReadVariableOp1sequential/teacher_conv2d_1/Conv2D/ReadVariableOp2h
2sequential/teacher_conv2d_2/BiasAdd/ReadVariableOp2sequential/teacher_conv2d_2/BiasAdd/ReadVariableOp2f
1sequential/teacher_conv2d_2/Conv2D/ReadVariableOp1sequential/teacher_conv2d_2/Conv2D/ReadVariableOp2h
2sequential/teacher_conv2d_4/BiasAdd/ReadVariableOp2sequential/teacher_conv2d_4/BiasAdd/ReadVariableOp2f
1sequential/teacher_conv2d_4/Conv2D/ReadVariableOp1sequential/teacher_conv2d_4/Conv2D/ReadVariableOp2h
2sequential/teacher_conv2d_5/BiasAdd/ReadVariableOp2sequential/teacher_conv2d_5/BiasAdd/ReadVariableOp2f
1sequential/teacher_conv2d_5/Conv2D/ReadVariableOp1sequential/teacher_conv2d_5/Conv2D/ReadVariableOp2f
1sequential/teacher_dense_1/BiasAdd/ReadVariableOp1sequential/teacher_dense_1/BiasAdd/ReadVariableOp2d
0sequential/teacher_dense_1/MatMul/ReadVariableOp0sequential/teacher_dense_1/MatMul/ReadVariableOp2f
1sequential/teacher_dense_2/BiasAdd/ReadVariableOp1sequential/teacher_dense_2/BiasAdd/ReadVariableOp2d
0sequential/teacher_dense_2/MatMul/ReadVariableOp0sequential/teacher_dense_2/MatMul/ReadVariableOp2p
6sequential/teacher_layer_norm/Reshape_2/ReadVariableOp6sequential/teacher_layer_norm/Reshape_2/ReadVariableOp2p
6sequential/teacher_layer_norm/Reshape_3/ReadVariableOp6sequential/teacher_layer_norm/Reshape_3/ReadVariableOp2f
1sequential/techer_conv2d_3/BiasAdd/ReadVariableOp1sequential/techer_conv2d_3/BiasAdd/ReadVariableOp2d
0sequential/techer_conv2d_3/Conv2D/ReadVariableOp0sequential/techer_conv2d_3/Conv2D/ReadVariableOp:W S
(
_output_shapes
:џџџџџџџџџќ
'
_user_specified_nameteacher_input
ея
њ%
#__inference__traced_restore_2242136
file_prefix?
)assignvariableop_teacher_layer_norm_gamma:@
*assignvariableop_1_teacher_layer_norm_beta:D
*assignvariableop_2_teacher_conv2d_1_kernel:6
(assignvariableop_3_teacher_conv2d_1_bias:D
*assignvariableop_4_teacher_conv2d_2_kernel:6
(assignvariableop_5_teacher_conv2d_2_bias:<
)assignvariableop_6_teacher_dense_1_kernel:	тP5
'assignvariableop_7_teacher_dense_1_bias:P<
)assignvariableop_8_teacher_dense_2_kernel:	Pт6
'assignvariableop_9_teacher_dense_2_bias:	тD
*assignvariableop_10_techer_conv2d_3_kernel:6
(assignvariableop_11_techer_conv2d_3_bias:E
+assignvariableop_12_teacher_conv2d_4_kernel:7
)assignvariableop_13_teacher_conv2d_4_bias:E
+assignvariableop_14_teacher_conv2d_5_kernel:7
)assignvariableop_15_teacher_conv2d_5_bias:'
assignvariableop_16_iteration:	 +
!assignvariableop_17_learning_rate: I
3assignvariableop_18_adam_m_teacher_layer_norm_gamma:I
3assignvariableop_19_adam_v_teacher_layer_norm_gamma:H
2assignvariableop_20_adam_m_teacher_layer_norm_beta:H
2assignvariableop_21_adam_v_teacher_layer_norm_beta:L
2assignvariableop_22_adam_m_teacher_conv2d_1_kernel:L
2assignvariableop_23_adam_v_teacher_conv2d_1_kernel:>
0assignvariableop_24_adam_m_teacher_conv2d_1_bias:>
0assignvariableop_25_adam_v_teacher_conv2d_1_bias:L
2assignvariableop_26_adam_m_teacher_conv2d_2_kernel:L
2assignvariableop_27_adam_v_teacher_conv2d_2_kernel:>
0assignvariableop_28_adam_m_teacher_conv2d_2_bias:>
0assignvariableop_29_adam_v_teacher_conv2d_2_bias:D
1assignvariableop_30_adam_m_teacher_dense_1_kernel:	тPD
1assignvariableop_31_adam_v_teacher_dense_1_kernel:	тP=
/assignvariableop_32_adam_m_teacher_dense_1_bias:P=
/assignvariableop_33_adam_v_teacher_dense_1_bias:PD
1assignvariableop_34_adam_m_teacher_dense_2_kernel:	PтD
1assignvariableop_35_adam_v_teacher_dense_2_kernel:	Pт>
/assignvariableop_36_adam_m_teacher_dense_2_bias:	т>
/assignvariableop_37_adam_v_teacher_dense_2_bias:	тK
1assignvariableop_38_adam_m_techer_conv2d_3_kernel:K
1assignvariableop_39_adam_v_techer_conv2d_3_kernel:=
/assignvariableop_40_adam_m_techer_conv2d_3_bias:=
/assignvariableop_41_adam_v_techer_conv2d_3_bias:L
2assignvariableop_42_adam_m_teacher_conv2d_4_kernel:L
2assignvariableop_43_adam_v_teacher_conv2d_4_kernel:>
0assignvariableop_44_adam_m_teacher_conv2d_4_bias:>
0assignvariableop_45_adam_v_teacher_conv2d_4_bias:L
2assignvariableop_46_adam_m_teacher_conv2d_5_kernel:L
2assignvariableop_47_adam_v_teacher_conv2d_5_kernel:>
0assignvariableop_48_adam_m_teacher_conv2d_5_bias:>
0assignvariableop_49_adam_v_teacher_conv2d_5_bias:%
assignvariableop_50_total_2: %
assignvariableop_51_count_2: %
assignvariableop_52_total_1: %
assignvariableop_53_count_1: #
assignvariableop_54_total: #
assignvariableop_55_count: 
identity_57ЂAssignVariableOpЂAssignVariableOp_1ЂAssignVariableOp_10ЂAssignVariableOp_11ЂAssignVariableOp_12ЂAssignVariableOp_13ЂAssignVariableOp_14ЂAssignVariableOp_15ЂAssignVariableOp_16ЂAssignVariableOp_17ЂAssignVariableOp_18ЂAssignVariableOp_19ЂAssignVariableOp_2ЂAssignVariableOp_20ЂAssignVariableOp_21ЂAssignVariableOp_22ЂAssignVariableOp_23ЂAssignVariableOp_24ЂAssignVariableOp_25ЂAssignVariableOp_26ЂAssignVariableOp_27ЂAssignVariableOp_28ЂAssignVariableOp_29ЂAssignVariableOp_3ЂAssignVariableOp_30ЂAssignVariableOp_31ЂAssignVariableOp_32ЂAssignVariableOp_33ЂAssignVariableOp_34ЂAssignVariableOp_35ЂAssignVariableOp_36ЂAssignVariableOp_37ЂAssignVariableOp_38ЂAssignVariableOp_39ЂAssignVariableOp_4ЂAssignVariableOp_40ЂAssignVariableOp_41ЂAssignVariableOp_42ЂAssignVariableOp_43ЂAssignVariableOp_44ЂAssignVariableOp_45ЂAssignVariableOp_46ЂAssignVariableOp_47ЂAssignVariableOp_48ЂAssignVariableOp_49ЂAssignVariableOp_5ЂAssignVariableOp_50ЂAssignVariableOp_51ЂAssignVariableOp_52ЂAssignVariableOp_53ЂAssignVariableOp_54ЂAssignVariableOp_55ЂAssignVariableOp_6ЂAssignVariableOp_7ЂAssignVariableOp_8ЂAssignVariableOp_9
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:9*
dtype0*Ф
valueКBЗ9B5layer_with_weights-0/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/beta/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-7/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-7/bias/.ATTRIBUTES/VARIABLE_VALUEB0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/11/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/12/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/13/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/14/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/15/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/16/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/17/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/18/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/19/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/20/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/21/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/22/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/23/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/24/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/25/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/26/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/27/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/28/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/29/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/30/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/31/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/32/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/2/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/2/count/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPHу
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:9*
dtype0*
value|Bz9B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B О
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*њ
_output_shapesч
ф:::::::::::::::::::::::::::::::::::::::::::::::::::::::::*G
dtypes=
;29	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:М
AssignVariableOpAssignVariableOp)assignvariableop_teacher_layer_norm_gammaIdentity:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:С
AssignVariableOp_1AssignVariableOp*assignvariableop_1_teacher_layer_norm_betaIdentity_1:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:С
AssignVariableOp_2AssignVariableOp*assignvariableop_2_teacher_conv2d_1_kernelIdentity_2:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:П
AssignVariableOp_3AssignVariableOp(assignvariableop_3_teacher_conv2d_1_biasIdentity_3:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:С
AssignVariableOp_4AssignVariableOp*assignvariableop_4_teacher_conv2d_2_kernelIdentity_4:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:П
AssignVariableOp_5AssignVariableOp(assignvariableop_5_teacher_conv2d_2_biasIdentity_5:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:Р
AssignVariableOp_6AssignVariableOp)assignvariableop_6_teacher_dense_1_kernelIdentity_6:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:О
AssignVariableOp_7AssignVariableOp'assignvariableop_7_teacher_dense_1_biasIdentity_7:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:Р
AssignVariableOp_8AssignVariableOp)assignvariableop_8_teacher_dense_2_kernelIdentity_8:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:О
AssignVariableOp_9AssignVariableOp'assignvariableop_9_teacher_dense_2_biasIdentity_9:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:У
AssignVariableOp_10AssignVariableOp*assignvariableop_10_techer_conv2d_3_kernelIdentity_10:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:С
AssignVariableOp_11AssignVariableOp(assignvariableop_11_techer_conv2d_3_biasIdentity_11:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:Ф
AssignVariableOp_12AssignVariableOp+assignvariableop_12_teacher_conv2d_4_kernelIdentity_12:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:Т
AssignVariableOp_13AssignVariableOp)assignvariableop_13_teacher_conv2d_4_biasIdentity_13:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:Ф
AssignVariableOp_14AssignVariableOp+assignvariableop_14_teacher_conv2d_5_kernelIdentity_14:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:Т
AssignVariableOp_15AssignVariableOp)assignvariableop_15_teacher_conv2d_5_biasIdentity_15:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0	*
_output_shapes
:Ж
AssignVariableOp_16AssignVariableOpassignvariableop_16_iterationIdentity_16:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:К
AssignVariableOp_17AssignVariableOp!assignvariableop_17_learning_rateIdentity_17:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:Ь
AssignVariableOp_18AssignVariableOp3assignvariableop_18_adam_m_teacher_layer_norm_gammaIdentity_18:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:Ь
AssignVariableOp_19AssignVariableOp3assignvariableop_19_adam_v_teacher_layer_norm_gammaIdentity_19:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:Ы
AssignVariableOp_20AssignVariableOp2assignvariableop_20_adam_m_teacher_layer_norm_betaIdentity_20:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:Ы
AssignVariableOp_21AssignVariableOp2assignvariableop_21_adam_v_teacher_layer_norm_betaIdentity_21:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:Ы
AssignVariableOp_22AssignVariableOp2assignvariableop_22_adam_m_teacher_conv2d_1_kernelIdentity_22:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:Ы
AssignVariableOp_23AssignVariableOp2assignvariableop_23_adam_v_teacher_conv2d_1_kernelIdentity_23:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:Щ
AssignVariableOp_24AssignVariableOp0assignvariableop_24_adam_m_teacher_conv2d_1_biasIdentity_24:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:Щ
AssignVariableOp_25AssignVariableOp0assignvariableop_25_adam_v_teacher_conv2d_1_biasIdentity_25:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:Ы
AssignVariableOp_26AssignVariableOp2assignvariableop_26_adam_m_teacher_conv2d_2_kernelIdentity_26:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:Ы
AssignVariableOp_27AssignVariableOp2assignvariableop_27_adam_v_teacher_conv2d_2_kernelIdentity_27:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:Щ
AssignVariableOp_28AssignVariableOp0assignvariableop_28_adam_m_teacher_conv2d_2_biasIdentity_28:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:Щ
AssignVariableOp_29AssignVariableOp0assignvariableop_29_adam_v_teacher_conv2d_2_biasIdentity_29:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:Ъ
AssignVariableOp_30AssignVariableOp1assignvariableop_30_adam_m_teacher_dense_1_kernelIdentity_30:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:Ъ
AssignVariableOp_31AssignVariableOp1assignvariableop_31_adam_v_teacher_dense_1_kernelIdentity_31:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:Ш
AssignVariableOp_32AssignVariableOp/assignvariableop_32_adam_m_teacher_dense_1_biasIdentity_32:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:Ш
AssignVariableOp_33AssignVariableOp/assignvariableop_33_adam_v_teacher_dense_1_biasIdentity_33:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:Ъ
AssignVariableOp_34AssignVariableOp1assignvariableop_34_adam_m_teacher_dense_2_kernelIdentity_34:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:Ъ
AssignVariableOp_35AssignVariableOp1assignvariableop_35_adam_v_teacher_dense_2_kernelIdentity_35:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:Ш
AssignVariableOp_36AssignVariableOp/assignvariableop_36_adam_m_teacher_dense_2_biasIdentity_36:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:Ш
AssignVariableOp_37AssignVariableOp/assignvariableop_37_adam_v_teacher_dense_2_biasIdentity_37:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:Ъ
AssignVariableOp_38AssignVariableOp1assignvariableop_38_adam_m_techer_conv2d_3_kernelIdentity_38:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:Ъ
AssignVariableOp_39AssignVariableOp1assignvariableop_39_adam_v_techer_conv2d_3_kernelIdentity_39:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:Ш
AssignVariableOp_40AssignVariableOp/assignvariableop_40_adam_m_techer_conv2d_3_biasIdentity_40:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0*
_output_shapes
:Ш
AssignVariableOp_41AssignVariableOp/assignvariableop_41_adam_v_techer_conv2d_3_biasIdentity_41:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_42IdentityRestoreV2:tensors:42"/device:CPU:0*
T0*
_output_shapes
:Ы
AssignVariableOp_42AssignVariableOp2assignvariableop_42_adam_m_teacher_conv2d_4_kernelIdentity_42:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_43IdentityRestoreV2:tensors:43"/device:CPU:0*
T0*
_output_shapes
:Ы
AssignVariableOp_43AssignVariableOp2assignvariableop_43_adam_v_teacher_conv2d_4_kernelIdentity_43:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_44IdentityRestoreV2:tensors:44"/device:CPU:0*
T0*
_output_shapes
:Щ
AssignVariableOp_44AssignVariableOp0assignvariableop_44_adam_m_teacher_conv2d_4_biasIdentity_44:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_45IdentityRestoreV2:tensors:45"/device:CPU:0*
T0*
_output_shapes
:Щ
AssignVariableOp_45AssignVariableOp0assignvariableop_45_adam_v_teacher_conv2d_4_biasIdentity_45:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_46IdentityRestoreV2:tensors:46"/device:CPU:0*
T0*
_output_shapes
:Ы
AssignVariableOp_46AssignVariableOp2assignvariableop_46_adam_m_teacher_conv2d_5_kernelIdentity_46:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_47IdentityRestoreV2:tensors:47"/device:CPU:0*
T0*
_output_shapes
:Ы
AssignVariableOp_47AssignVariableOp2assignvariableop_47_adam_v_teacher_conv2d_5_kernelIdentity_47:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_48IdentityRestoreV2:tensors:48"/device:CPU:0*
T0*
_output_shapes
:Щ
AssignVariableOp_48AssignVariableOp0assignvariableop_48_adam_m_teacher_conv2d_5_biasIdentity_48:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_49IdentityRestoreV2:tensors:49"/device:CPU:0*
T0*
_output_shapes
:Щ
AssignVariableOp_49AssignVariableOp0assignvariableop_49_adam_v_teacher_conv2d_5_biasIdentity_49:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_50IdentityRestoreV2:tensors:50"/device:CPU:0*
T0*
_output_shapes
:Д
AssignVariableOp_50AssignVariableOpassignvariableop_50_total_2Identity_50:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_51IdentityRestoreV2:tensors:51"/device:CPU:0*
T0*
_output_shapes
:Д
AssignVariableOp_51AssignVariableOpassignvariableop_51_count_2Identity_51:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_52IdentityRestoreV2:tensors:52"/device:CPU:0*
T0*
_output_shapes
:Д
AssignVariableOp_52AssignVariableOpassignvariableop_52_total_1Identity_52:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_53IdentityRestoreV2:tensors:53"/device:CPU:0*
T0*
_output_shapes
:Д
AssignVariableOp_53AssignVariableOpassignvariableop_53_count_1Identity_53:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_54IdentityRestoreV2:tensors:54"/device:CPU:0*
T0*
_output_shapes
:В
AssignVariableOp_54AssignVariableOpassignvariableop_54_totalIdentity_54:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_55IdentityRestoreV2:tensors:55"/device:CPU:0*
T0*
_output_shapes
:В
AssignVariableOp_55AssignVariableOpassignvariableop_55_countIdentity_55:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0Y
NoOpNoOp"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 

Identity_56Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_57IdentityIdentity_56:output:0^NoOp_1*
T0*
_output_shapes
: 

NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_57Identity_57:output:0*
_input_shapest
r: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
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
AssignVariableOp_48AssignVariableOp_482*
AssignVariableOp_49AssignVariableOp_492(
AssignVariableOp_5AssignVariableOp_52*
AssignVariableOp_50AssignVariableOp_502*
AssignVariableOp_51AssignVariableOp_512*
AssignVariableOp_52AssignVariableOp_522*
AssignVariableOp_53AssignVariableOp_532*
AssignVariableOp_54AssignVariableOp_542*
AssignVariableOp_55AssignVariableOp_552(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
Ї

ў
L__inference_teacher_dense_1_layer_call_and_return_conditional_losses_2241475

inputs1
matmul_readvariableop_resource:	тP-
biasadd_readvariableop_resource:P
identityЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	тP*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџPr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:P*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџPP
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџPa
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџPw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:џџџџџџџџџт: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:џџџџџџџџџт
 
_user_specified_nameinputs


M__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_2240393

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identityЂBiasAdd/ReadVariableOpЂConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ*
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
:џџџџџџџџџX
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:џџџџџџџџџi
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџw
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
е

1__inference_teacher_dense_1_layer_call_fn_2241464

inputs
unknown:	тP
	unknown_0:P
identityЂStatefulPartitionedCallс
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџP*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_teacher_dense_1_layer_call_and_return_conditional_losses_2240436o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџP`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:џџџџџџџџџт: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:џџџџџџџџџт
 
_user_specified_nameinputs
у
h
L__inference_teacher_reshape_layer_call_and_return_conditional_losses_2241329

inputs
identityI
ShapeShapeinputs*
T0*
_output_shapes
::эЯ]
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
valueB:б
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
value	B :Љ
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:l
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:џџџџџџџџџ`
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:џџџџџџџџџќ:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
х
j
N__inference_teacher_reshape_2_layer_call_and_return_conditional_losses_2241513

inputs
identityI
ShapeShapeinputs*
T0*
_output_shapes
::эЯ]
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
valueB:б
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
value	B :Љ
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:l
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	`
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:џџџџџџџџџт:P L
(
_output_shapes
:џџџџџџџџџт
 
_user_specified_nameinputs
гЂ
г
G__inference_sequential_layer_call_and_return_conditional_losses_2241179

inputsJ
4teacher_layer_norm_reshape_2_readvariableop_resource:J
4teacher_layer_norm_reshape_3_readvariableop_resource:I
/teacher_conv2d_1_conv2d_readvariableop_resource:>
0teacher_conv2d_1_biasadd_readvariableop_resource:I
/teacher_conv2d_2_conv2d_readvariableop_resource:>
0teacher_conv2d_2_biasadd_readvariableop_resource:A
.teacher_dense_1_matmul_readvariableop_resource:	тP=
/teacher_dense_1_biasadd_readvariableop_resource:PA
.teacher_dense_2_matmul_readvariableop_resource:	Pт>
/teacher_dense_2_biasadd_readvariableop_resource:	тH
.techer_conv2d_3_conv2d_readvariableop_resource:=
/techer_conv2d_3_biasadd_readvariableop_resource:I
/teacher_conv2d_4_conv2d_readvariableop_resource:>
0teacher_conv2d_4_biasadd_readvariableop_resource:I
/teacher_conv2d_5_conv2d_readvariableop_resource:>
0teacher_conv2d_5_biasadd_readvariableop_resource:
identityЂ'teacher_conv2d_1/BiasAdd/ReadVariableOpЂ&teacher_conv2d_1/Conv2D/ReadVariableOpЂ'teacher_conv2d_2/BiasAdd/ReadVariableOpЂ&teacher_conv2d_2/Conv2D/ReadVariableOpЂ'teacher_conv2d_4/BiasAdd/ReadVariableOpЂ&teacher_conv2d_4/Conv2D/ReadVariableOpЂ'teacher_conv2d_5/BiasAdd/ReadVariableOpЂ&teacher_conv2d_5/Conv2D/ReadVariableOpЂ&teacher_dense_1/BiasAdd/ReadVariableOpЂ%teacher_dense_1/MatMul/ReadVariableOpЂ&teacher_dense_2/BiasAdd/ReadVariableOpЂ%teacher_dense_2/MatMul/ReadVariableOpЂ+teacher_layer_norm/Reshape_2/ReadVariableOpЂ+teacher_layer_norm/Reshape_3/ReadVariableOpЂ&techer_conv2d_3/BiasAdd/ReadVariableOpЂ%techer_conv2d_3/Conv2D/ReadVariableOpY
teacher_reshape/ShapeShapeinputs*
T0*
_output_shapes
::эЯm
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
valueB:Ё
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
value	B :љ
teacher_reshape/Reshape/shapePack&teacher_reshape/strided_slice:output:0(teacher_reshape/Reshape/shape/1:output:0(teacher_reshape/Reshape/shape/2:output:0(teacher_reshape/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:
teacher_reshape/ReshapeReshapeinputs&teacher_reshape/Reshape/shape:output:0*
T0*/
_output_shapes
:џџџџџџџџџv
teacher_layer_norm/ShapeShape teacher_reshape/Reshape:output:0*
T0*
_output_shapes
::эЯp
&teacher_layer_norm/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(teacher_layer_norm/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(teacher_layer_norm/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:А
 teacher_layer_norm/strided_sliceStridedSlice!teacher_layer_norm/Shape:output:0/teacher_layer_norm/strided_slice/stack:output:01teacher_layer_norm/strided_slice/stack_1:output:01teacher_layer_norm/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskZ
teacher_layer_norm/mul/xConst*
_output_shapes
: *
dtype0*
value	B :
teacher_layer_norm/mulMul!teacher_layer_norm/mul/x:output:0)teacher_layer_norm/strided_slice:output:0*
T0*
_output_shapes
: r
(teacher_layer_norm/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:t
*teacher_layer_norm/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*teacher_layer_norm/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:И
"teacher_layer_norm/strided_slice_1StridedSlice!teacher_layer_norm/Shape:output:01teacher_layer_norm/strided_slice_1/stack:output:03teacher_layer_norm/strided_slice_1/stack_1:output:03teacher_layer_norm/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask\
teacher_layer_norm/mul_1/xConst*
_output_shapes
: *
dtype0*
value	B :
teacher_layer_norm/mul_1Mul#teacher_layer_norm/mul_1/x:output:0+teacher_layer_norm/strided_slice_1:output:0*
T0*
_output_shapes
: r
(teacher_layer_norm/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:t
*teacher_layer_norm/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*teacher_layer_norm/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:И
"teacher_layer_norm/strided_slice_2StridedSlice!teacher_layer_norm/Shape:output:01teacher_layer_norm/strided_slice_2/stack:output:03teacher_layer_norm/strided_slice_2/stack_1:output:03teacher_layer_norm/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
teacher_layer_norm/mul_2Multeacher_layer_norm/mul_1:z:0+teacher_layer_norm/strided_slice_2:output:0*
T0*
_output_shapes
: r
(teacher_layer_norm/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:t
*teacher_layer_norm/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*teacher_layer_norm/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:И
"teacher_layer_norm/strided_slice_3StridedSlice!teacher_layer_norm/Shape:output:01teacher_layer_norm/strided_slice_3/stack:output:03teacher_layer_norm/strided_slice_3/stack_1:output:03teacher_layer_norm/strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
teacher_layer_norm/mul_3Multeacher_layer_norm/mul_2:z:0+teacher_layer_norm/strided_slice_3:output:0*
T0*
_output_shapes
: d
"teacher_layer_norm/Reshape/shape/0Const*
_output_shapes
: *
dtype0*
value	B :d
"teacher_layer_norm/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :ъ
 teacher_layer_norm/Reshape/shapePack+teacher_layer_norm/Reshape/shape/0:output:0teacher_layer_norm/mul:z:0teacher_layer_norm/mul_3:z:0+teacher_layer_norm/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:­
teacher_layer_norm/ReshapeReshape teacher_reshape/Reshape:output:0)teacher_layer_norm/Reshape/shape:output:0*
T0*0
_output_shapes
:џџџџџџџџџќp
teacher_layer_norm/ones/packedPackteacher_layer_norm/mul:z:0*
N*
T0*
_output_shapes
:b
teacher_layer_norm/ones/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
teacher_layer_norm/onesFill'teacher_layer_norm/ones/packed:output:0&teacher_layer_norm/ones/Const:output:0*
T0*#
_output_shapes
:џџџџџџџџџq
teacher_layer_norm/zeros/packedPackteacher_layer_norm/mul:z:0*
N*
T0*
_output_shapes
:c
teacher_layer_norm/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    Ё
teacher_layer_norm/zerosFill(teacher_layer_norm/zeros/packed:output:0'teacher_layer_norm/zeros/Const:output:0*
T0*#
_output_shapes
:џџџџџџџџџ[
teacher_layer_norm/ConstConst*
_output_shapes
: *
dtype0*
valueB ]
teacher_layer_norm/Const_1Const*
_output_shapes
: *
dtype0*
valueB 
#teacher_layer_norm/FusedBatchNormV3FusedBatchNormV3#teacher_layer_norm/Reshape:output:0 teacher_layer_norm/ones:output:0!teacher_layer_norm/zeros:output:0!teacher_layer_norm/Const:output:0#teacher_layer_norm/Const_1:output:0*
T0*
U0*p
_output_shapes^
\:џџџџџџџџџќ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:*
data_formatNCHW*
epsilon%o:­
teacher_layer_norm/Reshape_1Reshape'teacher_layer_norm/FusedBatchNormV3:y:0!teacher_layer_norm/Shape:output:0*
T0*/
_output_shapes
:џџџџџџџџџЄ
+teacher_layer_norm/Reshape_2/ReadVariableOpReadVariableOp4teacher_layer_norm_reshape_2_readvariableop_resource*"
_output_shapes
:*
dtype0{
"teacher_layer_norm/Reshape_2/shapeConst*
_output_shapes
:*
dtype0*%
valueB"            К
teacher_layer_norm/Reshape_2Reshape3teacher_layer_norm/Reshape_2/ReadVariableOp:value:0+teacher_layer_norm/Reshape_2/shape:output:0*
T0*&
_output_shapes
:Є
+teacher_layer_norm/Reshape_3/ReadVariableOpReadVariableOp4teacher_layer_norm_reshape_3_readvariableop_resource*"
_output_shapes
:*
dtype0{
"teacher_layer_norm/Reshape_3/shapeConst*
_output_shapes
:*
dtype0*%
valueB"            К
teacher_layer_norm/Reshape_3Reshape3teacher_layer_norm/Reshape_3/ReadVariableOp:value:0+teacher_layer_norm/Reshape_3/shape:output:0*
T0*&
_output_shapes
:Ї
teacher_layer_norm/mul_4Mul%teacher_layer_norm/Reshape_1:output:0%teacher_layer_norm/Reshape_2:output:0*
T0*/
_output_shapes
:џџџџџџџџџ
teacher_layer_norm/addAddV2teacher_layer_norm/mul_4:z:0%teacher_layer_norm/Reshape_3:output:0*
T0*/
_output_shapes
:џџџџџџџџџ
&teacher_conv2d_1/Conv2D/ReadVariableOpReadVariableOp/teacher_conv2d_1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Я
teacher_conv2d_1/Conv2DConv2Dteacher_layer_norm/add:z:0.teacher_conv2d_1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ*
paddingSAME*
strides

'teacher_conv2d_1/BiasAdd/ReadVariableOpReadVariableOp0teacher_conv2d_1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0А
teacher_conv2d_1/BiasAddBiasAdd teacher_conv2d_1/Conv2D:output:0/teacher_conv2d_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџz
teacher_conv2d_1/ReluRelu!teacher_conv2d_1/BiasAdd:output:0*
T0*/
_output_shapes
:џџџџџџџџџУ
teacher_averagepool_1/AvgPoolAvgPool#teacher_conv2d_1/Relu:activations:0*
T0*/
_output_shapes
:џџџџџџџџџ	*
ksize
*
paddingVALID*
strides

&teacher_conv2d_2/Conv2D/ReadVariableOpReadVariableOp/teacher_conv2d_2_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0л
teacher_conv2d_2/Conv2DConv2D&teacher_averagepool_1/AvgPool:output:0.teacher_conv2d_2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ	*
paddingSAME*
strides

'teacher_conv2d_2/BiasAdd/ReadVariableOpReadVariableOp0teacher_conv2d_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0А
teacher_conv2d_2/BiasAddBiasAdd teacher_conv2d_2/Conv2D:output:0/teacher_conv2d_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ	z
teacher_conv2d_2/ReluRelu!teacher_conv2d_2/BiasAdd:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	h
teacher_flatten_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџb  
teacher_flatten_1/ReshapeReshape#teacher_conv2d_2/Relu:activations:0 teacher_flatten_1/Const:output:0*
T0*(
_output_shapes
:џџџџџџџџџт
%teacher_dense_1/MatMul/ReadVariableOpReadVariableOp.teacher_dense_1_matmul_readvariableop_resource*
_output_shapes
:	тP*
dtype0Ѕ
teacher_dense_1/MatMulMatMul"teacher_flatten_1/Reshape:output:0-teacher_dense_1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџP
&teacher_dense_1/BiasAdd/ReadVariableOpReadVariableOp/teacher_dense_1_biasadd_readvariableop_resource*
_output_shapes
:P*
dtype0І
teacher_dense_1/BiasAddBiasAdd teacher_dense_1/MatMul:product:0.teacher_dense_1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџPp
teacher_dense_1/ReluRelu teacher_dense_1/BiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџP
%teacher_dense_2/MatMul/ReadVariableOpReadVariableOp.teacher_dense_2_matmul_readvariableop_resource*
_output_shapes
:	Pт*
dtype0І
teacher_dense_2/MatMulMatMul"teacher_dense_1/Relu:activations:0-teacher_dense_2/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџт
&teacher_dense_2/BiasAdd/ReadVariableOpReadVariableOp/teacher_dense_2_biasadd_readvariableop_resource*
_output_shapes	
:т*
dtype0Ї
teacher_dense_2/BiasAddBiasAdd teacher_dense_2/MatMul:product:0.teacher_dense_2/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџтu
teacher_reshape_2/ShapeShape teacher_dense_2/BiasAdd:output:0*
T0*
_output_shapes
::эЯo
%teacher_reshape_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: q
'teacher_reshape_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:q
'teacher_reshape_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ћ
teacher_reshape_2/strided_sliceStridedSlice teacher_reshape_2/Shape:output:0.teacher_reshape_2/strided_slice/stack:output:00teacher_reshape_2/strided_slice/stack_1:output:00teacher_reshape_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskc
!teacher_reshape_2/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :	c
!teacher_reshape_2/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :c
!teacher_reshape_2/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :
teacher_reshape_2/Reshape/shapePack(teacher_reshape_2/strided_slice:output:0*teacher_reshape_2/Reshape/shape/1:output:0*teacher_reshape_2/Reshape/shape/2:output:0*teacher_reshape_2/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:Њ
teacher_reshape_2/ReshapeReshape teacher_dense_2/BiasAdd:output:0(teacher_reshape_2/Reshape/shape:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	
teacher_activation_1/ReluRelu"teacher_reshape_2/Reshape:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	
%techer_conv2d_3/Conv2D/ReadVariableOpReadVariableOp.techer_conv2d_3_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0к
techer_conv2d_3/Conv2DConv2D'teacher_activation_1/Relu:activations:0-techer_conv2d_3/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ	*
paddingSAME*
strides

&techer_conv2d_3/BiasAdd/ReadVariableOpReadVariableOp/techer_conv2d_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0­
techer_conv2d_3/BiasAddBiasAddtecher_conv2d_3/Conv2D:output:0.techer_conv2d_3/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ	x
techer_conv2d_3/ReluRelu techer_conv2d_3/BiasAdd:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	i
teacher_upsample_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"	      k
teacher_upsample_1/Const_1Const*
_output_shapes
:*
dtype0*
valueB"      
teacher_upsample_1/mulMul!teacher_upsample_1/Const:output:0#teacher_upsample_1/Const_1:output:0*
T0*
_output_shapes
:м
/teacher_upsample_1/resize/ResizeNearestNeighborResizeNearestNeighbor"techer_conv2d_3/Relu:activations:0teacher_upsample_1/mul:z:0*
T0*/
_output_shapes
:џџџџџџџџџ*
half_pixel_centers(
&teacher_conv2d_4/Conv2D/ReadVariableOpReadVariableOp/teacher_conv2d_4_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0ѕ
teacher_conv2d_4/Conv2DConv2D@teacher_upsample_1/resize/ResizeNearestNeighbor:resized_images:0.teacher_conv2d_4/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ*
paddingSAME*
strides

'teacher_conv2d_4/BiasAdd/ReadVariableOpReadVariableOp0teacher_conv2d_4_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0А
teacher_conv2d_4/BiasAddBiasAdd teacher_conv2d_4/Conv2D:output:0/teacher_conv2d_4/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџz
teacher_conv2d_4/ReluRelu!teacher_conv2d_4/BiasAdd:output:0*
T0*/
_output_shapes
:џџџџџџџџџ
&teacher_conv2d_5/Conv2D/ReadVariableOpReadVariableOp/teacher_conv2d_5_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0и
teacher_conv2d_5/Conv2DConv2D#teacher_conv2d_4/Relu:activations:0.teacher_conv2d_5/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ*
paddingSAME*
strides

'teacher_conv2d_5/BiasAdd/ReadVariableOpReadVariableOp0teacher_conv2d_5_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0А
teacher_conv2d_5/BiasAddBiasAdd teacher_conv2d_5/Conv2D:output:0/teacher_conv2d_5/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџx
IdentityIdentity!teacher_conv2d_5/BiasAdd:output:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџс
NoOpNoOp(^teacher_conv2d_1/BiasAdd/ReadVariableOp'^teacher_conv2d_1/Conv2D/ReadVariableOp(^teacher_conv2d_2/BiasAdd/ReadVariableOp'^teacher_conv2d_2/Conv2D/ReadVariableOp(^teacher_conv2d_4/BiasAdd/ReadVariableOp'^teacher_conv2d_4/Conv2D/ReadVariableOp(^teacher_conv2d_5/BiasAdd/ReadVariableOp'^teacher_conv2d_5/Conv2D/ReadVariableOp'^teacher_dense_1/BiasAdd/ReadVariableOp&^teacher_dense_1/MatMul/ReadVariableOp'^teacher_dense_2/BiasAdd/ReadVariableOp&^teacher_dense_2/MatMul/ReadVariableOp,^teacher_layer_norm/Reshape_2/ReadVariableOp,^teacher_layer_norm/Reshape_3/ReadVariableOp'^techer_conv2d_3/BiasAdd/ReadVariableOp&^techer_conv2d_3/Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*G
_input_shapes6
4:џџџџџџџџџќ: : : : : : : : : : : : : : : : 2R
'teacher_conv2d_1/BiasAdd/ReadVariableOp'teacher_conv2d_1/BiasAdd/ReadVariableOp2P
&teacher_conv2d_1/Conv2D/ReadVariableOp&teacher_conv2d_1/Conv2D/ReadVariableOp2R
'teacher_conv2d_2/BiasAdd/ReadVariableOp'teacher_conv2d_2/BiasAdd/ReadVariableOp2P
&teacher_conv2d_2/Conv2D/ReadVariableOp&teacher_conv2d_2/Conv2D/ReadVariableOp2R
'teacher_conv2d_4/BiasAdd/ReadVariableOp'teacher_conv2d_4/BiasAdd/ReadVariableOp2P
&teacher_conv2d_4/Conv2D/ReadVariableOp&teacher_conv2d_4/Conv2D/ReadVariableOp2R
'teacher_conv2d_5/BiasAdd/ReadVariableOp'teacher_conv2d_5/BiasAdd/ReadVariableOp2P
&teacher_conv2d_5/Conv2D/ReadVariableOp&teacher_conv2d_5/Conv2D/ReadVariableOp2P
&teacher_dense_1/BiasAdd/ReadVariableOp&teacher_dense_1/BiasAdd/ReadVariableOp2N
%teacher_dense_1/MatMul/ReadVariableOp%teacher_dense_1/MatMul/ReadVariableOp2P
&teacher_dense_2/BiasAdd/ReadVariableOp&teacher_dense_2/BiasAdd/ReadVariableOp2N
%teacher_dense_2/MatMul/ReadVariableOp%teacher_dense_2/MatMul/ReadVariableOp2Z
+teacher_layer_norm/Reshape_2/ReadVariableOp+teacher_layer_norm/Reshape_2/ReadVariableOp2Z
+teacher_layer_norm/Reshape_3/ReadVariableOp+teacher_layer_norm/Reshape_3/ReadVariableOp2P
&techer_conv2d_3/BiasAdd/ReadVariableOp&techer_conv2d_3/BiasAdd/ReadVariableOp2N
%techer_conv2d_3/Conv2D/ReadVariableOp%techer_conv2d_3/Conv2D/ReadVariableOp:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
C
	
G__inference_sequential_layer_call_and_return_conditional_losses_2240933
teacher_input0
teacher_layer_norm_2240887:0
teacher_layer_norm_2240889:2
teacher_conv2d_1_2240892:&
teacher_conv2d_1_2240894:2
teacher_conv2d_2_2240898:&
teacher_conv2d_2_2240900:*
teacher_dense_1_2240904:	тP%
teacher_dense_1_2240906:P*
teacher_dense_2_2240909:	Pт&
teacher_dense_2_2240911:	т1
techer_conv2d_3_2240916:%
techer_conv2d_3_2240918:2
teacher_conv2d_4_2240922:&
teacher_conv2d_4_2240924:2
teacher_conv2d_5_2240927:&
teacher_conv2d_5_2240929:
identityЂ(teacher_conv2d_1/StatefulPartitionedCallЂ(teacher_conv2d_2/StatefulPartitionedCallЂ(teacher_conv2d_4/StatefulPartitionedCallЂ(teacher_conv2d_5/StatefulPartitionedCallЂ'teacher_dense_1/StatefulPartitionedCallЂ'teacher_dense_2/StatefulPartitionedCallЂ*teacher_layer_norm/StatefulPartitionedCallЂ'techer_conv2d_3/StatefulPartitionedCallж
teacher_reshape/PartitionedCallPartitionedCallteacher_input*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_teacher_reshape_layer_call_and_return_conditional_losses_2240318Х
*teacher_layer_norm/StatefulPartitionedCallStatefulPartitionedCall(teacher_reshape/PartitionedCall:output:0teacher_layer_norm_2240887teacher_layer_norm_2240889*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_teacher_layer_norm_layer_call_and_return_conditional_losses_2240376Ш
(teacher_conv2d_1/StatefulPartitionedCallStatefulPartitionedCall3teacher_layer_norm/StatefulPartitionedCall:output:0teacher_conv2d_1_2240892teacher_conv2d_1_2240894*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_2240393
%teacher_averagepool_1/PartitionedCallPartitionedCall1teacher_conv2d_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *[
fVRT
R__inference_teacher_averagepool_1_layer_call_and_return_conditional_losses_2240275У
(teacher_conv2d_2/StatefulPartitionedCallStatefulPartitionedCall.teacher_averagepool_1/PartitionedCall:output:0teacher_conv2d_2_2240898teacher_conv2d_2_2240900*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_2240411ї
!teacher_flatten_1/PartitionedCallPartitionedCall1teacher_conv2d_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџт* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *W
fRRP
N__inference_teacher_flatten_1_layer_call_and_return_conditional_losses_2240423Г
'teacher_dense_1/StatefulPartitionedCallStatefulPartitionedCall*teacher_flatten_1/PartitionedCall:output:0teacher_dense_1_2240904teacher_dense_1_2240906*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџP*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_teacher_dense_1_layer_call_and_return_conditional_losses_2240436К
'teacher_dense_2/StatefulPartitionedCallStatefulPartitionedCall0teacher_dense_1/StatefulPartitionedCall:output:0teacher_dense_2_2240909teacher_dense_2_2240911*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџт*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_teacher_dense_2_layer_call_and_return_conditional_losses_2240452§
!teacher_reshape_2/PartitionedCallPartitionedCall0teacher_dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *W
fRRP
N__inference_teacher_reshape_2_layer_call_and_return_conditional_losses_2240472§
$teacher_activation_1/PartitionedCallPartitionedCall*teacher_reshape_2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Z
fURS
Q__inference_teacher_activation_1_layer_call_and_return_conditional_losses_2240479О
'techer_conv2d_3/StatefulPartitionedCallStatefulPartitionedCall-teacher_activation_1/PartitionedCall:output:0techer_conv2d_3_2240916techer_conv2d_3_2240918*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_techer_conv2d_3_layer_call_and_return_conditional_losses_2240492
"teacher_upsample_1/PartitionedCallPartitionedCall0techer_conv2d_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_teacher_upsample_1_layer_call_and_return_conditional_losses_2240294в
(teacher_conv2d_4/StatefulPartitionedCallStatefulPartitionedCall+teacher_upsample_1/PartitionedCall:output:0teacher_conv2d_4_2240922teacher_conv2d_4_2240924*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_2240510и
(teacher_conv2d_5/StatefulPartitionedCallStatefulPartitionedCall1teacher_conv2d_4/StatefulPartitionedCall:output:0teacher_conv2d_5_2240927teacher_conv2d_5_2240929*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_teacher_conv2d_5_layer_call_and_return_conditional_losses_2240526
IdentityIdentity1teacher_conv2d_5/StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ
NoOpNoOp)^teacher_conv2d_1/StatefulPartitionedCall)^teacher_conv2d_2/StatefulPartitionedCall)^teacher_conv2d_4/StatefulPartitionedCall)^teacher_conv2d_5/StatefulPartitionedCall(^teacher_dense_1/StatefulPartitionedCall(^teacher_dense_2/StatefulPartitionedCall+^teacher_layer_norm/StatefulPartitionedCall(^techer_conv2d_3/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*G
_input_shapes6
4:џџџџџџџџџќ: : : : : : : : : : : : : : : : 2T
(teacher_conv2d_1/StatefulPartitionedCall(teacher_conv2d_1/StatefulPartitionedCall2T
(teacher_conv2d_2/StatefulPartitionedCall(teacher_conv2d_2/StatefulPartitionedCall2T
(teacher_conv2d_4/StatefulPartitionedCall(teacher_conv2d_4/StatefulPartitionedCall2T
(teacher_conv2d_5/StatefulPartitionedCall(teacher_conv2d_5/StatefulPartitionedCall2R
'teacher_dense_1/StatefulPartitionedCall'teacher_dense_1/StatefulPartitionedCall2R
'teacher_dense_2/StatefulPartitionedCall'teacher_dense_2/StatefulPartitionedCall2X
*teacher_layer_norm/StatefulPartitionedCall*teacher_layer_norm/StatefulPartitionedCall2R
'techer_conv2d_3/StatefulPartitionedCall'techer_conv2d_3/StatefulPartitionedCall:W S
(
_output_shapes
:џџџџџџџџџќ
'
_user_specified_nameteacher_input


L__inference_techer_conv2d_3_layer_call_and_return_conditional_losses_2240492

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identityЂBiasAdd/ReadVariableOpЂConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ	*
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
:џџџџџџџџџ	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџ	w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:џџџџџџџџџ	
 
_user_specified_nameinputs
Ѓ
n
R__inference_teacher_averagepool_1_layer_call_and_return_conditional_losses_2241424

inputs
identityЋ
AvgPoolAvgPoolinputs*
T0*J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ*
ksize
*
paddingVALID*
strides
{
IdentityIdentityAvgPool:output:0*
T0*J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ:r n
J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
Щ
Ћ6
 __inference__traced_save_2241958
file_prefixE
/read_disablecopyonread_teacher_layer_norm_gamma:F
0read_1_disablecopyonread_teacher_layer_norm_beta:J
0read_2_disablecopyonread_teacher_conv2d_1_kernel:<
.read_3_disablecopyonread_teacher_conv2d_1_bias:J
0read_4_disablecopyonread_teacher_conv2d_2_kernel:<
.read_5_disablecopyonread_teacher_conv2d_2_bias:B
/read_6_disablecopyonread_teacher_dense_1_kernel:	тP;
-read_7_disablecopyonread_teacher_dense_1_bias:PB
/read_8_disablecopyonread_teacher_dense_2_kernel:	Pт<
-read_9_disablecopyonread_teacher_dense_2_bias:	тJ
0read_10_disablecopyonread_techer_conv2d_3_kernel:<
.read_11_disablecopyonread_techer_conv2d_3_bias:K
1read_12_disablecopyonread_teacher_conv2d_4_kernel:=
/read_13_disablecopyonread_teacher_conv2d_4_bias:K
1read_14_disablecopyonread_teacher_conv2d_5_kernel:=
/read_15_disablecopyonread_teacher_conv2d_5_bias:-
#read_16_disablecopyonread_iteration:	 1
'read_17_disablecopyonread_learning_rate: O
9read_18_disablecopyonread_adam_m_teacher_layer_norm_gamma:O
9read_19_disablecopyonread_adam_v_teacher_layer_norm_gamma:N
8read_20_disablecopyonread_adam_m_teacher_layer_norm_beta:N
8read_21_disablecopyonread_adam_v_teacher_layer_norm_beta:R
8read_22_disablecopyonread_adam_m_teacher_conv2d_1_kernel:R
8read_23_disablecopyonread_adam_v_teacher_conv2d_1_kernel:D
6read_24_disablecopyonread_adam_m_teacher_conv2d_1_bias:D
6read_25_disablecopyonread_adam_v_teacher_conv2d_1_bias:R
8read_26_disablecopyonread_adam_m_teacher_conv2d_2_kernel:R
8read_27_disablecopyonread_adam_v_teacher_conv2d_2_kernel:D
6read_28_disablecopyonread_adam_m_teacher_conv2d_2_bias:D
6read_29_disablecopyonread_adam_v_teacher_conv2d_2_bias:J
7read_30_disablecopyonread_adam_m_teacher_dense_1_kernel:	тPJ
7read_31_disablecopyonread_adam_v_teacher_dense_1_kernel:	тPC
5read_32_disablecopyonread_adam_m_teacher_dense_1_bias:PC
5read_33_disablecopyonread_adam_v_teacher_dense_1_bias:PJ
7read_34_disablecopyonread_adam_m_teacher_dense_2_kernel:	PтJ
7read_35_disablecopyonread_adam_v_teacher_dense_2_kernel:	PтD
5read_36_disablecopyonread_adam_m_teacher_dense_2_bias:	тD
5read_37_disablecopyonread_adam_v_teacher_dense_2_bias:	тQ
7read_38_disablecopyonread_adam_m_techer_conv2d_3_kernel:Q
7read_39_disablecopyonread_adam_v_techer_conv2d_3_kernel:C
5read_40_disablecopyonread_adam_m_techer_conv2d_3_bias:C
5read_41_disablecopyonread_adam_v_techer_conv2d_3_bias:R
8read_42_disablecopyonread_adam_m_teacher_conv2d_4_kernel:R
8read_43_disablecopyonread_adam_v_teacher_conv2d_4_kernel:D
6read_44_disablecopyonread_adam_m_teacher_conv2d_4_bias:D
6read_45_disablecopyonread_adam_v_teacher_conv2d_4_bias:R
8read_46_disablecopyonread_adam_m_teacher_conv2d_5_kernel:R
8read_47_disablecopyonread_adam_v_teacher_conv2d_5_kernel:D
6read_48_disablecopyonread_adam_m_teacher_conv2d_5_bias:D
6read_49_disablecopyonread_adam_v_teacher_conv2d_5_bias:+
!read_50_disablecopyonread_total_2: +
!read_51_disablecopyonread_count_2: +
!read_52_disablecopyonread_total_1: +
!read_53_disablecopyonread_count_1: )
read_54_disablecopyonread_total: )
read_55_disablecopyonread_count: 
savev2_const
identity_113ЂMergeV2CheckpointsЂRead/DisableCopyOnReadЂRead/ReadVariableOpЂRead_1/DisableCopyOnReadЂRead_1/ReadVariableOpЂRead_10/DisableCopyOnReadЂRead_10/ReadVariableOpЂRead_11/DisableCopyOnReadЂRead_11/ReadVariableOpЂRead_12/DisableCopyOnReadЂRead_12/ReadVariableOpЂRead_13/DisableCopyOnReadЂRead_13/ReadVariableOpЂRead_14/DisableCopyOnReadЂRead_14/ReadVariableOpЂRead_15/DisableCopyOnReadЂRead_15/ReadVariableOpЂRead_16/DisableCopyOnReadЂRead_16/ReadVariableOpЂRead_17/DisableCopyOnReadЂRead_17/ReadVariableOpЂRead_18/DisableCopyOnReadЂRead_18/ReadVariableOpЂRead_19/DisableCopyOnReadЂRead_19/ReadVariableOpЂRead_2/DisableCopyOnReadЂRead_2/ReadVariableOpЂRead_20/DisableCopyOnReadЂRead_20/ReadVariableOpЂRead_21/DisableCopyOnReadЂRead_21/ReadVariableOpЂRead_22/DisableCopyOnReadЂRead_22/ReadVariableOpЂRead_23/DisableCopyOnReadЂRead_23/ReadVariableOpЂRead_24/DisableCopyOnReadЂRead_24/ReadVariableOpЂRead_25/DisableCopyOnReadЂRead_25/ReadVariableOpЂRead_26/DisableCopyOnReadЂRead_26/ReadVariableOpЂRead_27/DisableCopyOnReadЂRead_27/ReadVariableOpЂRead_28/DisableCopyOnReadЂRead_28/ReadVariableOpЂRead_29/DisableCopyOnReadЂRead_29/ReadVariableOpЂRead_3/DisableCopyOnReadЂRead_3/ReadVariableOpЂRead_30/DisableCopyOnReadЂRead_30/ReadVariableOpЂRead_31/DisableCopyOnReadЂRead_31/ReadVariableOpЂRead_32/DisableCopyOnReadЂRead_32/ReadVariableOpЂRead_33/DisableCopyOnReadЂRead_33/ReadVariableOpЂRead_34/DisableCopyOnReadЂRead_34/ReadVariableOpЂRead_35/DisableCopyOnReadЂRead_35/ReadVariableOpЂRead_36/DisableCopyOnReadЂRead_36/ReadVariableOpЂRead_37/DisableCopyOnReadЂRead_37/ReadVariableOpЂRead_38/DisableCopyOnReadЂRead_38/ReadVariableOpЂRead_39/DisableCopyOnReadЂRead_39/ReadVariableOpЂRead_4/DisableCopyOnReadЂRead_4/ReadVariableOpЂRead_40/DisableCopyOnReadЂRead_40/ReadVariableOpЂRead_41/DisableCopyOnReadЂRead_41/ReadVariableOpЂRead_42/DisableCopyOnReadЂRead_42/ReadVariableOpЂRead_43/DisableCopyOnReadЂRead_43/ReadVariableOpЂRead_44/DisableCopyOnReadЂRead_44/ReadVariableOpЂRead_45/DisableCopyOnReadЂRead_45/ReadVariableOpЂRead_46/DisableCopyOnReadЂRead_46/ReadVariableOpЂRead_47/DisableCopyOnReadЂRead_47/ReadVariableOpЂRead_48/DisableCopyOnReadЂRead_48/ReadVariableOpЂRead_49/DisableCopyOnReadЂRead_49/ReadVariableOpЂRead_5/DisableCopyOnReadЂRead_5/ReadVariableOpЂRead_50/DisableCopyOnReadЂRead_50/ReadVariableOpЂRead_51/DisableCopyOnReadЂRead_51/ReadVariableOpЂRead_52/DisableCopyOnReadЂRead_52/ReadVariableOpЂRead_53/DisableCopyOnReadЂRead_53/ReadVariableOpЂRead_54/DisableCopyOnReadЂRead_54/ReadVariableOpЂRead_55/DisableCopyOnReadЂRead_55/ReadVariableOpЂRead_6/DisableCopyOnReadЂRead_6/ReadVariableOpЂRead_7/DisableCopyOnReadЂRead_7/ReadVariableOpЂRead_8/DisableCopyOnReadЂRead_8/ReadVariableOpЂRead_9/DisableCopyOnReadЂRead_9/ReadVariableOpw
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
_temp/part
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
value	B : 
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 
Read/DisableCopyOnReadDisableCopyOnRead/read_disablecopyonread_teacher_layer_norm_gamma"/device:CPU:0*
_output_shapes
 Џ
Read/ReadVariableOpReadVariableOp/read_disablecopyonread_teacher_layer_norm_gamma^Read/DisableCopyOnRead"/device:CPU:0*"
_output_shapes
:*
dtype0m
IdentityIdentityRead/ReadVariableOp:value:0"/device:CPU:0*
T0*"
_output_shapes
:e

Identity_1IdentityIdentity:output:0"/device:CPU:0*
T0*"
_output_shapes
:
Read_1/DisableCopyOnReadDisableCopyOnRead0read_1_disablecopyonread_teacher_layer_norm_beta"/device:CPU:0*
_output_shapes
 Д
Read_1/ReadVariableOpReadVariableOp0read_1_disablecopyonread_teacher_layer_norm_beta^Read_1/DisableCopyOnRead"/device:CPU:0*"
_output_shapes
:*
dtype0q

Identity_2IdentityRead_1/ReadVariableOp:value:0"/device:CPU:0*
T0*"
_output_shapes
:g

Identity_3IdentityIdentity_2:output:0"/device:CPU:0*
T0*"
_output_shapes
:
Read_2/DisableCopyOnReadDisableCopyOnRead0read_2_disablecopyonread_teacher_conv2d_1_kernel"/device:CPU:0*
_output_shapes
 И
Read_2/ReadVariableOpReadVariableOp0read_2_disablecopyonread_teacher_conv2d_1_kernel^Read_2/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0u

Identity_4IdentityRead_2/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:k

Identity_5IdentityIdentity_4:output:0"/device:CPU:0*
T0*&
_output_shapes
:
Read_3/DisableCopyOnReadDisableCopyOnRead.read_3_disablecopyonread_teacher_conv2d_1_bias"/device:CPU:0*
_output_shapes
 Њ
Read_3/ReadVariableOpReadVariableOp.read_3_disablecopyonread_teacher_conv2d_1_bias^Read_3/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0i

Identity_6IdentityRead_3/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:_

Identity_7IdentityIdentity_6:output:0"/device:CPU:0*
T0*
_output_shapes
:
Read_4/DisableCopyOnReadDisableCopyOnRead0read_4_disablecopyonread_teacher_conv2d_2_kernel"/device:CPU:0*
_output_shapes
 И
Read_4/ReadVariableOpReadVariableOp0read_4_disablecopyonread_teacher_conv2d_2_kernel^Read_4/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0u

Identity_8IdentityRead_4/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:k

Identity_9IdentityIdentity_8:output:0"/device:CPU:0*
T0*&
_output_shapes
:
Read_5/DisableCopyOnReadDisableCopyOnRead.read_5_disablecopyonread_teacher_conv2d_2_bias"/device:CPU:0*
_output_shapes
 Њ
Read_5/ReadVariableOpReadVariableOp.read_5_disablecopyonread_teacher_conv2d_2_bias^Read_5/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0j
Identity_10IdentityRead_5/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_11IdentityIdentity_10:output:0"/device:CPU:0*
T0*
_output_shapes
:
Read_6/DisableCopyOnReadDisableCopyOnRead/read_6_disablecopyonread_teacher_dense_1_kernel"/device:CPU:0*
_output_shapes
 А
Read_6/ReadVariableOpReadVariableOp/read_6_disablecopyonread_teacher_dense_1_kernel^Read_6/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	тP*
dtype0o
Identity_12IdentityRead_6/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	тPf
Identity_13IdentityIdentity_12:output:0"/device:CPU:0*
T0*
_output_shapes
:	тP
Read_7/DisableCopyOnReadDisableCopyOnRead-read_7_disablecopyonread_teacher_dense_1_bias"/device:CPU:0*
_output_shapes
 Љ
Read_7/ReadVariableOpReadVariableOp-read_7_disablecopyonread_teacher_dense_1_bias^Read_7/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:P*
dtype0j
Identity_14IdentityRead_7/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:Pa
Identity_15IdentityIdentity_14:output:0"/device:CPU:0*
T0*
_output_shapes
:P
Read_8/DisableCopyOnReadDisableCopyOnRead/read_8_disablecopyonread_teacher_dense_2_kernel"/device:CPU:0*
_output_shapes
 А
Read_8/ReadVariableOpReadVariableOp/read_8_disablecopyonread_teacher_dense_2_kernel^Read_8/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	Pт*
dtype0o
Identity_16IdentityRead_8/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	Pтf
Identity_17IdentityIdentity_16:output:0"/device:CPU:0*
T0*
_output_shapes
:	Pт
Read_9/DisableCopyOnReadDisableCopyOnRead-read_9_disablecopyonread_teacher_dense_2_bias"/device:CPU:0*
_output_shapes
 Њ
Read_9/ReadVariableOpReadVariableOp-read_9_disablecopyonread_teacher_dense_2_bias^Read_9/DisableCopyOnRead"/device:CPU:0*
_output_shapes	
:т*
dtype0k
Identity_18IdentityRead_9/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes	
:тb
Identity_19IdentityIdentity_18:output:0"/device:CPU:0*
T0*
_output_shapes	
:т
Read_10/DisableCopyOnReadDisableCopyOnRead0read_10_disablecopyonread_techer_conv2d_3_kernel"/device:CPU:0*
_output_shapes
 К
Read_10/ReadVariableOpReadVariableOp0read_10_disablecopyonread_techer_conv2d_3_kernel^Read_10/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_20IdentityRead_10/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_21IdentityIdentity_20:output:0"/device:CPU:0*
T0*&
_output_shapes
:
Read_11/DisableCopyOnReadDisableCopyOnRead.read_11_disablecopyonread_techer_conv2d_3_bias"/device:CPU:0*
_output_shapes
 Ќ
Read_11/ReadVariableOpReadVariableOp.read_11_disablecopyonread_techer_conv2d_3_bias^Read_11/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_22IdentityRead_11/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_23IdentityIdentity_22:output:0"/device:CPU:0*
T0*
_output_shapes
:
Read_12/DisableCopyOnReadDisableCopyOnRead1read_12_disablecopyonread_teacher_conv2d_4_kernel"/device:CPU:0*
_output_shapes
 Л
Read_12/ReadVariableOpReadVariableOp1read_12_disablecopyonread_teacher_conv2d_4_kernel^Read_12/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_24IdentityRead_12/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_25IdentityIdentity_24:output:0"/device:CPU:0*
T0*&
_output_shapes
:
Read_13/DisableCopyOnReadDisableCopyOnRead/read_13_disablecopyonread_teacher_conv2d_4_bias"/device:CPU:0*
_output_shapes
 ­
Read_13/ReadVariableOpReadVariableOp/read_13_disablecopyonread_teacher_conv2d_4_bias^Read_13/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_26IdentityRead_13/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_27IdentityIdentity_26:output:0"/device:CPU:0*
T0*
_output_shapes
:
Read_14/DisableCopyOnReadDisableCopyOnRead1read_14_disablecopyonread_teacher_conv2d_5_kernel"/device:CPU:0*
_output_shapes
 Л
Read_14/ReadVariableOpReadVariableOp1read_14_disablecopyonread_teacher_conv2d_5_kernel^Read_14/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_28IdentityRead_14/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_29IdentityIdentity_28:output:0"/device:CPU:0*
T0*&
_output_shapes
:
Read_15/DisableCopyOnReadDisableCopyOnRead/read_15_disablecopyonread_teacher_conv2d_5_bias"/device:CPU:0*
_output_shapes
 ­
Read_15/ReadVariableOpReadVariableOp/read_15_disablecopyonread_teacher_conv2d_5_bias^Read_15/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_30IdentityRead_15/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_31IdentityIdentity_30:output:0"/device:CPU:0*
T0*
_output_shapes
:x
Read_16/DisableCopyOnReadDisableCopyOnRead#read_16_disablecopyonread_iteration"/device:CPU:0*
_output_shapes
 
Read_16/ReadVariableOpReadVariableOp#read_16_disablecopyonread_iteration^Read_16/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0	g
Identity_32IdentityRead_16/ReadVariableOp:value:0"/device:CPU:0*
T0	*
_output_shapes
: ]
Identity_33IdentityIdentity_32:output:0"/device:CPU:0*
T0	*
_output_shapes
: |
Read_17/DisableCopyOnReadDisableCopyOnRead'read_17_disablecopyonread_learning_rate"/device:CPU:0*
_output_shapes
 Ё
Read_17/ReadVariableOpReadVariableOp'read_17_disablecopyonread_learning_rate^Read_17/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0g
Identity_34IdentityRead_17/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: ]
Identity_35IdentityIdentity_34:output:0"/device:CPU:0*
T0*
_output_shapes
: 
Read_18/DisableCopyOnReadDisableCopyOnRead9read_18_disablecopyonread_adam_m_teacher_layer_norm_gamma"/device:CPU:0*
_output_shapes
 П
Read_18/ReadVariableOpReadVariableOp9read_18_disablecopyonread_adam_m_teacher_layer_norm_gamma^Read_18/DisableCopyOnRead"/device:CPU:0*"
_output_shapes
:*
dtype0s
Identity_36IdentityRead_18/ReadVariableOp:value:0"/device:CPU:0*
T0*"
_output_shapes
:i
Identity_37IdentityIdentity_36:output:0"/device:CPU:0*
T0*"
_output_shapes
:
Read_19/DisableCopyOnReadDisableCopyOnRead9read_19_disablecopyonread_adam_v_teacher_layer_norm_gamma"/device:CPU:0*
_output_shapes
 П
Read_19/ReadVariableOpReadVariableOp9read_19_disablecopyonread_adam_v_teacher_layer_norm_gamma^Read_19/DisableCopyOnRead"/device:CPU:0*"
_output_shapes
:*
dtype0s
Identity_38IdentityRead_19/ReadVariableOp:value:0"/device:CPU:0*
T0*"
_output_shapes
:i
Identity_39IdentityIdentity_38:output:0"/device:CPU:0*
T0*"
_output_shapes
:
Read_20/DisableCopyOnReadDisableCopyOnRead8read_20_disablecopyonread_adam_m_teacher_layer_norm_beta"/device:CPU:0*
_output_shapes
 О
Read_20/ReadVariableOpReadVariableOp8read_20_disablecopyonread_adam_m_teacher_layer_norm_beta^Read_20/DisableCopyOnRead"/device:CPU:0*"
_output_shapes
:*
dtype0s
Identity_40IdentityRead_20/ReadVariableOp:value:0"/device:CPU:0*
T0*"
_output_shapes
:i
Identity_41IdentityIdentity_40:output:0"/device:CPU:0*
T0*"
_output_shapes
:
Read_21/DisableCopyOnReadDisableCopyOnRead8read_21_disablecopyonread_adam_v_teacher_layer_norm_beta"/device:CPU:0*
_output_shapes
 О
Read_21/ReadVariableOpReadVariableOp8read_21_disablecopyonread_adam_v_teacher_layer_norm_beta^Read_21/DisableCopyOnRead"/device:CPU:0*"
_output_shapes
:*
dtype0s
Identity_42IdentityRead_21/ReadVariableOp:value:0"/device:CPU:0*
T0*"
_output_shapes
:i
Identity_43IdentityIdentity_42:output:0"/device:CPU:0*
T0*"
_output_shapes
:
Read_22/DisableCopyOnReadDisableCopyOnRead8read_22_disablecopyonread_adam_m_teacher_conv2d_1_kernel"/device:CPU:0*
_output_shapes
 Т
Read_22/ReadVariableOpReadVariableOp8read_22_disablecopyonread_adam_m_teacher_conv2d_1_kernel^Read_22/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_44IdentityRead_22/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_45IdentityIdentity_44:output:0"/device:CPU:0*
T0*&
_output_shapes
:
Read_23/DisableCopyOnReadDisableCopyOnRead8read_23_disablecopyonread_adam_v_teacher_conv2d_1_kernel"/device:CPU:0*
_output_shapes
 Т
Read_23/ReadVariableOpReadVariableOp8read_23_disablecopyonread_adam_v_teacher_conv2d_1_kernel^Read_23/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_46IdentityRead_23/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_47IdentityIdentity_46:output:0"/device:CPU:0*
T0*&
_output_shapes
:
Read_24/DisableCopyOnReadDisableCopyOnRead6read_24_disablecopyonread_adam_m_teacher_conv2d_1_bias"/device:CPU:0*
_output_shapes
 Д
Read_24/ReadVariableOpReadVariableOp6read_24_disablecopyonread_adam_m_teacher_conv2d_1_bias^Read_24/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_48IdentityRead_24/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_49IdentityIdentity_48:output:0"/device:CPU:0*
T0*
_output_shapes
:
Read_25/DisableCopyOnReadDisableCopyOnRead6read_25_disablecopyonread_adam_v_teacher_conv2d_1_bias"/device:CPU:0*
_output_shapes
 Д
Read_25/ReadVariableOpReadVariableOp6read_25_disablecopyonread_adam_v_teacher_conv2d_1_bias^Read_25/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_50IdentityRead_25/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_51IdentityIdentity_50:output:0"/device:CPU:0*
T0*
_output_shapes
:
Read_26/DisableCopyOnReadDisableCopyOnRead8read_26_disablecopyonread_adam_m_teacher_conv2d_2_kernel"/device:CPU:0*
_output_shapes
 Т
Read_26/ReadVariableOpReadVariableOp8read_26_disablecopyonread_adam_m_teacher_conv2d_2_kernel^Read_26/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_52IdentityRead_26/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_53IdentityIdentity_52:output:0"/device:CPU:0*
T0*&
_output_shapes
:
Read_27/DisableCopyOnReadDisableCopyOnRead8read_27_disablecopyonread_adam_v_teacher_conv2d_2_kernel"/device:CPU:0*
_output_shapes
 Т
Read_27/ReadVariableOpReadVariableOp8read_27_disablecopyonread_adam_v_teacher_conv2d_2_kernel^Read_27/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_54IdentityRead_27/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_55IdentityIdentity_54:output:0"/device:CPU:0*
T0*&
_output_shapes
:
Read_28/DisableCopyOnReadDisableCopyOnRead6read_28_disablecopyonread_adam_m_teacher_conv2d_2_bias"/device:CPU:0*
_output_shapes
 Д
Read_28/ReadVariableOpReadVariableOp6read_28_disablecopyonread_adam_m_teacher_conv2d_2_bias^Read_28/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_56IdentityRead_28/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_57IdentityIdentity_56:output:0"/device:CPU:0*
T0*
_output_shapes
:
Read_29/DisableCopyOnReadDisableCopyOnRead6read_29_disablecopyonread_adam_v_teacher_conv2d_2_bias"/device:CPU:0*
_output_shapes
 Д
Read_29/ReadVariableOpReadVariableOp6read_29_disablecopyonread_adam_v_teacher_conv2d_2_bias^Read_29/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_58IdentityRead_29/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_59IdentityIdentity_58:output:0"/device:CPU:0*
T0*
_output_shapes
:
Read_30/DisableCopyOnReadDisableCopyOnRead7read_30_disablecopyonread_adam_m_teacher_dense_1_kernel"/device:CPU:0*
_output_shapes
 К
Read_30/ReadVariableOpReadVariableOp7read_30_disablecopyonread_adam_m_teacher_dense_1_kernel^Read_30/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	тP*
dtype0p
Identity_60IdentityRead_30/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	тPf
Identity_61IdentityIdentity_60:output:0"/device:CPU:0*
T0*
_output_shapes
:	тP
Read_31/DisableCopyOnReadDisableCopyOnRead7read_31_disablecopyonread_adam_v_teacher_dense_1_kernel"/device:CPU:0*
_output_shapes
 К
Read_31/ReadVariableOpReadVariableOp7read_31_disablecopyonread_adam_v_teacher_dense_1_kernel^Read_31/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	тP*
dtype0p
Identity_62IdentityRead_31/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	тPf
Identity_63IdentityIdentity_62:output:0"/device:CPU:0*
T0*
_output_shapes
:	тP
Read_32/DisableCopyOnReadDisableCopyOnRead5read_32_disablecopyonread_adam_m_teacher_dense_1_bias"/device:CPU:0*
_output_shapes
 Г
Read_32/ReadVariableOpReadVariableOp5read_32_disablecopyonread_adam_m_teacher_dense_1_bias^Read_32/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:P*
dtype0k
Identity_64IdentityRead_32/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:Pa
Identity_65IdentityIdentity_64:output:0"/device:CPU:0*
T0*
_output_shapes
:P
Read_33/DisableCopyOnReadDisableCopyOnRead5read_33_disablecopyonread_adam_v_teacher_dense_1_bias"/device:CPU:0*
_output_shapes
 Г
Read_33/ReadVariableOpReadVariableOp5read_33_disablecopyonread_adam_v_teacher_dense_1_bias^Read_33/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:P*
dtype0k
Identity_66IdentityRead_33/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:Pa
Identity_67IdentityIdentity_66:output:0"/device:CPU:0*
T0*
_output_shapes
:P
Read_34/DisableCopyOnReadDisableCopyOnRead7read_34_disablecopyonread_adam_m_teacher_dense_2_kernel"/device:CPU:0*
_output_shapes
 К
Read_34/ReadVariableOpReadVariableOp7read_34_disablecopyonread_adam_m_teacher_dense_2_kernel^Read_34/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	Pт*
dtype0p
Identity_68IdentityRead_34/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	Pтf
Identity_69IdentityIdentity_68:output:0"/device:CPU:0*
T0*
_output_shapes
:	Pт
Read_35/DisableCopyOnReadDisableCopyOnRead7read_35_disablecopyonread_adam_v_teacher_dense_2_kernel"/device:CPU:0*
_output_shapes
 К
Read_35/ReadVariableOpReadVariableOp7read_35_disablecopyonread_adam_v_teacher_dense_2_kernel^Read_35/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	Pт*
dtype0p
Identity_70IdentityRead_35/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	Pтf
Identity_71IdentityIdentity_70:output:0"/device:CPU:0*
T0*
_output_shapes
:	Pт
Read_36/DisableCopyOnReadDisableCopyOnRead5read_36_disablecopyonread_adam_m_teacher_dense_2_bias"/device:CPU:0*
_output_shapes
 Д
Read_36/ReadVariableOpReadVariableOp5read_36_disablecopyonread_adam_m_teacher_dense_2_bias^Read_36/DisableCopyOnRead"/device:CPU:0*
_output_shapes	
:т*
dtype0l
Identity_72IdentityRead_36/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes	
:тb
Identity_73IdentityIdentity_72:output:0"/device:CPU:0*
T0*
_output_shapes	
:т
Read_37/DisableCopyOnReadDisableCopyOnRead5read_37_disablecopyonread_adam_v_teacher_dense_2_bias"/device:CPU:0*
_output_shapes
 Д
Read_37/ReadVariableOpReadVariableOp5read_37_disablecopyonread_adam_v_teacher_dense_2_bias^Read_37/DisableCopyOnRead"/device:CPU:0*
_output_shapes	
:т*
dtype0l
Identity_74IdentityRead_37/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes	
:тb
Identity_75IdentityIdentity_74:output:0"/device:CPU:0*
T0*
_output_shapes	
:т
Read_38/DisableCopyOnReadDisableCopyOnRead7read_38_disablecopyonread_adam_m_techer_conv2d_3_kernel"/device:CPU:0*
_output_shapes
 С
Read_38/ReadVariableOpReadVariableOp7read_38_disablecopyonread_adam_m_techer_conv2d_3_kernel^Read_38/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_76IdentityRead_38/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_77IdentityIdentity_76:output:0"/device:CPU:0*
T0*&
_output_shapes
:
Read_39/DisableCopyOnReadDisableCopyOnRead7read_39_disablecopyonread_adam_v_techer_conv2d_3_kernel"/device:CPU:0*
_output_shapes
 С
Read_39/ReadVariableOpReadVariableOp7read_39_disablecopyonread_adam_v_techer_conv2d_3_kernel^Read_39/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_78IdentityRead_39/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_79IdentityIdentity_78:output:0"/device:CPU:0*
T0*&
_output_shapes
:
Read_40/DisableCopyOnReadDisableCopyOnRead5read_40_disablecopyonread_adam_m_techer_conv2d_3_bias"/device:CPU:0*
_output_shapes
 Г
Read_40/ReadVariableOpReadVariableOp5read_40_disablecopyonread_adam_m_techer_conv2d_3_bias^Read_40/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_80IdentityRead_40/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_81IdentityIdentity_80:output:0"/device:CPU:0*
T0*
_output_shapes
:
Read_41/DisableCopyOnReadDisableCopyOnRead5read_41_disablecopyonread_adam_v_techer_conv2d_3_bias"/device:CPU:0*
_output_shapes
 Г
Read_41/ReadVariableOpReadVariableOp5read_41_disablecopyonread_adam_v_techer_conv2d_3_bias^Read_41/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_82IdentityRead_41/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_83IdentityIdentity_82:output:0"/device:CPU:0*
T0*
_output_shapes
:
Read_42/DisableCopyOnReadDisableCopyOnRead8read_42_disablecopyonread_adam_m_teacher_conv2d_4_kernel"/device:CPU:0*
_output_shapes
 Т
Read_42/ReadVariableOpReadVariableOp8read_42_disablecopyonread_adam_m_teacher_conv2d_4_kernel^Read_42/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_84IdentityRead_42/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_85IdentityIdentity_84:output:0"/device:CPU:0*
T0*&
_output_shapes
:
Read_43/DisableCopyOnReadDisableCopyOnRead8read_43_disablecopyonread_adam_v_teacher_conv2d_4_kernel"/device:CPU:0*
_output_shapes
 Т
Read_43/ReadVariableOpReadVariableOp8read_43_disablecopyonread_adam_v_teacher_conv2d_4_kernel^Read_43/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_86IdentityRead_43/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_87IdentityIdentity_86:output:0"/device:CPU:0*
T0*&
_output_shapes
:
Read_44/DisableCopyOnReadDisableCopyOnRead6read_44_disablecopyonread_adam_m_teacher_conv2d_4_bias"/device:CPU:0*
_output_shapes
 Д
Read_44/ReadVariableOpReadVariableOp6read_44_disablecopyonread_adam_m_teacher_conv2d_4_bias^Read_44/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_88IdentityRead_44/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_89IdentityIdentity_88:output:0"/device:CPU:0*
T0*
_output_shapes
:
Read_45/DisableCopyOnReadDisableCopyOnRead6read_45_disablecopyonread_adam_v_teacher_conv2d_4_bias"/device:CPU:0*
_output_shapes
 Д
Read_45/ReadVariableOpReadVariableOp6read_45_disablecopyonread_adam_v_teacher_conv2d_4_bias^Read_45/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_90IdentityRead_45/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_91IdentityIdentity_90:output:0"/device:CPU:0*
T0*
_output_shapes
:
Read_46/DisableCopyOnReadDisableCopyOnRead8read_46_disablecopyonread_adam_m_teacher_conv2d_5_kernel"/device:CPU:0*
_output_shapes
 Т
Read_46/ReadVariableOpReadVariableOp8read_46_disablecopyonread_adam_m_teacher_conv2d_5_kernel^Read_46/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_92IdentityRead_46/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_93IdentityIdentity_92:output:0"/device:CPU:0*
T0*&
_output_shapes
:
Read_47/DisableCopyOnReadDisableCopyOnRead8read_47_disablecopyonread_adam_v_teacher_conv2d_5_kernel"/device:CPU:0*
_output_shapes
 Т
Read_47/ReadVariableOpReadVariableOp8read_47_disablecopyonread_adam_v_teacher_conv2d_5_kernel^Read_47/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:*
dtype0w
Identity_94IdentityRead_47/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:m
Identity_95IdentityIdentity_94:output:0"/device:CPU:0*
T0*&
_output_shapes
:
Read_48/DisableCopyOnReadDisableCopyOnRead6read_48_disablecopyonread_adam_m_teacher_conv2d_5_bias"/device:CPU:0*
_output_shapes
 Д
Read_48/ReadVariableOpReadVariableOp6read_48_disablecopyonread_adam_m_teacher_conv2d_5_bias^Read_48/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_96IdentityRead_48/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_97IdentityIdentity_96:output:0"/device:CPU:0*
T0*
_output_shapes
:
Read_49/DisableCopyOnReadDisableCopyOnRead6read_49_disablecopyonread_adam_v_teacher_conv2d_5_bias"/device:CPU:0*
_output_shapes
 Д
Read_49/ReadVariableOpReadVariableOp6read_49_disablecopyonread_adam_v_teacher_conv2d_5_bias^Read_49/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_98IdentityRead_49/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_99IdentityIdentity_98:output:0"/device:CPU:0*
T0*
_output_shapes
:v
Read_50/DisableCopyOnReadDisableCopyOnRead!read_50_disablecopyonread_total_2"/device:CPU:0*
_output_shapes
 
Read_50/ReadVariableOpReadVariableOp!read_50_disablecopyonread_total_2^Read_50/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0h
Identity_100IdentityRead_50/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: _
Identity_101IdentityIdentity_100:output:0"/device:CPU:0*
T0*
_output_shapes
: v
Read_51/DisableCopyOnReadDisableCopyOnRead!read_51_disablecopyonread_count_2"/device:CPU:0*
_output_shapes
 
Read_51/ReadVariableOpReadVariableOp!read_51_disablecopyonread_count_2^Read_51/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0h
Identity_102IdentityRead_51/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: _
Identity_103IdentityIdentity_102:output:0"/device:CPU:0*
T0*
_output_shapes
: v
Read_52/DisableCopyOnReadDisableCopyOnRead!read_52_disablecopyonread_total_1"/device:CPU:0*
_output_shapes
 
Read_52/ReadVariableOpReadVariableOp!read_52_disablecopyonread_total_1^Read_52/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0h
Identity_104IdentityRead_52/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: _
Identity_105IdentityIdentity_104:output:0"/device:CPU:0*
T0*
_output_shapes
: v
Read_53/DisableCopyOnReadDisableCopyOnRead!read_53_disablecopyonread_count_1"/device:CPU:0*
_output_shapes
 
Read_53/ReadVariableOpReadVariableOp!read_53_disablecopyonread_count_1^Read_53/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0h
Identity_106IdentityRead_53/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: _
Identity_107IdentityIdentity_106:output:0"/device:CPU:0*
T0*
_output_shapes
: t
Read_54/DisableCopyOnReadDisableCopyOnReadread_54_disablecopyonread_total"/device:CPU:0*
_output_shapes
 
Read_54/ReadVariableOpReadVariableOpread_54_disablecopyonread_total^Read_54/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0h
Identity_108IdentityRead_54/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: _
Identity_109IdentityIdentity_108:output:0"/device:CPU:0*
T0*
_output_shapes
: t
Read_55/DisableCopyOnReadDisableCopyOnReadread_55_disablecopyonread_count"/device:CPU:0*
_output_shapes
 
Read_55/ReadVariableOpReadVariableOpread_55_disablecopyonread_count^Read_55/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0h
Identity_110IdentityRead_55/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: _
Identity_111IdentityIdentity_110:output:0"/device:CPU:0*
T0*
_output_shapes
: 
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:9*
dtype0*Ф
valueКBЗ9B5layer_with_weights-0/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/beta/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-7/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-7/bias/.ATTRIBUTES/VARIABLE_VALUEB0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/11/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/12/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/13/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/14/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/15/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/16/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/17/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/18/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/19/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/20/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/21/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/22/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/23/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/24/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/25/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/26/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/27/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/28/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/29/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/30/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/31/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/32/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/2/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/2/count/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPHр
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:9*
dtype0*
value|Bz9B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B с
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0Identity_1:output:0Identity_3:output:0Identity_5:output:0Identity_7:output:0Identity_9:output:0Identity_11:output:0Identity_13:output:0Identity_15:output:0Identity_17:output:0Identity_19:output:0Identity_21:output:0Identity_23:output:0Identity_25:output:0Identity_27:output:0Identity_29:output:0Identity_31:output:0Identity_33:output:0Identity_35:output:0Identity_37:output:0Identity_39:output:0Identity_41:output:0Identity_43:output:0Identity_45:output:0Identity_47:output:0Identity_49:output:0Identity_51:output:0Identity_53:output:0Identity_55:output:0Identity_57:output:0Identity_59:output:0Identity_61:output:0Identity_63:output:0Identity_65:output:0Identity_67:output:0Identity_69:output:0Identity_71:output:0Identity_73:output:0Identity_75:output:0Identity_77:output:0Identity_79:output:0Identity_81:output:0Identity_83:output:0Identity_85:output:0Identity_87:output:0Identity_89:output:0Identity_91:output:0Identity_93:output:0Identity_95:output:0Identity_97:output:0Identity_99:output:0Identity_101:output:0Identity_103:output:0Identity_105:output:0Identity_107:output:0Identity_109:output:0Identity_111:output:0savev2_const"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *G
dtypes=
;29	
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:Г
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 j
Identity_112Identityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: W
Identity_113IdentityIdentity_112:output:0^NoOp*
T0*
_output_shapes
: л
NoOpNoOp^MergeV2Checkpoints^Read/DisableCopyOnRead^Read/ReadVariableOp^Read_1/DisableCopyOnRead^Read_1/ReadVariableOp^Read_10/DisableCopyOnRead^Read_10/ReadVariableOp^Read_11/DisableCopyOnRead^Read_11/ReadVariableOp^Read_12/DisableCopyOnRead^Read_12/ReadVariableOp^Read_13/DisableCopyOnRead^Read_13/ReadVariableOp^Read_14/DisableCopyOnRead^Read_14/ReadVariableOp^Read_15/DisableCopyOnRead^Read_15/ReadVariableOp^Read_16/DisableCopyOnRead^Read_16/ReadVariableOp^Read_17/DisableCopyOnRead^Read_17/ReadVariableOp^Read_18/DisableCopyOnRead^Read_18/ReadVariableOp^Read_19/DisableCopyOnRead^Read_19/ReadVariableOp^Read_2/DisableCopyOnRead^Read_2/ReadVariableOp^Read_20/DisableCopyOnRead^Read_20/ReadVariableOp^Read_21/DisableCopyOnRead^Read_21/ReadVariableOp^Read_22/DisableCopyOnRead^Read_22/ReadVariableOp^Read_23/DisableCopyOnRead^Read_23/ReadVariableOp^Read_24/DisableCopyOnRead^Read_24/ReadVariableOp^Read_25/DisableCopyOnRead^Read_25/ReadVariableOp^Read_26/DisableCopyOnRead^Read_26/ReadVariableOp^Read_27/DisableCopyOnRead^Read_27/ReadVariableOp^Read_28/DisableCopyOnRead^Read_28/ReadVariableOp^Read_29/DisableCopyOnRead^Read_29/ReadVariableOp^Read_3/DisableCopyOnRead^Read_3/ReadVariableOp^Read_30/DisableCopyOnRead^Read_30/ReadVariableOp^Read_31/DisableCopyOnRead^Read_31/ReadVariableOp^Read_32/DisableCopyOnRead^Read_32/ReadVariableOp^Read_33/DisableCopyOnRead^Read_33/ReadVariableOp^Read_34/DisableCopyOnRead^Read_34/ReadVariableOp^Read_35/DisableCopyOnRead^Read_35/ReadVariableOp^Read_36/DisableCopyOnRead^Read_36/ReadVariableOp^Read_37/DisableCopyOnRead^Read_37/ReadVariableOp^Read_38/DisableCopyOnRead^Read_38/ReadVariableOp^Read_39/DisableCopyOnRead^Read_39/ReadVariableOp^Read_4/DisableCopyOnRead^Read_4/ReadVariableOp^Read_40/DisableCopyOnRead^Read_40/ReadVariableOp^Read_41/DisableCopyOnRead^Read_41/ReadVariableOp^Read_42/DisableCopyOnRead^Read_42/ReadVariableOp^Read_43/DisableCopyOnRead^Read_43/ReadVariableOp^Read_44/DisableCopyOnRead^Read_44/ReadVariableOp^Read_45/DisableCopyOnRead^Read_45/ReadVariableOp^Read_46/DisableCopyOnRead^Read_46/ReadVariableOp^Read_47/DisableCopyOnRead^Read_47/ReadVariableOp^Read_48/DisableCopyOnRead^Read_48/ReadVariableOp^Read_49/DisableCopyOnRead^Read_49/ReadVariableOp^Read_5/DisableCopyOnRead^Read_5/ReadVariableOp^Read_50/DisableCopyOnRead^Read_50/ReadVariableOp^Read_51/DisableCopyOnRead^Read_51/ReadVariableOp^Read_52/DisableCopyOnRead^Read_52/ReadVariableOp^Read_53/DisableCopyOnRead^Read_53/ReadVariableOp^Read_54/DisableCopyOnRead^Read_54/ReadVariableOp^Read_55/DisableCopyOnRead^Read_55/ReadVariableOp^Read_6/DisableCopyOnRead^Read_6/ReadVariableOp^Read_7/DisableCopyOnRead^Read_7/ReadVariableOp^Read_8/DisableCopyOnRead^Read_8/ReadVariableOp^Read_9/DisableCopyOnRead^Read_9/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "%
identity_113Identity_113:output:0*
_input_shapesv
t: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2(
MergeV2CheckpointsMergeV2Checkpoints20
Read/DisableCopyOnReadRead/DisableCopyOnRead2*
Read/ReadVariableOpRead/ReadVariableOp24
Read_1/DisableCopyOnReadRead_1/DisableCopyOnRead2.
Read_1/ReadVariableOpRead_1/ReadVariableOp26
Read_10/DisableCopyOnReadRead_10/DisableCopyOnRead20
Read_10/ReadVariableOpRead_10/ReadVariableOp26
Read_11/DisableCopyOnReadRead_11/DisableCopyOnRead20
Read_11/ReadVariableOpRead_11/ReadVariableOp26
Read_12/DisableCopyOnReadRead_12/DisableCopyOnRead20
Read_12/ReadVariableOpRead_12/ReadVariableOp26
Read_13/DisableCopyOnReadRead_13/DisableCopyOnRead20
Read_13/ReadVariableOpRead_13/ReadVariableOp26
Read_14/DisableCopyOnReadRead_14/DisableCopyOnRead20
Read_14/ReadVariableOpRead_14/ReadVariableOp26
Read_15/DisableCopyOnReadRead_15/DisableCopyOnRead20
Read_15/ReadVariableOpRead_15/ReadVariableOp26
Read_16/DisableCopyOnReadRead_16/DisableCopyOnRead20
Read_16/ReadVariableOpRead_16/ReadVariableOp26
Read_17/DisableCopyOnReadRead_17/DisableCopyOnRead20
Read_17/ReadVariableOpRead_17/ReadVariableOp26
Read_18/DisableCopyOnReadRead_18/DisableCopyOnRead20
Read_18/ReadVariableOpRead_18/ReadVariableOp26
Read_19/DisableCopyOnReadRead_19/DisableCopyOnRead20
Read_19/ReadVariableOpRead_19/ReadVariableOp24
Read_2/DisableCopyOnReadRead_2/DisableCopyOnRead2.
Read_2/ReadVariableOpRead_2/ReadVariableOp26
Read_20/DisableCopyOnReadRead_20/DisableCopyOnRead20
Read_20/ReadVariableOpRead_20/ReadVariableOp26
Read_21/DisableCopyOnReadRead_21/DisableCopyOnRead20
Read_21/ReadVariableOpRead_21/ReadVariableOp26
Read_22/DisableCopyOnReadRead_22/DisableCopyOnRead20
Read_22/ReadVariableOpRead_22/ReadVariableOp26
Read_23/DisableCopyOnReadRead_23/DisableCopyOnRead20
Read_23/ReadVariableOpRead_23/ReadVariableOp26
Read_24/DisableCopyOnReadRead_24/DisableCopyOnRead20
Read_24/ReadVariableOpRead_24/ReadVariableOp26
Read_25/DisableCopyOnReadRead_25/DisableCopyOnRead20
Read_25/ReadVariableOpRead_25/ReadVariableOp26
Read_26/DisableCopyOnReadRead_26/DisableCopyOnRead20
Read_26/ReadVariableOpRead_26/ReadVariableOp26
Read_27/DisableCopyOnReadRead_27/DisableCopyOnRead20
Read_27/ReadVariableOpRead_27/ReadVariableOp26
Read_28/DisableCopyOnReadRead_28/DisableCopyOnRead20
Read_28/ReadVariableOpRead_28/ReadVariableOp26
Read_29/DisableCopyOnReadRead_29/DisableCopyOnRead20
Read_29/ReadVariableOpRead_29/ReadVariableOp24
Read_3/DisableCopyOnReadRead_3/DisableCopyOnRead2.
Read_3/ReadVariableOpRead_3/ReadVariableOp26
Read_30/DisableCopyOnReadRead_30/DisableCopyOnRead20
Read_30/ReadVariableOpRead_30/ReadVariableOp26
Read_31/DisableCopyOnReadRead_31/DisableCopyOnRead20
Read_31/ReadVariableOpRead_31/ReadVariableOp26
Read_32/DisableCopyOnReadRead_32/DisableCopyOnRead20
Read_32/ReadVariableOpRead_32/ReadVariableOp26
Read_33/DisableCopyOnReadRead_33/DisableCopyOnRead20
Read_33/ReadVariableOpRead_33/ReadVariableOp26
Read_34/DisableCopyOnReadRead_34/DisableCopyOnRead20
Read_34/ReadVariableOpRead_34/ReadVariableOp26
Read_35/DisableCopyOnReadRead_35/DisableCopyOnRead20
Read_35/ReadVariableOpRead_35/ReadVariableOp26
Read_36/DisableCopyOnReadRead_36/DisableCopyOnRead20
Read_36/ReadVariableOpRead_36/ReadVariableOp26
Read_37/DisableCopyOnReadRead_37/DisableCopyOnRead20
Read_37/ReadVariableOpRead_37/ReadVariableOp26
Read_38/DisableCopyOnReadRead_38/DisableCopyOnRead20
Read_38/ReadVariableOpRead_38/ReadVariableOp26
Read_39/DisableCopyOnReadRead_39/DisableCopyOnRead20
Read_39/ReadVariableOpRead_39/ReadVariableOp24
Read_4/DisableCopyOnReadRead_4/DisableCopyOnRead2.
Read_4/ReadVariableOpRead_4/ReadVariableOp26
Read_40/DisableCopyOnReadRead_40/DisableCopyOnRead20
Read_40/ReadVariableOpRead_40/ReadVariableOp26
Read_41/DisableCopyOnReadRead_41/DisableCopyOnRead20
Read_41/ReadVariableOpRead_41/ReadVariableOp26
Read_42/DisableCopyOnReadRead_42/DisableCopyOnRead20
Read_42/ReadVariableOpRead_42/ReadVariableOp26
Read_43/DisableCopyOnReadRead_43/DisableCopyOnRead20
Read_43/ReadVariableOpRead_43/ReadVariableOp26
Read_44/DisableCopyOnReadRead_44/DisableCopyOnRead20
Read_44/ReadVariableOpRead_44/ReadVariableOp26
Read_45/DisableCopyOnReadRead_45/DisableCopyOnRead20
Read_45/ReadVariableOpRead_45/ReadVariableOp26
Read_46/DisableCopyOnReadRead_46/DisableCopyOnRead20
Read_46/ReadVariableOpRead_46/ReadVariableOp26
Read_47/DisableCopyOnReadRead_47/DisableCopyOnRead20
Read_47/ReadVariableOpRead_47/ReadVariableOp26
Read_48/DisableCopyOnReadRead_48/DisableCopyOnRead20
Read_48/ReadVariableOpRead_48/ReadVariableOp26
Read_49/DisableCopyOnReadRead_49/DisableCopyOnRead20
Read_49/ReadVariableOpRead_49/ReadVariableOp24
Read_5/DisableCopyOnReadRead_5/DisableCopyOnRead2.
Read_5/ReadVariableOpRead_5/ReadVariableOp26
Read_50/DisableCopyOnReadRead_50/DisableCopyOnRead20
Read_50/ReadVariableOpRead_50/ReadVariableOp26
Read_51/DisableCopyOnReadRead_51/DisableCopyOnRead20
Read_51/ReadVariableOpRead_51/ReadVariableOp26
Read_52/DisableCopyOnReadRead_52/DisableCopyOnRead20
Read_52/ReadVariableOpRead_52/ReadVariableOp26
Read_53/DisableCopyOnReadRead_53/DisableCopyOnRead20
Read_53/ReadVariableOpRead_53/ReadVariableOp26
Read_54/DisableCopyOnReadRead_54/DisableCopyOnRead20
Read_54/ReadVariableOpRead_54/ReadVariableOp26
Read_55/DisableCopyOnReadRead_55/DisableCopyOnRead20
Read_55/ReadVariableOpRead_55/ReadVariableOp24
Read_6/DisableCopyOnReadRead_6/DisableCopyOnRead2.
Read_6/ReadVariableOpRead_6/ReadVariableOp24
Read_7/DisableCopyOnReadRead_7/DisableCopyOnRead2.
Read_7/ReadVariableOpRead_7/ReadVariableOp24
Read_8/DisableCopyOnReadRead_8/DisableCopyOnRead2.
Read_8/ReadVariableOpRead_8/ReadVariableOp24
Read_9/DisableCopyOnReadRead_9/DisableCopyOnRead2.
Read_9/ReadVariableOpRead_9/ReadVariableOp:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:9

_output_shapes
: 
У
O
3__inference_teacher_flatten_1_layer_call_fn_2241449

inputs
identityК
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџт* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *W
fRRP
N__inference_teacher_flatten_1_layer_call_and_return_conditional_losses_2240423a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:џџџџџџџџџт"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ	:W S
/
_output_shapes
:џџџџџџџџџ	
 
_user_specified_nameinputs


L__inference_techer_conv2d_3_layer_call_and_return_conditional_losses_2241543

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identityЂBiasAdd/ReadVariableOpЂConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ	*
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
:џџџџџџџџџ	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџ	w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:џџџџџџџџџ	
 
_user_specified_nameinputs
ѕ
m
Q__inference_teacher_activation_1_layer_call_and_return_conditional_losses_2241523

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:џџџџџџџџџ	b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:џџџџџџџџџ	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ	:W S
/
_output_shapes
:џџџџџџџџџ	
 
_user_specified_nameinputs
љ

M__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_2240510

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identityЂBiasAdd/ReadVariableOpЂConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ћ
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџj
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ{
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџw
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:i e
A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
У
O
3__inference_teacher_reshape_2_layer_call_fn_2241499

inputs
identityС
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *W
fRRP
N__inference_teacher_reshape_2_layer_call_and_return_conditional_losses_2240472h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:џџџџџџџџџт:P L
(
_output_shapes
:џџџџџџџџџт
 
_user_specified_nameinputs
ж	
џ
L__inference_teacher_dense_2_layer_call_and_return_conditional_losses_2240452

inputs1
matmul_readvariableop_resource:	Pт.
biasadd_readvariableop_resource:	т
identityЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	Pт*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџтs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:т*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџт`
IdentityIdentityBiasAdd:output:0^NoOp*
T0*(
_output_shapes
:џџџџџџџџџтw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџP: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:џџџџџџџџџP
 
_user_specified_nameinputs
Ё
ж
,__inference_sequential_layer_call_fn_2240568
teacher_input
unknown:
	unknown_0:#
	unknown_1:
	unknown_2:#
	unknown_3:
	unknown_4:
	unknown_5:	тP
	unknown_6:P
	unknown_7:	Pт
	unknown_8:	т#
	unknown_9:

unknown_10:$

unknown_11:

unknown_12:$

unknown_13:

unknown_14:
identityЂStatefulPartitionedCallИ
StatefulPartitionedCallStatefulPartitionedCallteacher_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ*2
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_sequential_layer_call_and_return_conditional_losses_2240533
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*G
_input_shapes6
4:џџџџџџџџџќ: : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
(
_output_shapes
:џџџџџџџџџќ
'
_user_specified_nameteacher_input


M__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_2241444

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identityЂBiasAdd/ReadVariableOpЂConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ	*
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
:џџџџџџџџџ	X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:џџџџџџџџџ	i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџ	w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ	: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:џџџџџџџџџ	
 
_user_specified_nameinputs

Я
,__inference_sequential_layer_call_fn_2241011

inputs
unknown:
	unknown_0:#
	unknown_1:
	unknown_2:#
	unknown_3:
	unknown_4:
	unknown_5:	тP
	unknown_6:P
	unknown_7:	Pт
	unknown_8:	т#
	unknown_9:

unknown_10:$

unknown_11:

unknown_12:$

unknown_13:

unknown_14:
identityЂStatefulPartitionedCallБ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ*2
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_sequential_layer_call_and_return_conditional_losses_2240533
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*G
_input_shapes6
4:џџџџџџџџџќ: : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
Х
Ї
2__inference_teacher_conv2d_4_layer_call_fn_2241569

inputs!
unknown:
	unknown_0:
identityЂStatefulPartitionedCallќ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_2240510
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ: : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
C
	
G__inference_sequential_layer_call_and_return_conditional_losses_2240883
teacher_input0
teacher_layer_norm_2240837:0
teacher_layer_norm_2240839:2
teacher_conv2d_1_2240842:&
teacher_conv2d_1_2240844:2
teacher_conv2d_2_2240848:&
teacher_conv2d_2_2240850:*
teacher_dense_1_2240854:	тP%
teacher_dense_1_2240856:P*
teacher_dense_2_2240859:	Pт&
teacher_dense_2_2240861:	т1
techer_conv2d_3_2240866:%
techer_conv2d_3_2240868:2
teacher_conv2d_4_2240872:&
teacher_conv2d_4_2240874:2
teacher_conv2d_5_2240877:&
teacher_conv2d_5_2240879:
identityЂ(teacher_conv2d_1/StatefulPartitionedCallЂ(teacher_conv2d_2/StatefulPartitionedCallЂ(teacher_conv2d_4/StatefulPartitionedCallЂ(teacher_conv2d_5/StatefulPartitionedCallЂ'teacher_dense_1/StatefulPartitionedCallЂ'teacher_dense_2/StatefulPartitionedCallЂ*teacher_layer_norm/StatefulPartitionedCallЂ'techer_conv2d_3/StatefulPartitionedCallж
teacher_reshape/PartitionedCallPartitionedCallteacher_input*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_teacher_reshape_layer_call_and_return_conditional_losses_2240318Х
*teacher_layer_norm/StatefulPartitionedCallStatefulPartitionedCall(teacher_reshape/PartitionedCall:output:0teacher_layer_norm_2240837teacher_layer_norm_2240839*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_teacher_layer_norm_layer_call_and_return_conditional_losses_2240376Ш
(teacher_conv2d_1/StatefulPartitionedCallStatefulPartitionedCall3teacher_layer_norm/StatefulPartitionedCall:output:0teacher_conv2d_1_2240842teacher_conv2d_1_2240844*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_2240393
%teacher_averagepool_1/PartitionedCallPartitionedCall1teacher_conv2d_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *[
fVRT
R__inference_teacher_averagepool_1_layer_call_and_return_conditional_losses_2240275У
(teacher_conv2d_2/StatefulPartitionedCallStatefulPartitionedCall.teacher_averagepool_1/PartitionedCall:output:0teacher_conv2d_2_2240848teacher_conv2d_2_2240850*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_2240411ї
!teacher_flatten_1/PartitionedCallPartitionedCall1teacher_conv2d_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџт* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *W
fRRP
N__inference_teacher_flatten_1_layer_call_and_return_conditional_losses_2240423Г
'teacher_dense_1/StatefulPartitionedCallStatefulPartitionedCall*teacher_flatten_1/PartitionedCall:output:0teacher_dense_1_2240854teacher_dense_1_2240856*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџP*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_teacher_dense_1_layer_call_and_return_conditional_losses_2240436К
'teacher_dense_2/StatefulPartitionedCallStatefulPartitionedCall0teacher_dense_1/StatefulPartitionedCall:output:0teacher_dense_2_2240859teacher_dense_2_2240861*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџт*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_teacher_dense_2_layer_call_and_return_conditional_losses_2240452§
!teacher_reshape_2/PartitionedCallPartitionedCall0teacher_dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *W
fRRP
N__inference_teacher_reshape_2_layer_call_and_return_conditional_losses_2240472§
$teacher_activation_1/PartitionedCallPartitionedCall*teacher_reshape_2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Z
fURS
Q__inference_teacher_activation_1_layer_call_and_return_conditional_losses_2240479О
'techer_conv2d_3/StatefulPartitionedCallStatefulPartitionedCall-teacher_activation_1/PartitionedCall:output:0techer_conv2d_3_2240866techer_conv2d_3_2240868*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_techer_conv2d_3_layer_call_and_return_conditional_losses_2240492
"teacher_upsample_1/PartitionedCallPartitionedCall0techer_conv2d_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_teacher_upsample_1_layer_call_and_return_conditional_losses_2240294в
(teacher_conv2d_4/StatefulPartitionedCallStatefulPartitionedCall+teacher_upsample_1/PartitionedCall:output:0teacher_conv2d_4_2240872teacher_conv2d_4_2240874*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_2240510и
(teacher_conv2d_5/StatefulPartitionedCallStatefulPartitionedCall1teacher_conv2d_4/StatefulPartitionedCall:output:0teacher_conv2d_5_2240877teacher_conv2d_5_2240879*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_teacher_conv2d_5_layer_call_and_return_conditional_losses_2240526
IdentityIdentity1teacher_conv2d_5/StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ
NoOpNoOp)^teacher_conv2d_1/StatefulPartitionedCall)^teacher_conv2d_2/StatefulPartitionedCall)^teacher_conv2d_4/StatefulPartitionedCall)^teacher_conv2d_5/StatefulPartitionedCall(^teacher_dense_1/StatefulPartitionedCall(^teacher_dense_2/StatefulPartitionedCall+^teacher_layer_norm/StatefulPartitionedCall(^techer_conv2d_3/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*G
_input_shapes6
4:џџџџџџџџџќ: : : : : : : : : : : : : : : : 2T
(teacher_conv2d_1/StatefulPartitionedCall(teacher_conv2d_1/StatefulPartitionedCall2T
(teacher_conv2d_2/StatefulPartitionedCall(teacher_conv2d_2/StatefulPartitionedCall2T
(teacher_conv2d_4/StatefulPartitionedCall(teacher_conv2d_4/StatefulPartitionedCall2T
(teacher_conv2d_5/StatefulPartitionedCall(teacher_conv2d_5/StatefulPartitionedCall2R
'teacher_dense_1/StatefulPartitionedCall'teacher_dense_1/StatefulPartitionedCall2R
'teacher_dense_2/StatefulPartitionedCall'teacher_dense_2/StatefulPartitionedCall2X
*teacher_layer_norm/StatefulPartitionedCall*teacher_layer_norm/StatefulPartitionedCall2R
'techer_conv2d_3/StatefulPartitionedCall'techer_conv2d_3/StatefulPartitionedCall:W S
(
_output_shapes
:џџџџџџџџџќ
'
_user_specified_nameteacher_input
а
j
N__inference_teacher_flatten_1_layer_call_and_return_conditional_losses_2240423

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџb  ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:џџџџџџџџџтY
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:џџџџџџџџџт"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ	:W S
/
_output_shapes
:џџџџџџџџџ	
 
_user_specified_nameinputs
ќ
Ї
2__inference_teacher_conv2d_1_layer_call_fn_2241403

inputs!
unknown:
	unknown_0:
identityЂStatefulPartitionedCallъ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_2240393w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ: : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
ѕ
m
Q__inference_teacher_activation_1_layer_call_and_return_conditional_losses_2240479

inputs
identityN
ReluReluinputs*
T0*/
_output_shapes
:џџџџџџџџџ	b
IdentityIdentityRelu:activations:0*
T0*/
_output_shapes
:џџџџџџџџџ	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ	:W S
/
_output_shapes
:џџџџџџџџџ	
 
_user_specified_nameinputs


M__inference_teacher_conv2d_5_layer_call_and_return_conditional_losses_2240526

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identityЂBiasAdd/ReadVariableOpЂConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ћ
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџy
IdentityIdentityBiasAdd:output:0^NoOp*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџw
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:i e
A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
.

O__inference_teacher_layer_norm_layer_call_and_return_conditional_losses_2241394

inputs7
!reshape_2_readvariableop_resource:7
!reshape_3_readvariableop_resource:
identityЂReshape_2/ReadVariableOpЂReshape_3/ReadVariableOpI
ShapeShapeinputs*
T0*
_output_shapes
::эЯ]
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
valueB:б
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/xConst*
_output_shapes
: *
dtype0*
value	B :S
mulMulmul/x:output:0strided_slice:output:0*
T0*
_output_shapes
: _
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:й
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskI
mul_1/xConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulmul_1/x:output:0strided_slice_1:output:0*
T0*
_output_shapes
: _
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:й
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskR
mul_2Mul	mul_1:z:0strided_slice_2:output:0*
T0*
_output_shapes
: _
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:й
strided_slice_3StridedSliceShape:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskR
mul_3Mul	mul_2:z:0strided_slice_3:output:0*
T0*
_output_shapes
: Q
Reshape/shape/0Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :
Reshape/shapePackReshape/shape/0:output:0mul:z:0	mul_3:z:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:m
ReshapeReshapeinputsReshape/shape:output:0*
T0*0
_output_shapes
:џџџџџџџџџќJ
ones/packedPackmul:z:0*
N*
T0*
_output_shapes
:O

ones/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?e
onesFillones/packed:output:0ones/Const:output:0*
T0*#
_output_shapes
:џџџџџџџџџK
zeros/packedPackmul:z:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    h
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*#
_output_shapes
:џџџџџџџџџH
ConstConst*
_output_shapes
: *
dtype0*
valueB J
Const_1Const*
_output_shapes
: *
dtype0*
valueB Є
FusedBatchNormV3FusedBatchNormV3Reshape:output:0ones:output:0zeros:output:0Const:output:0Const_1:output:0*
T0*
U0*p
_output_shapes^
\:џџџџџџџџџќ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:*
data_formatNCHW*
epsilon%o:t
	Reshape_1ReshapeFusedBatchNormV3:y:0Shape:output:0*
T0*/
_output_shapes
:џџџџџџџџџ~
Reshape_2/ReadVariableOpReadVariableOp!reshape_2_readvariableop_resource*"
_output_shapes
:*
dtype0h
Reshape_2/shapeConst*
_output_shapes
:*
dtype0*%
valueB"            
	Reshape_2Reshape Reshape_2/ReadVariableOp:value:0Reshape_2/shape:output:0*
T0*&
_output_shapes
:~
Reshape_3/ReadVariableOpReadVariableOp!reshape_3_readvariableop_resource*"
_output_shapes
:*
dtype0h
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*%
valueB"            
	Reshape_3Reshape Reshape_3/ReadVariableOp:value:0Reshape_3/shape:output:0*
T0*&
_output_shapes
:n
mul_4MulReshape_1:output:0Reshape_2:output:0*
T0*/
_output_shapes
:џџџџџџџџџe
addAddV2	mul_4:z:0Reshape_3:output:0*
T0*/
_output_shapes
:џџџџџџџџџ^
IdentityIdentityadd:z:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџ|
NoOpNoOp^Reshape_2/ReadVariableOp^Reshape_3/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ: : 24
Reshape_2/ReadVariableOpReshape_2/ReadVariableOp24
Reshape_3/ReadVariableOpReshape_3/ReadVariableOp:W S
/
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
C
	
G__inference_sequential_layer_call_and_return_conditional_losses_2240533

inputs0
teacher_layer_norm_2240377:0
teacher_layer_norm_2240379:2
teacher_conv2d_1_2240394:&
teacher_conv2d_1_2240396:2
teacher_conv2d_2_2240412:&
teacher_conv2d_2_2240414:*
teacher_dense_1_2240437:	тP%
teacher_dense_1_2240439:P*
teacher_dense_2_2240453:	Pт&
teacher_dense_2_2240455:	т1
techer_conv2d_3_2240493:%
techer_conv2d_3_2240495:2
teacher_conv2d_4_2240511:&
teacher_conv2d_4_2240513:2
teacher_conv2d_5_2240527:&
teacher_conv2d_5_2240529:
identityЂ(teacher_conv2d_1/StatefulPartitionedCallЂ(teacher_conv2d_2/StatefulPartitionedCallЂ(teacher_conv2d_4/StatefulPartitionedCallЂ(teacher_conv2d_5/StatefulPartitionedCallЂ'teacher_dense_1/StatefulPartitionedCallЂ'teacher_dense_2/StatefulPartitionedCallЂ*teacher_layer_norm/StatefulPartitionedCallЂ'techer_conv2d_3/StatefulPartitionedCallЯ
teacher_reshape/PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_teacher_reshape_layer_call_and_return_conditional_losses_2240318Х
*teacher_layer_norm/StatefulPartitionedCallStatefulPartitionedCall(teacher_reshape/PartitionedCall:output:0teacher_layer_norm_2240377teacher_layer_norm_2240379*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_teacher_layer_norm_layer_call_and_return_conditional_losses_2240376Ш
(teacher_conv2d_1/StatefulPartitionedCallStatefulPartitionedCall3teacher_layer_norm/StatefulPartitionedCall:output:0teacher_conv2d_1_2240394teacher_conv2d_1_2240396*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_2240393
%teacher_averagepool_1/PartitionedCallPartitionedCall1teacher_conv2d_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *[
fVRT
R__inference_teacher_averagepool_1_layer_call_and_return_conditional_losses_2240275У
(teacher_conv2d_2/StatefulPartitionedCallStatefulPartitionedCall.teacher_averagepool_1/PartitionedCall:output:0teacher_conv2d_2_2240412teacher_conv2d_2_2240414*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_2240411ї
!teacher_flatten_1/PartitionedCallPartitionedCall1teacher_conv2d_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџт* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *W
fRRP
N__inference_teacher_flatten_1_layer_call_and_return_conditional_losses_2240423Г
'teacher_dense_1/StatefulPartitionedCallStatefulPartitionedCall*teacher_flatten_1/PartitionedCall:output:0teacher_dense_1_2240437teacher_dense_1_2240439*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџP*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_teacher_dense_1_layer_call_and_return_conditional_losses_2240436К
'teacher_dense_2/StatefulPartitionedCallStatefulPartitionedCall0teacher_dense_1/StatefulPartitionedCall:output:0teacher_dense_2_2240453teacher_dense_2_2240455*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџт*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_teacher_dense_2_layer_call_and_return_conditional_losses_2240452§
!teacher_reshape_2/PartitionedCallPartitionedCall0teacher_dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *W
fRRP
N__inference_teacher_reshape_2_layer_call_and_return_conditional_losses_2240472§
$teacher_activation_1/PartitionedCallPartitionedCall*teacher_reshape_2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *Z
fURS
Q__inference_teacher_activation_1_layer_call_and_return_conditional_losses_2240479О
'techer_conv2d_3/StatefulPartitionedCallStatefulPartitionedCall-teacher_activation_1/PartitionedCall:output:0techer_conv2d_3_2240493techer_conv2d_3_2240495*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_techer_conv2d_3_layer_call_and_return_conditional_losses_2240492
"teacher_upsample_1/PartitionedCallPartitionedCall0techer_conv2d_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_teacher_upsample_1_layer_call_and_return_conditional_losses_2240294в
(teacher_conv2d_4/StatefulPartitionedCallStatefulPartitionedCall+teacher_upsample_1/PartitionedCall:output:0teacher_conv2d_4_2240511teacher_conv2d_4_2240513*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_2240510и
(teacher_conv2d_5/StatefulPartitionedCallStatefulPartitionedCall1teacher_conv2d_4/StatefulPartitionedCall:output:0teacher_conv2d_5_2240527teacher_conv2d_5_2240529*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_teacher_conv2d_5_layer_call_and_return_conditional_losses_2240526
IdentityIdentity1teacher_conv2d_5/StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ
NoOpNoOp)^teacher_conv2d_1/StatefulPartitionedCall)^teacher_conv2d_2/StatefulPartitionedCall)^teacher_conv2d_4/StatefulPartitionedCall)^teacher_conv2d_5/StatefulPartitionedCall(^teacher_dense_1/StatefulPartitionedCall(^teacher_dense_2/StatefulPartitionedCall+^teacher_layer_norm/StatefulPartitionedCall(^techer_conv2d_3/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*G
_input_shapes6
4:џџџџџџџџџќ: : : : : : : : : : : : : : : : 2T
(teacher_conv2d_1/StatefulPartitionedCall(teacher_conv2d_1/StatefulPartitionedCall2T
(teacher_conv2d_2/StatefulPartitionedCall(teacher_conv2d_2/StatefulPartitionedCall2T
(teacher_conv2d_4/StatefulPartitionedCall(teacher_conv2d_4/StatefulPartitionedCall2T
(teacher_conv2d_5/StatefulPartitionedCall(teacher_conv2d_5/StatefulPartitionedCall2R
'teacher_dense_1/StatefulPartitionedCall'teacher_dense_1/StatefulPartitionedCall2R
'teacher_dense_2/StatefulPartitionedCall'teacher_dense_2/StatefulPartitionedCall2X
*teacher_layer_norm/StatefulPartitionedCall*teacher_layer_norm/StatefulPartitionedCall2R
'techer_conv2d_3/StatefulPartitionedCall'techer_conv2d_3/StatefulPartitionedCall:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
Ѓ
n
R__inference_teacher_averagepool_1_layer_call_and_return_conditional_losses_2240275

inputs
identityЋ
AvgPoolAvgPoolinputs*
T0*J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ*
ksize
*
paddingVALID*
strides
{
IdentityIdentityAvgPool:output:0*
T0*J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ:r n
J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs

­
4__inference_teacher_layer_norm_layer_call_fn_2241338

inputs
unknown:
	unknown_0:
identityЂStatefulPartitionedCallь
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_teacher_layer_norm_layer_call_and_return_conditional_losses_2240376w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ: : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
П
M
1__inference_teacher_reshape_layer_call_fn_2241315

inputs
identityП
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *U
fPRN
L__inference_teacher_reshape_layer_call_and_return_conditional_losses_2240318h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:џџџџџџџџџќ:P L
(
_output_shapes
:џџџџџџџџџќ
 
_user_specified_nameinputs
ќ
Ї
2__inference_teacher_conv2d_2_layer_call_fn_2241433

inputs!
unknown:
	unknown_0:
identityЂStatefulPartitionedCallъ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ	*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_2240411w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџ	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ	: : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:џџџџџџџџџ	
 
_user_specified_nameinputs
Ѕ
k
O__inference_teacher_upsample_1_layer_call_and_return_conditional_losses_2240294

inputs
identityI
ShapeShapeinputs*
T0*
_output_shapes
::эЯ]
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
valueB:Н
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
:Е
resize/ResizeNearestNeighborResizeNearestNeighborinputsmul:z:0*
T0*J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ*
half_pixel_centers(
IdentityIdentity-resize/ResizeNearestNeighbor:resized_images:0*
T0*J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ:r n
J
_output_shapes8
6:4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
.

O__inference_teacher_layer_norm_layer_call_and_return_conditional_losses_2240376

inputs7
!reshape_2_readvariableop_resource:7
!reshape_3_readvariableop_resource:
identityЂReshape_2/ReadVariableOpЂReshape_3/ReadVariableOpI
ShapeShapeinputs*
T0*
_output_shapes
::эЯ]
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
valueB:б
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/xConst*
_output_shapes
: *
dtype0*
value	B :S
mulMulmul/x:output:0strided_slice:output:0*
T0*
_output_shapes
: _
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:й
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskI
mul_1/xConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulmul_1/x:output:0strided_slice_1:output:0*
T0*
_output_shapes
: _
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:й
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskR
mul_2Mul	mul_1:z:0strided_slice_2:output:0*
T0*
_output_shapes
: _
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:й
strided_slice_3StridedSliceShape:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskR
mul_3Mul	mul_2:z:0strided_slice_3:output:0*
T0*
_output_shapes
: Q
Reshape/shape/0Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :
Reshape/shapePackReshape/shape/0:output:0mul:z:0	mul_3:z:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:m
ReshapeReshapeinputsReshape/shape:output:0*
T0*0
_output_shapes
:џџџџџџџџџќJ
ones/packedPackmul:z:0*
N*
T0*
_output_shapes
:O

ones/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?e
onesFillones/packed:output:0ones/Const:output:0*
T0*#
_output_shapes
:џџџџџџџџџK
zeros/packedPackmul:z:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    h
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*#
_output_shapes
:џџџџџџџџџH
ConstConst*
_output_shapes
: *
dtype0*
valueB J
Const_1Const*
_output_shapes
: *
dtype0*
valueB Є
FusedBatchNormV3FusedBatchNormV3Reshape:output:0ones:output:0zeros:output:0Const:output:0Const_1:output:0*
T0*
U0*p
_output_shapes^
\:џџџџџџџџџќ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:џџџџџџџџџ:*
data_formatNCHW*
epsilon%o:t
	Reshape_1ReshapeFusedBatchNormV3:y:0Shape:output:0*
T0*/
_output_shapes
:џџџџџџџџџ~
Reshape_2/ReadVariableOpReadVariableOp!reshape_2_readvariableop_resource*"
_output_shapes
:*
dtype0h
Reshape_2/shapeConst*
_output_shapes
:*
dtype0*%
valueB"            
	Reshape_2Reshape Reshape_2/ReadVariableOp:value:0Reshape_2/shape:output:0*
T0*&
_output_shapes
:~
Reshape_3/ReadVariableOpReadVariableOp!reshape_3_readvariableop_resource*"
_output_shapes
:*
dtype0h
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*%
valueB"            
	Reshape_3Reshape Reshape_3/ReadVariableOp:value:0Reshape_3/shape:output:0*
T0*&
_output_shapes
:n
mul_4MulReshape_1:output:0Reshape_2:output:0*
T0*/
_output_shapes
:џџџџџџџџџe
addAddV2	mul_4:z:0Reshape_3:output:0*
T0*/
_output_shapes
:џџџџџџџџџ^
IdentityIdentityadd:z:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџ|
NoOpNoOp^Reshape_2/ReadVariableOp^Reshape_3/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ: : 24
Reshape_2/ReadVariableOpReshape_2/ReadVariableOp24
Reshape_3/ReadVariableOpReshape_3/ReadVariableOp:W S
/
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Х
Ї
2__inference_teacher_conv2d_5_layer_call_fn_2241589

inputs!
unknown:
	unknown_0:
identityЂStatefulPartitionedCallќ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_teacher_conv2d_5_layer_call_and_return_conditional_losses_2240526
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ: : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
а
Я
%__inference_signature_wrapper_2240974
teacher_input
unknown:
	unknown_0:#
	unknown_1:
	unknown_2:#
	unknown_3:
	unknown_4:
	unknown_5:	тP
	unknown_6:P
	unknown_7:	Pт
	unknown_8:	т#
	unknown_9:

unknown_10:$

unknown_11:

unknown_12:$

unknown_13:

unknown_14:
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallteacher_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:џџџџџџџџџ*2
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8 *+
f&R$
"__inference__wrapped_model_2240266w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*G
_input_shapes6
4:џџџџџџџџџќ: : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
(
_output_shapes
:џџџџџџџџџќ
'
_user_specified_nameteacher_input
љ

M__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_2241580

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identityЂBiasAdd/ReadVariableOpЂConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Ћ
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџj
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ{
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџw
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:i e
A
_output_shapes/
-:+џџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs"ѓ
L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*Ш
serving_defaultД
H
teacher_input7
serving_default_teacher_input:0џџџџџџџџџќL
teacher_conv2d_58
StatefulPartitionedCall:0џџџџџџџџџtensorflow/serving/predict:оЫ
№
layer-0
layer_with_weights-0
layer-1
layer_with_weights-1
layer-2
layer-3
layer_with_weights-2
layer-4
layer-5
layer_with_weights-3
layer-6
layer_with_weights-4
layer-7
	layer-8

layer-9
layer_with_weights-5
layer-10
layer-11
layer_with_weights-6
layer-12
layer_with_weights-7
layer-13
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures"
_tf_keras_sequential
Ѕ
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses"
_tf_keras_layer
Ф
	variables
trainable_variables
 regularization_losses
!	keras_api
"__call__
*#&call_and_return_all_conditional_losses
$axis
	%gamma
&beta"
_tf_keras_layer
н
'	variables
(trainable_variables
)regularization_losses
*	keras_api
+__call__
*,&call_and_return_all_conditional_losses

-kernel
.bias
 /_jit_compiled_convolution_op"
_tf_keras_layer
Ѕ
0	variables
1trainable_variables
2regularization_losses
3	keras_api
4__call__
*5&call_and_return_all_conditional_losses"
_tf_keras_layer
н
6	variables
7trainable_variables
8regularization_losses
9	keras_api
:__call__
*;&call_and_return_all_conditional_losses

<kernel
=bias
 >_jit_compiled_convolution_op"
_tf_keras_layer
Ѕ
?	variables
@trainable_variables
Aregularization_losses
B	keras_api
C__call__
*D&call_and_return_all_conditional_losses"
_tf_keras_layer
Л
E	variables
Ftrainable_variables
Gregularization_losses
H	keras_api
I__call__
*J&call_and_return_all_conditional_losses

Kkernel
Lbias"
_tf_keras_layer
Л
M	variables
Ntrainable_variables
Oregularization_losses
P	keras_api
Q__call__
*R&call_and_return_all_conditional_losses

Skernel
Tbias"
_tf_keras_layer
Ѕ
U	variables
Vtrainable_variables
Wregularization_losses
X	keras_api
Y__call__
*Z&call_and_return_all_conditional_losses"
_tf_keras_layer
Ѕ
[	variables
\trainable_variables
]regularization_losses
^	keras_api
___call__
*`&call_and_return_all_conditional_losses"
_tf_keras_layer
н
a	variables
btrainable_variables
cregularization_losses
d	keras_api
e__call__
*f&call_and_return_all_conditional_losses

gkernel
hbias
 i_jit_compiled_convolution_op"
_tf_keras_layer
Ѕ
j	variables
ktrainable_variables
lregularization_losses
m	keras_api
n__call__
*o&call_and_return_all_conditional_losses"
_tf_keras_layer
н
p	variables
qtrainable_variables
rregularization_losses
s	keras_api
t__call__
*u&call_and_return_all_conditional_losses

vkernel
wbias
 x_jit_compiled_convolution_op"
_tf_keras_layer
п
y	variables
ztrainable_variables
{regularization_losses
|	keras_api
}__call__
*~&call_and_return_all_conditional_losses

kernel
	bias
!_jit_compiled_convolution_op"
_tf_keras_layer

%0
&1
-2
.3
<4
=5
K6
L7
S8
T9
g10
h11
v12
w13
14
15"
trackable_list_wrapper

%0
&1
-2
.3
<4
=5
K6
L7
S8
T9
g10
h11
v12
w13
14
15"
trackable_list_wrapper
 "
trackable_list_wrapper
Я
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
у
trace_0
trace_1
trace_2
trace_32№
,__inference_sequential_layer_call_fn_2240568
,__inference_sequential_layer_call_fn_2241011
,__inference_sequential_layer_call_fn_2241048
,__inference_sequential_layer_call_fn_2240833Е
ЎВЊ
FullArgSpec)
args!
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЂ
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0ztrace_1ztrace_2ztrace_3
Я
trace_0
trace_1
trace_2
trace_32м
G__inference_sequential_layer_call_and_return_conditional_losses_2241179
G__inference_sequential_layer_call_and_return_conditional_losses_2241310
G__inference_sequential_layer_call_and_return_conditional_losses_2240883
G__inference_sequential_layer_call_and_return_conditional_losses_2240933Е
ЎВЊ
FullArgSpec)
args!
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЂ
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0ztrace_1ztrace_2ztrace_3
гBа
"__inference__wrapped_model_2240266teacher_input"
В
FullArgSpec
args 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
Ѓ

_variables
_iterations
_learning_rate
_index_dict

_momentums
_velocities
_update_step_xla"
experimentalOptimizer
-
serving_default"
signature_map
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
В
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
э
trace_02Ю
1__inference_teacher_reshape_layer_call_fn_2241315
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0

trace_02щ
L__inference_teacher_reshape_layer_call_and_return_conditional_losses_2241329
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0
.
%0
&1"
trackable_list_wrapper
.
%0
&1"
trackable_list_wrapper
 "
trackable_list_wrapper
В
non_trainable_variables
layers
 metrics
 Ёlayer_regularization_losses
Ђlayer_metrics
	variables
trainable_variables
 regularization_losses
"__call__
*#&call_and_return_all_conditional_losses
&#"call_and_return_conditional_losses"
_generic_user_object
№
Ѓtrace_02б
4__inference_teacher_layer_norm_layer_call_fn_2241338
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЃtrace_0

Єtrace_02ь
O__inference_teacher_layer_norm_layer_call_and_return_conditional_losses_2241394
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЄtrace_0
 "
trackable_list_wrapper
.:,2teacher_layer_norm/gamma
-:+2teacher_layer_norm/beta
.
-0
.1"
trackable_list_wrapper
.
-0
.1"
trackable_list_wrapper
 "
trackable_list_wrapper
В
Ѕnon_trainable_variables
Іlayers
Їmetrics
 Јlayer_regularization_losses
Љlayer_metrics
'	variables
(trainable_variables
)regularization_losses
+__call__
*,&call_and_return_all_conditional_losses
&,"call_and_return_conditional_losses"
_generic_user_object
ю
Њtrace_02Я
2__inference_teacher_conv2d_1_layer_call_fn_2241403
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЊtrace_0

Ћtrace_02ъ
M__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_2241414
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЋtrace_0
1:/2teacher_conv2d_1/kernel
#:!2teacher_conv2d_1/bias
Њ2ЇЄ
В
FullArgSpec
args
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
В
Ќnon_trainable_variables
­layers
Ўmetrics
 Џlayer_regularization_losses
Аlayer_metrics
0	variables
1trainable_variables
2regularization_losses
4__call__
*5&call_and_return_all_conditional_losses
&5"call_and_return_conditional_losses"
_generic_user_object
ѓ
Бtrace_02д
7__inference_teacher_averagepool_1_layer_call_fn_2241419
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zБtrace_0

Вtrace_02я
R__inference_teacher_averagepool_1_layer_call_and_return_conditional_losses_2241424
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zВtrace_0
.
<0
=1"
trackable_list_wrapper
.
<0
=1"
trackable_list_wrapper
 "
trackable_list_wrapper
В
Гnon_trainable_variables
Дlayers
Еmetrics
 Жlayer_regularization_losses
Зlayer_metrics
6	variables
7trainable_variables
8regularization_losses
:__call__
*;&call_and_return_all_conditional_losses
&;"call_and_return_conditional_losses"
_generic_user_object
ю
Иtrace_02Я
2__inference_teacher_conv2d_2_layer_call_fn_2241433
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zИtrace_0

Йtrace_02ъ
M__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_2241444
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЙtrace_0
1:/2teacher_conv2d_2/kernel
#:!2teacher_conv2d_2/bias
Њ2ЇЄ
В
FullArgSpec
args
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
В
Кnon_trainable_variables
Лlayers
Мmetrics
 Нlayer_regularization_losses
Оlayer_metrics
?	variables
@trainable_variables
Aregularization_losses
C__call__
*D&call_and_return_all_conditional_losses
&D"call_and_return_conditional_losses"
_generic_user_object
я
Пtrace_02а
3__inference_teacher_flatten_1_layer_call_fn_2241449
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zПtrace_0

Рtrace_02ы
N__inference_teacher_flatten_1_layer_call_and_return_conditional_losses_2241455
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zРtrace_0
.
K0
L1"
trackable_list_wrapper
.
K0
L1"
trackable_list_wrapper
 "
trackable_list_wrapper
В
Сnon_trainable_variables
Тlayers
Уmetrics
 Фlayer_regularization_losses
Хlayer_metrics
E	variables
Ftrainable_variables
Gregularization_losses
I__call__
*J&call_and_return_all_conditional_losses
&J"call_and_return_conditional_losses"
_generic_user_object
э
Цtrace_02Ю
1__inference_teacher_dense_1_layer_call_fn_2241464
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЦtrace_0

Чtrace_02щ
L__inference_teacher_dense_1_layer_call_and_return_conditional_losses_2241475
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЧtrace_0
):'	тP2teacher_dense_1/kernel
": P2teacher_dense_1/bias
.
S0
T1"
trackable_list_wrapper
.
S0
T1"
trackable_list_wrapper
 "
trackable_list_wrapper
В
Шnon_trainable_variables
Щlayers
Ъmetrics
 Ыlayer_regularization_losses
Ьlayer_metrics
M	variables
Ntrainable_variables
Oregularization_losses
Q__call__
*R&call_and_return_all_conditional_losses
&R"call_and_return_conditional_losses"
_generic_user_object
э
Эtrace_02Ю
1__inference_teacher_dense_2_layer_call_fn_2241484
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЭtrace_0

Юtrace_02щ
L__inference_teacher_dense_2_layer_call_and_return_conditional_losses_2241494
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЮtrace_0
):'	Pт2teacher_dense_2/kernel
#:!т2teacher_dense_2/bias
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
В
Яnon_trainable_variables
аlayers
бmetrics
 вlayer_regularization_losses
гlayer_metrics
U	variables
Vtrainable_variables
Wregularization_losses
Y__call__
*Z&call_and_return_all_conditional_losses
&Z"call_and_return_conditional_losses"
_generic_user_object
я
дtrace_02а
3__inference_teacher_reshape_2_layer_call_fn_2241499
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zдtrace_0

еtrace_02ы
N__inference_teacher_reshape_2_layer_call_and_return_conditional_losses_2241513
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zеtrace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
В
жnon_trainable_variables
зlayers
иmetrics
 йlayer_regularization_losses
кlayer_metrics
[	variables
\trainable_variables
]regularization_losses
___call__
*`&call_and_return_all_conditional_losses
&`"call_and_return_conditional_losses"
_generic_user_object
ђ
лtrace_02г
6__inference_teacher_activation_1_layer_call_fn_2241518
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zлtrace_0

мtrace_02ю
Q__inference_teacher_activation_1_layer_call_and_return_conditional_losses_2241523
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zмtrace_0
.
g0
h1"
trackable_list_wrapper
.
g0
h1"
trackable_list_wrapper
 "
trackable_list_wrapper
В
нnon_trainable_variables
оlayers
пmetrics
 рlayer_regularization_losses
сlayer_metrics
a	variables
btrainable_variables
cregularization_losses
e__call__
*f&call_and_return_all_conditional_losses
&f"call_and_return_conditional_losses"
_generic_user_object
э
тtrace_02Ю
1__inference_techer_conv2d_3_layer_call_fn_2241532
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zтtrace_0

уtrace_02щ
L__inference_techer_conv2d_3_layer_call_and_return_conditional_losses_2241543
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zуtrace_0
0:.2techer_conv2d_3/kernel
": 2techer_conv2d_3/bias
Њ2ЇЄ
В
FullArgSpec
args
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
В
фnon_trainable_variables
хlayers
цmetrics
 чlayer_regularization_losses
шlayer_metrics
j	variables
ktrainable_variables
lregularization_losses
n__call__
*o&call_and_return_all_conditional_losses
&o"call_and_return_conditional_losses"
_generic_user_object
№
щtrace_02б
4__inference_teacher_upsample_1_layer_call_fn_2241548
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zщtrace_0

ъtrace_02ь
O__inference_teacher_upsample_1_layer_call_and_return_conditional_losses_2241560
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zъtrace_0
.
v0
w1"
trackable_list_wrapper
.
v0
w1"
trackable_list_wrapper
 "
trackable_list_wrapper
В
ыnon_trainable_variables
ьlayers
эmetrics
 юlayer_regularization_losses
яlayer_metrics
p	variables
qtrainable_variables
rregularization_losses
t__call__
*u&call_and_return_all_conditional_losses
&u"call_and_return_conditional_losses"
_generic_user_object
ю
№trace_02Я
2__inference_teacher_conv2d_4_layer_call_fn_2241569
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 z№trace_0

ёtrace_02ъ
M__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_2241580
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zёtrace_0
1:/2teacher_conv2d_4/kernel
#:!2teacher_conv2d_4/bias
Њ2ЇЄ
В
FullArgSpec
args
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 0
/
0
1"
trackable_list_wrapper
/
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
В
ђnon_trainable_variables
ѓlayers
єmetrics
 ѕlayer_regularization_losses
іlayer_metrics
y	variables
ztrainable_variables
{regularization_losses
}__call__
*~&call_and_return_all_conditional_losses
&~"call_and_return_conditional_losses"
_generic_user_object
ю
їtrace_02Я
2__inference_teacher_conv2d_5_layer_call_fn_2241589
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zїtrace_0

јtrace_02ъ
M__inference_teacher_conv2d_5_layer_call_and_return_conditional_losses_2241599
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zјtrace_0
1:/2teacher_conv2d_5/kernel
#:!2teacher_conv2d_5/bias
Њ2ЇЄ
В
FullArgSpec
args
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 0
 "
trackable_list_wrapper

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
13"
trackable_list_wrapper
8
љ0
њ1
ћ2"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
њBї
,__inference_sequential_layer_call_fn_2240568teacher_input"Е
ЎВЊ
FullArgSpec)
args!
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЂ
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ѓB№
,__inference_sequential_layer_call_fn_2241011inputs"Е
ЎВЊ
FullArgSpec)
args!
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЂ
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ѓB№
,__inference_sequential_layer_call_fn_2241048inputs"Е
ЎВЊ
FullArgSpec)
args!
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЂ
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
њBї
,__inference_sequential_layer_call_fn_2240833teacher_input"Е
ЎВЊ
FullArgSpec)
args!
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЂ
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
G__inference_sequential_layer_call_and_return_conditional_losses_2241179inputs"Е
ЎВЊ
FullArgSpec)
args!
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЂ
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
G__inference_sequential_layer_call_and_return_conditional_losses_2241310inputs"Е
ЎВЊ
FullArgSpec)
args!
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЂ
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
G__inference_sequential_layer_call_and_return_conditional_losses_2240883teacher_input"Е
ЎВЊ
FullArgSpec)
args!
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЂ
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
G__inference_sequential_layer_call_and_return_conditional_losses_2240933teacher_input"Е
ЎВЊ
FullArgSpec)
args!
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЂ
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
П
0
ќ1
§2
ў3
џ4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32"
trackable_list_wrapper
:	 2	iteration
: 2learning_rate
 "
trackable_dict_wrapper
І
ќ0
ў1
2
3
4
5
6
7
8
9
10
11
12
13
14
15"
trackable_list_wrapper
І
§0
џ1
2
3
4
5
6
7
8
9
10
11
12
13
14
15"
trackable_list_wrapper
Е2ВЏ
ІВЂ
FullArgSpec*
args"

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 0
вBЯ
%__inference_signature_wrapper_2240974teacher_input"
В
FullArgSpec
args 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
лBи
1__inference_teacher_reshape_layer_call_fn_2241315inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
іBѓ
L__inference_teacher_reshape_layer_call_and_return_conditional_losses_2241329inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
оBл
4__inference_teacher_layer_norm_layer_call_fn_2241338inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
љBі
O__inference_teacher_layer_norm_layer_call_and_return_conditional_losses_2241394inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
мBй
2__inference_teacher_conv2d_1_layer_call_fn_2241403inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
їBє
M__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_2241414inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
сBо
7__inference_teacher_averagepool_1_layer_call_fn_2241419inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ќBљ
R__inference_teacher_averagepool_1_layer_call_and_return_conditional_losses_2241424inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
мBй
2__inference_teacher_conv2d_2_layer_call_fn_2241433inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
їBє
M__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_2241444inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
нBк
3__inference_teacher_flatten_1_layer_call_fn_2241449inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
јBѕ
N__inference_teacher_flatten_1_layer_call_and_return_conditional_losses_2241455inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
лBи
1__inference_teacher_dense_1_layer_call_fn_2241464inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
іBѓ
L__inference_teacher_dense_1_layer_call_and_return_conditional_losses_2241475inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
лBи
1__inference_teacher_dense_2_layer_call_fn_2241484inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
іBѓ
L__inference_teacher_dense_2_layer_call_and_return_conditional_losses_2241494inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
нBк
3__inference_teacher_reshape_2_layer_call_fn_2241499inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
јBѕ
N__inference_teacher_reshape_2_layer_call_and_return_conditional_losses_2241513inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
рBн
6__inference_teacher_activation_1_layer_call_fn_2241518inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ћBј
Q__inference_teacher_activation_1_layer_call_and_return_conditional_losses_2241523inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
лBи
1__inference_techer_conv2d_3_layer_call_fn_2241532inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
іBѓ
L__inference_techer_conv2d_3_layer_call_and_return_conditional_losses_2241543inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
оBл
4__inference_teacher_upsample_1_layer_call_fn_2241548inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
љBі
O__inference_teacher_upsample_1_layer_call_and_return_conditional_losses_2241560inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
мBй
2__inference_teacher_conv2d_4_layer_call_fn_2241569inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
їBє
M__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_2241580inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
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
мBй
2__inference_teacher_conv2d_5_layer_call_fn_2241589inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
їBє
M__inference_teacher_conv2d_5_layer_call_and_return_conditional_losses_2241599inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
R
	variables
	keras_api

total

count"
_tf_keras_metric
c
 	variables
Ё	keras_api

Ђtotal

Ѓcount
Є
_fn_kwargs"
_tf_keras_metric
c
Ѕ	variables
І	keras_api

Їtotal

Јcount
Љ
_fn_kwargs"
_tf_keras_metric
3:12Adam/m/teacher_layer_norm/gamma
3:12Adam/v/teacher_layer_norm/gamma
2:02Adam/m/teacher_layer_norm/beta
2:02Adam/v/teacher_layer_norm/beta
6:42Adam/m/teacher_conv2d_1/kernel
6:42Adam/v/teacher_conv2d_1/kernel
(:&2Adam/m/teacher_conv2d_1/bias
(:&2Adam/v/teacher_conv2d_1/bias
6:42Adam/m/teacher_conv2d_2/kernel
6:42Adam/v/teacher_conv2d_2/kernel
(:&2Adam/m/teacher_conv2d_2/bias
(:&2Adam/v/teacher_conv2d_2/bias
.:,	тP2Adam/m/teacher_dense_1/kernel
.:,	тP2Adam/v/teacher_dense_1/kernel
':%P2Adam/m/teacher_dense_1/bias
':%P2Adam/v/teacher_dense_1/bias
.:,	Pт2Adam/m/teacher_dense_2/kernel
.:,	Pт2Adam/v/teacher_dense_2/kernel
(:&т2Adam/m/teacher_dense_2/bias
(:&т2Adam/v/teacher_dense_2/bias
5:32Adam/m/techer_conv2d_3/kernel
5:32Adam/v/techer_conv2d_3/kernel
':%2Adam/m/techer_conv2d_3/bias
':%2Adam/v/techer_conv2d_3/bias
6:42Adam/m/teacher_conv2d_4/kernel
6:42Adam/v/teacher_conv2d_4/kernel
(:&2Adam/m/teacher_conv2d_4/bias
(:&2Adam/v/teacher_conv2d_4/bias
6:42Adam/m/teacher_conv2d_5/kernel
6:42Adam/v/teacher_conv2d_5/kernel
(:&2Adam/m/teacher_conv2d_5/bias
(:&2Adam/v/teacher_conv2d_5/bias
0
0
1"
trackable_list_wrapper
.
	variables"
_generic_user_object
:  (2total
:  (2count
0
Ђ0
Ѓ1"
trackable_list_wrapper
.
 	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
0
Ї0
Ј1"
trackable_list_wrapper
.
Ѕ	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapperР
"__inference__wrapped_model_2240266%&-.<=KLSTghvw7Ђ4
-Ђ*
(%
teacher_inputџџџџџџџџџќ
Њ "KЊH
F
teacher_conv2d_52/
teacher_conv2d_5џџџџџџџџџш
G__inference_sequential_layer_call_and_return_conditional_losses_2240883%&-.<=KLSTghvw?Ђ<
5Ђ2
(%
teacher_inputџџџџџџџџџќ
p 

 
Њ "FЂC
<9
tensor_0+џџџџџџџџџџџџџџџџџџџџџџџџџџџ
 ш
G__inference_sequential_layer_call_and_return_conditional_losses_2240933%&-.<=KLSTghvw?Ђ<
5Ђ2
(%
teacher_inputџџџџџџџџџќ
p

 
Њ "FЂC
<9
tensor_0+џџџџџџџџџџџџџџџџџџџџџџџџџџџ
 Я
G__inference_sequential_layer_call_and_return_conditional_losses_2241179%&-.<=KLSTghvw8Ђ5
.Ђ+
!
inputsџџџџџџџџџќ
p 

 
Њ "4Ђ1
*'
tensor_0џџџџџџџџџ
 Я
G__inference_sequential_layer_call_and_return_conditional_losses_2241310%&-.<=KLSTghvw8Ђ5
.Ђ+
!
inputsџџџџџџџџџќ
p

 
Њ "4Ђ1
*'
tensor_0џџџџџџџџџ
 Т
,__inference_sequential_layer_call_fn_2240568%&-.<=KLSTghvw?Ђ<
5Ђ2
(%
teacher_inputџџџџџџџџџќ
p 

 
Њ ";8
unknown+џџџџџџџџџџџџџџџџџџџџџџџџџџџТ
,__inference_sequential_layer_call_fn_2240833%&-.<=KLSTghvw?Ђ<
5Ђ2
(%
teacher_inputџџџџџџџџџќ
p

 
Њ ";8
unknown+џџџџџџџџџџџџџџџџџџџџџџџџџџџЛ
,__inference_sequential_layer_call_fn_2241011%&-.<=KLSTghvw8Ђ5
.Ђ+
!
inputsџџџџџџџџџќ
p 

 
Њ ";8
unknown+џџџџџџџџџџџџџџџџџџџџџџџџџџџЛ
,__inference_sequential_layer_call_fn_2241048%&-.<=KLSTghvw8Ђ5
.Ђ+
!
inputsџџџџџџџџџќ
p

 
Њ ";8
unknown+џџџџџџџџџџџџџџџџџџџџџџџџџџџд
%__inference_signature_wrapper_2240974Њ%&-.<=KLSTghvwHЂE
Ђ 
>Њ;
9
teacher_input(%
teacher_inputџџџџџџџџџќ"KЊH
F
teacher_conv2d_52/
teacher_conv2d_5џџџџџџџџџФ
Q__inference_teacher_activation_1_layer_call_and_return_conditional_losses_2241523o7Ђ4
-Ђ*
(%
inputsџџџџџџџџџ	
Њ "4Ђ1
*'
tensor_0џџџџџџџџџ	
 
6__inference_teacher_activation_1_layer_call_fn_2241518d7Ђ4
-Ђ*
(%
inputsџџџџџџџџџ	
Њ ")&
unknownџџџџџџџџџ	ќ
R__inference_teacher_averagepool_1_layer_call_and_return_conditional_losses_2241424ЅRЂO
HЂE
C@
inputs4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
Њ "OЂL
EB
tensor_04џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 ж
7__inference_teacher_averagepool_1_layer_call_fn_2241419RЂO
HЂE
C@
inputs4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
Њ "DA
unknown4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџФ
M__inference_teacher_conv2d_1_layer_call_and_return_conditional_losses_2241414s-.7Ђ4
-Ђ*
(%
inputsџџџџџџџџџ
Њ "4Ђ1
*'
tensor_0џџџџџџџџџ
 
2__inference_teacher_conv2d_1_layer_call_fn_2241403h-.7Ђ4
-Ђ*
(%
inputsџџџџџџџџџ
Њ ")&
unknownџџџџџџџџџФ
M__inference_teacher_conv2d_2_layer_call_and_return_conditional_losses_2241444s<=7Ђ4
-Ђ*
(%
inputsџџџџџџџџџ	
Њ "4Ђ1
*'
tensor_0џџџџџџџџџ	
 
2__inference_teacher_conv2d_2_layer_call_fn_2241433h<=7Ђ4
-Ђ*
(%
inputsџџџџџџџџџ	
Њ ")&
unknownџџџџџџџџџ	щ
M__inference_teacher_conv2d_4_layer_call_and_return_conditional_losses_2241580vwIЂF
?Ђ<
:7
inputs+џџџџџџџџџџџџџџџџџџџџџџџџџџџ
Њ "FЂC
<9
tensor_0+џџџџџџџџџџџџџџџџџџџџџџџџџџџ
 У
2__inference_teacher_conv2d_4_layer_call_fn_2241569vwIЂF
?Ђ<
:7
inputs+џџџџџџџџџџџџџџџџџџџџџџџџџџџ
Њ ";8
unknown+џџџџџџџџџџџџџџџџџџџџџџџџџџџъ
M__inference_teacher_conv2d_5_layer_call_and_return_conditional_losses_2241599IЂF
?Ђ<
:7
inputs+џџџџџџџџџџџџџџџџџџџџџџџџџџџ
Њ "FЂC
<9
tensor_0+џџџџџџџџџџџџџџџџџџџџџџџџџџџ
 Ф
2__inference_teacher_conv2d_5_layer_call_fn_2241589IЂF
?Ђ<
:7
inputs+џџџџџџџџџџџџџџџџџџџџџџџџџџџ
Њ ";8
unknown+џџџџџџџџџџџџџџџџџџџџџџџџџџџД
L__inference_teacher_dense_1_layer_call_and_return_conditional_losses_2241475dKL0Ђ-
&Ђ#
!
inputsџџџџџџџџџт
Њ ",Ђ)
"
tensor_0џџџџџџџџџP
 
1__inference_teacher_dense_1_layer_call_fn_2241464YKL0Ђ-
&Ђ#
!
inputsџџџџџџџџџт
Њ "!
unknownџџџџџџџџџPД
L__inference_teacher_dense_2_layer_call_and_return_conditional_losses_2241494dST/Ђ,
%Ђ"
 
inputsџџџџџџџџџP
Њ "-Ђ*
# 
tensor_0џџџџџџџџџт
 
1__inference_teacher_dense_2_layer_call_fn_2241484YST/Ђ,
%Ђ"
 
inputsџџџџџџџџџP
Њ ""
unknownџџџџџџџџџтК
N__inference_teacher_flatten_1_layer_call_and_return_conditional_losses_2241455h7Ђ4
-Ђ*
(%
inputsџџџџџџџџџ	
Њ "-Ђ*
# 
tensor_0џџџџџџџџџт
 
3__inference_teacher_flatten_1_layer_call_fn_2241449]7Ђ4
-Ђ*
(%
inputsџџџџџџџџџ	
Њ ""
unknownџџџџџџџџџтЦ
O__inference_teacher_layer_norm_layer_call_and_return_conditional_losses_2241394s%&7Ђ4
-Ђ*
(%
inputsџџџџџџџџџ
Њ "4Ђ1
*'
tensor_0џџџџџџџџџ
  
4__inference_teacher_layer_norm_layer_call_fn_2241338h%&7Ђ4
-Ђ*
(%
inputsџџџџџџџџџ
Њ ")&
unknownџџџџџџџџџК
N__inference_teacher_reshape_2_layer_call_and_return_conditional_losses_2241513h0Ђ-
&Ђ#
!
inputsџџџџџџџџџт
Њ "4Ђ1
*'
tensor_0џџџџџџџџџ	
 
3__inference_teacher_reshape_2_layer_call_fn_2241499]0Ђ-
&Ђ#
!
inputsџџџџџџџџџт
Њ ")&
unknownџџџџџџџџџ	И
L__inference_teacher_reshape_layer_call_and_return_conditional_losses_2241329h0Ђ-
&Ђ#
!
inputsџџџџџџџџџќ
Њ "4Ђ1
*'
tensor_0џџџџџџџџџ
 
1__inference_teacher_reshape_layer_call_fn_2241315]0Ђ-
&Ђ#
!
inputsџџџџџџџџџќ
Њ ")&
unknownџџџџџџџџџљ
O__inference_teacher_upsample_1_layer_call_and_return_conditional_losses_2241560ЅRЂO
HЂE
C@
inputs4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
Њ "OЂL
EB
tensor_04џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 г
4__inference_teacher_upsample_1_layer_call_fn_2241548RЂO
HЂE
C@
inputs4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
Њ "DA
unknown4џџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџУ
L__inference_techer_conv2d_3_layer_call_and_return_conditional_losses_2241543sgh7Ђ4
-Ђ*
(%
inputsџџџџџџџџџ	
Њ "4Ђ1
*'
tensor_0џџџџџџџџџ	
 
1__inference_techer_conv2d_3_layer_call_fn_2241532hgh7Ђ4
-Ђ*
(%
inputsџџџџџџџџџ	
Њ ")&
unknownџџџџџџџџџ	