≈»
кЇ
D
AddV2
x"T
y"T
z"T"
Ttype:
2	АР
E
AssignAddVariableOp
resource
value"dtype"
dtypetypeИ
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( И
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
8
Const
output"dtype"
valuetensor"
dtypetype
Ы
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
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
.
Identity

input"T
output"T"	
Ttype
?
	LessEqual
x"T
y"T
z
"
Ttype:
2	
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
>
Maximum
x"T
y"T
z"T"
Ttype:
2	
Н
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
Ж
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( И
>
Minimum
x"T
y"T
z"T"
Ttype:
2	
?
Mul
x"T
y"T
z"T"
Ttype:
2	Р
0
Neg
x"T
y"T"
Ttype:
2
	
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
8
Pow
x"T
y"T
z"T"
Ttype:
2
	
@
ReadVariableOp
resource
value"dtype"
dtypetypeИ
@
RealDiv
x"T
y"T
z"T"
Ttype:
2	
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
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
2
Round
x"T
y"T"
Ttype:
2
	
.
Rsqrt
x"T
y"T"
Ttype:

2
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
?
Select
	condition

t"T
e"T
output"T"	
Ttype
A
SelectV2
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
G
SquaredDifference
x"T
y"T
z"T"
Ttype:

2	Р
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
Ѕ
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
executor_typestring И®
@
StaticRegexFullMatch	
input

output
"
patternstring
2
StopGradient

input"T
output"T"	
Ttype
ч
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
<
Sub
x"T
y"T
z"T"
Ttype:
2	
Ц
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 И"serve*2.10.02v2.10.0-rc3-6-g359c3cdfc5f8ВО
®
(Adam/dense1/batch_normalization_1/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*9
shared_name*(Adam/dense1/batch_normalization_1/beta/v
°
<Adam/dense1/batch_normalization_1/beta/v/Read/ReadVariableOpReadVariableOp(Adam/dense1/batch_normalization_1/beta/v*
_output_shapes
:*
dtype0
™
)Adam/dense1/batch_normalization_1/gamma/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*:
shared_name+)Adam/dense1/batch_normalization_1/gamma/v
£
=Adam/dense1/batch_normalization_1/gamma/v/Read/ReadVariableOpReadVariableOp)Adam/dense1/batch_normalization_1/gamma/v*
_output_shapes
:*
dtype0
Д
Adam/dense2/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*%
shared_nameAdam/dense2/kernel/v
}
(Adam/dense2/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense2/kernel/v*
_output_shapes

:*
dtype0
|
Adam/dense1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*#
shared_nameAdam/dense1/bias/v
u
&Adam/dense1/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense1/bias/v*
_output_shapes
:*
dtype0
Е
Adam/dense1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	ь*%
shared_nameAdam/dense1/kernel/v
~
(Adam/dense1/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense1/kernel/v*
_output_shapes
:	ь*
dtype0
И
Adam/conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*#
shared_nameAdam/conv/kernel/v
Б
&Adam/conv/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv/kernel/v*&
_output_shapes
:*
dtype0
®
(Adam/dense1/batch_normalization_1/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*9
shared_name*(Adam/dense1/batch_normalization_1/beta/m
°
<Adam/dense1/batch_normalization_1/beta/m/Read/ReadVariableOpReadVariableOp(Adam/dense1/batch_normalization_1/beta/m*
_output_shapes
:*
dtype0
™
)Adam/dense1/batch_normalization_1/gamma/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*:
shared_name+)Adam/dense1/batch_normalization_1/gamma/m
£
=Adam/dense1/batch_normalization_1/gamma/m/Read/ReadVariableOpReadVariableOp)Adam/dense1/batch_normalization_1/gamma/m*
_output_shapes
:*
dtype0
Д
Adam/dense2/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*%
shared_nameAdam/dense2/kernel/m
}
(Adam/dense2/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense2/kernel/m*
_output_shapes

:*
dtype0
|
Adam/dense1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*#
shared_nameAdam/dense1/bias/m
u
&Adam/dense1/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense1/bias/m*
_output_shapes
:*
dtype0
Е
Adam/dense1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	ь*%
shared_nameAdam/dense1/kernel/m
~
(Adam/dense1/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense1/kernel/m*
_output_shapes
:	ь*
dtype0
И
Adam/conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*#
shared_nameAdam/conv/kernel/m
Б
&Adam/conv/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv/kernel/m*&
_output_shapes
:*
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
∞
,dense1/batch_normalization_1/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*=
shared_name.,dense1/batch_normalization_1/moving_variance
©
@dense1/batch_normalization_1/moving_variance/Read/ReadVariableOpReadVariableOp,dense1/batch_normalization_1/moving_variance*
_output_shapes
:*
dtype0
®
(dense1/batch_normalization_1/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*9
shared_name*(dense1/batch_normalization_1/moving_mean
°
<dense1/batch_normalization_1/moving_mean/Read/ReadVariableOpReadVariableOp(dense1/batch_normalization_1/moving_mean*
_output_shapes
:*
dtype0
Ъ
!dense1/batch_normalization_1/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*2
shared_name#!dense1/batch_normalization_1/beta
У
5dense1/batch_normalization_1/beta/Read/ReadVariableOpReadVariableOp!dense1/batch_normalization_1/beta*
_output_shapes
:*
dtype0
Ь
"dense1/batch_normalization_1/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*3
shared_name$"dense1/batch_normalization_1/gamma
Х
6dense1/batch_normalization_1/gamma/Read/ReadVariableOpReadVariableOp"dense1/batch_normalization_1/gamma*
_output_shapes
:*
dtype0
v
dense2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*
shared_namedense2/kernel
o
!dense2/kernel/Read/ReadVariableOpReadVariableOpdense2/kernel*
_output_shapes

:*
dtype0
t
dense1/iterationVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *!
shared_namedense1/iteration
m
$dense1/iteration/Read/ReadVariableOpReadVariableOpdense1/iteration*
_output_shapes
: *
dtype0	
n
dense1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namedense1/bias
g
dense1/bias/Read/ReadVariableOpReadVariableOpdense1/bias*
_output_shapes
:*
dtype0
w
dense1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	ь*
shared_namedense1/kernel
p
!dense1/kernel/Read/ReadVariableOpReadVariableOpdense1/kernel*
_output_shapes
:	ь*
dtype0
z
conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_nameconv/kernel
s
conv/kernel/Read/ReadVariableOpReadVariableOpconv/kernel*&
_output_shapes
:*
dtype0
|
serving_default_inputs_Placeholder*(
_output_shapes
:€€€€€€€€€ь*
dtype0*
shape:€€€€€€€€€ь
ђ
StatefulPartitionedCallStatefulPartitionedCallserving_default_inputs_conv/kerneldense1/kerneldense1/bias,dense1/batch_normalization_1/moving_variance"dense1/batch_normalization_1/gamma(dense1/batch_normalization_1/moving_mean!dense1/batch_normalization_1/betadense1/iterationdense2/kernel*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€**
_read_only_resource_inputs

	*-
config_proto

CPU

GPU 2J 8В *-
f(R&
$__inference_signature_wrapper_262920

NoOpNoOp
тV
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*≠V
value£VB†V BЩV
™
layer-0
layer-1
layer_with_weights-0
layer-2
layer-3
layer-4
layer-5
layer_with_weights-1
layer-6
layer-7
	layer-8

layer_with_weights-2

layer-9
layer-10
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures*
* 
О
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses* 
Г
	variables
trainable_variables
regularization_losses
	keras_api
__call__
* &call_and_return_all_conditional_losses
!kernel_quantizer
!kernel_quantizer_internal
"
quantizers

#kernel
 $_jit_compiled_convolution_op*
Э
%	variables
&trainable_variables
'regularization_losses
(	keras_api
)__call__
**&call_and_return_all_conditional_losses
+	quantizer* 
О
,	variables
-trainable_variables
.regularization_losses
/	keras_api
0__call__
*1&call_and_return_all_conditional_losses* 
•
2	variables
3trainable_variables
4regularization_losses
5	keras_api
6__call__
*7&call_and_return_all_conditional_losses
8_random_generator* 
ї
9	variables
:trainable_variables
;regularization_losses
<	keras_api
=__call__
*>&call_and_return_all_conditional_losses
?kernel_quantizer
@bias_quantizer
?kernel_quantizer_internal
@bias_quantizer_internal
A
quantizers
B	batchnorm

Ckernel
Dbias
E
_iteration*
Э
F	variables
Gtrainable_variables
Hregularization_losses
I	keras_api
J__call__
*K&call_and_return_all_conditional_losses
L	quantizer* 
•
M	variables
Ntrainable_variables
Oregularization_losses
P	keras_api
Q__call__
*R&call_and_return_all_conditional_losses
S_random_generator* 
б
T	variables
Utrainable_variables
Vregularization_losses
W	keras_api
X__call__
*Y&call_and_return_all_conditional_losses
Zkernel_quantizer
Zkernel_quantizer_internal
[
quantizers

\kernel*
Э
]	variables
^trainable_variables
_regularization_losses
`	keras_api
a__call__
*b&call_and_return_all_conditional_losses
c	quantizer* 
C
#0
C1
D2
d3
e4
E5
f6
g7
\8*
.
#0
C1
D2
d3
e4
\5*
* 
∞
hnon_trainable_variables

ilayers
jmetrics
klayer_regularization_losses
llayer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
6
mtrace_0
ntrace_1
otrace_2
ptrace_3* 
6
qtrace_0
rtrace_1
strace_2
ttrace_3* 
* 
Љ
uiter

vbeta_1

wbeta_2
	xdecay
ylearning_rate#m№CmЁDmё\mяdmаemб#vвCvгDvд\vеdvжevз*

zserving_default* 
* 
* 
* 
С
{non_trainable_variables

|layers
}metrics
~layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses* 

Аtrace_0* 

Бtrace_0* 

#0*

#0*
* 
Ш
Вnon_trainable_variables
Гlayers
Дmetrics
 Еlayer_regularization_losses
Жlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
* &call_and_return_all_conditional_losses
& "call_and_return_conditional_losses*

Зtrace_0* 

Иtrace_0* 
* 
	
!0* 
[U
VARIABLE_VALUEconv/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
Ц
Йnon_trainable_variables
Кlayers
Лmetrics
 Мlayer_regularization_losses
Нlayer_metrics
%	variables
&trainable_variables
'regularization_losses
)__call__
**&call_and_return_all_conditional_losses
&*"call_and_return_conditional_losses* 

Оtrace_0* 

Пtrace_0* 
* 
* 
* 
* 
Ц
Рnon_trainable_variables
Сlayers
Тmetrics
 Уlayer_regularization_losses
Фlayer_metrics
,	variables
-trainable_variables
.regularization_losses
0__call__
*1&call_and_return_all_conditional_losses
&1"call_and_return_conditional_losses* 

Хtrace_0* 

Цtrace_0* 
* 
* 
* 
Ц
Чnon_trainable_variables
Шlayers
Щmetrics
 Ъlayer_regularization_losses
Ыlayer_metrics
2	variables
3trainable_variables
4regularization_losses
6__call__
*7&call_and_return_all_conditional_losses
&7"call_and_return_conditional_losses* 

Ьtrace_0
Эtrace_1* 

Юtrace_0
Яtrace_1* 
* 
5
C0
D1
d2
e3
E4
f5
g6*
 
C0
D1
d2
e3*
* 
Ш
†non_trainable_variables
°layers
Ґmetrics
 £layer_regularization_losses
§layer_metrics
9	variables
:trainable_variables
;regularization_losses
=__call__
*>&call_and_return_all_conditional_losses
&>"call_and_return_conditional_losses*

•trace_0
¶trace_1* 

Іtrace_0
®trace_1* 
* 
* 

?0
@1* 
№
©	variables
™trainable_variables
Ђregularization_losses
ђ	keras_api
≠__call__
+Ѓ&call_and_return_all_conditional_losses
	ѓaxis
	dgamma
ebeta
fmoving_mean
gmoving_variance*
]W
VARIABLE_VALUEdense1/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE*
YS
VARIABLE_VALUEdense1/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE*
d^
VARIABLE_VALUEdense1/iteration:layer_with_weights-1/_iteration/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
Ц
∞non_trainable_variables
±layers
≤metrics
 ≥layer_regularization_losses
іlayer_metrics
F	variables
Gtrainable_variables
Hregularization_losses
J__call__
*K&call_and_return_all_conditional_losses
&K"call_and_return_conditional_losses* 

µtrace_0* 

ґtrace_0* 
* 
* 
* 
* 
Ц
Јnon_trainable_variables
Єlayers
єmetrics
 Їlayer_regularization_losses
їlayer_metrics
M	variables
Ntrainable_variables
Oregularization_losses
Q__call__
*R&call_and_return_all_conditional_losses
&R"call_and_return_conditional_losses* 

Љtrace_0
љtrace_1* 

Њtrace_0
њtrace_1* 
* 

\0*

\0*
* 
Ш
јnon_trainable_variables
Ѕlayers
¬metrics
 √layer_regularization_losses
ƒlayer_metrics
T	variables
Utrainable_variables
Vregularization_losses
X__call__
*Y&call_and_return_all_conditional_losses
&Y"call_and_return_conditional_losses*

≈trace_0* 

∆trace_0* 
* 
	
Z0* 
]W
VARIABLE_VALUEdense2/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
Ц
«non_trainable_variables
»layers
…metrics
  layer_regularization_losses
Ћlayer_metrics
]	variables
^trainable_variables
_regularization_losses
a__call__
*b&call_and_return_all_conditional_losses
&b"call_and_return_conditional_losses* 

ћtrace_0* 

Ќtrace_0* 
* 
b\
VARIABLE_VALUE"dense1/batch_normalization_1/gamma&variables/3/.ATTRIBUTES/VARIABLE_VALUE*
a[
VARIABLE_VALUE!dense1/batch_normalization_1/beta&variables/4/.ATTRIBUTES/VARIABLE_VALUE*
hb
VARIABLE_VALUE(dense1/batch_normalization_1/moving_mean&variables/6/.ATTRIBUTES/VARIABLE_VALUE*
lf
VARIABLE_VALUE,dense1/batch_normalization_1/moving_variance&variables/7/.ATTRIBUTES/VARIABLE_VALUE*

E0
f1
g2*
R
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
10*

ќ0*
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

E0
f1
g2*

B0*
* 
* 
* 
* 
* 
* 
* 
 
d0
e1
f2
g3*

d0
e1*
* 
Ю
ѕnon_trainable_variables
–layers
—metrics
 “layer_regularization_losses
”layer_metrics
©	variables
™trainable_variables
Ђregularization_losses
≠__call__
+Ѓ&call_and_return_all_conditional_losses
'Ѓ"call_and_return_conditional_losses*

‘trace_0
’trace_1* 

÷trace_0
„trace_1* 
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
Ў	variables
ў	keras_api

Џtotal

џcount*

f0
g1*
* 
* 
* 
* 
* 
* 
* 
* 

Џ0
џ1*

Ў	variables*
SM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*
~x
VARIABLE_VALUEAdam/conv/kernel/mRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
Аz
VARIABLE_VALUEAdam/dense1/kernel/mRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUEAdam/dense1/bias/mPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
Аz
VARIABLE_VALUEAdam/dense2/kernel/mRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
Е
VARIABLE_VALUE)Adam/dense1/batch_normalization_1/gamma/mBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
Д~
VARIABLE_VALUE(Adam/dense1/batch_normalization_1/beta/mBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
~x
VARIABLE_VALUEAdam/conv/kernel/vRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
Аz
VARIABLE_VALUEAdam/dense1/kernel/vRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
|v
VARIABLE_VALUEAdam/dense1/bias/vPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
Аz
VARIABLE_VALUEAdam/dense2/kernel/vRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
Е
VARIABLE_VALUE)Adam/dense1/batch_normalization_1/gamma/vBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
Д~
VARIABLE_VALUE(Adam/dense1/batch_normalization_1/beta/vBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
х
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filenameconv/kernel/Read/ReadVariableOp!dense1/kernel/Read/ReadVariableOpdense1/bias/Read/ReadVariableOp$dense1/iteration/Read/ReadVariableOp!dense2/kernel/Read/ReadVariableOp6dense1/batch_normalization_1/gamma/Read/ReadVariableOp5dense1/batch_normalization_1/beta/Read/ReadVariableOp<dense1/batch_normalization_1/moving_mean/Read/ReadVariableOp@dense1/batch_normalization_1/moving_variance/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOp&Adam/conv/kernel/m/Read/ReadVariableOp(Adam/dense1/kernel/m/Read/ReadVariableOp&Adam/dense1/bias/m/Read/ReadVariableOp(Adam/dense2/kernel/m/Read/ReadVariableOp=Adam/dense1/batch_normalization_1/gamma/m/Read/ReadVariableOp<Adam/dense1/batch_normalization_1/beta/m/Read/ReadVariableOp&Adam/conv/kernel/v/Read/ReadVariableOp(Adam/dense1/kernel/v/Read/ReadVariableOp&Adam/dense1/bias/v/Read/ReadVariableOp(Adam/dense2/kernel/v/Read/ReadVariableOp=Adam/dense1/batch_normalization_1/gamma/v/Read/ReadVariableOp<Adam/dense1/batch_normalization_1/beta/v/Read/ReadVariableOpConst*)
Tin"
 2		*
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
GPU 2J 8В *(
f#R!
__inference__traced_save_264531
ј
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameconv/kerneldense1/kerneldense1/biasdense1/iterationdense2/kernel"dense1/batch_normalization_1/gamma!dense1/batch_normalization_1/beta(dense1/batch_normalization_1/moving_mean,dense1/batch_normalization_1/moving_variance	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotalcountAdam/conv/kernel/mAdam/dense1/kernel/mAdam/dense1/bias/mAdam/dense2/kernel/m)Adam/dense1/batch_normalization_1/gamma/m(Adam/dense1/batch_normalization_1/beta/mAdam/conv/kernel/vAdam/dense1/kernel/vAdam/dense1/bias/vAdam/dense2/kernel/v)Adam/dense1/batch_normalization_1/gamma/v(Adam/dense1/batch_normalization_1/beta/v*(
Tin!
2*
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
GPU 2J 8В *+
f&R$
"__inference__traced_restore_264625°д
Ї
Б
%__inference_conv_layer_call_fn_263721

inputs!
unknown:
identityИҐStatefulPartitionedCall–
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€	*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *I
fDRB
@__inference_conv_layer_call_and_return_conditional_losses_262062w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€	`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:€€€€€€€€€: 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
х 
_
C__inference_outputs_layer_call_and_return_conditional_losses_262422

inputs
identityG
Pow/xConst*
_output_shapes
: *
dtype0*
value	B :G
Pow/yConst*
_output_shapes
: *
dtype0*
value	B :K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: E
CastCastPow:z:0*

DstT0*

SrcT0*
_output_shapes
: I
Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :I
Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: I
Cast_1Cast	Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: J
ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :Q
Cast_2CastCast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  АAG
subSub
Cast_2:y:0sub/y:output:0*
T0*
_output_shapes
: F
Pow_2PowConst:output:0sub:z:0*
T0*
_output_shapes
: D
sub_1Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
	LessEqual	LessEqualinputs	sub_1:z:0*
T0*'
_output_shapes
:€€€€€€€€€F
ReluReluinputs*
T0*'
_output_shapes
:€€€€€€€€€E
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:T
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?w
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
mulMulones_like:output:0	sub_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€r
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€P
mul_1MulinputsCast:y:0*
T0*'
_output_shapes
:€€€€€€€€€[
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*'
_output_shapes
:€€€€€€€€€I
NegNegtruediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€M
RoundRoundtruediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€R
addAddV2Neg:y:0	Round:y:0*
T0*'
_output_shapes
:€€€€€€€€€W
StopGradientStopGradientadd:z:0*
T0*'
_output_shapes
:€€€€€€€€€d
add_1AddV2truediv:z:0StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€[
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: l
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€]
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*'
_output_shapes
:€€€€€€€€€Q
Neg_1NegSelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€V
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?[
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€[
StopGradient_1StopGradient	mul_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€l
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€Q
IdentityIdentity	add_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
у 
]
A__inference_relu1_layer_call_and_return_conditional_losses_264215

inputs
identityG
Pow/xConst*
_output_shapes
: *
dtype0*
value	B :G
Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: E
CastCastPow:z:0*

DstT0*

SrcT0*
_output_shapes
: I
Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :I
Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: I
Cast_1Cast	Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: J
ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :Q
Cast_2CastCast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   AG
subSub
Cast_2:y:0sub/y:output:0*
T0*
_output_shapes
: F
Pow_2PowConst:output:0sub:z:0*
T0*
_output_shapes
: D
sub_1Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
	LessEqual	LessEqualinputs	sub_1:z:0*
T0*'
_output_shapes
:€€€€€€€€€F
ReluReluinputs*
T0*'
_output_shapes
:€€€€€€€€€E
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:T
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?w
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
mulMulones_like:output:0	sub_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€r
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€P
mul_1MulinputsCast:y:0*
T0*'
_output_shapes
:€€€€€€€€€[
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*'
_output_shapes
:€€€€€€€€€I
NegNegtruediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€M
RoundRoundtruediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€R
addAddV2Neg:y:0	Round:y:0*
T0*'
_output_shapes
:€€€€€€€€€W
StopGradientStopGradientadd:z:0*
T0*'
_output_shapes
:€€€€€€€€€d
add_1AddV2truediv:z:0StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€[
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: l
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€]
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*'
_output_shapes
:€€€€€€€€€Q
Neg_1NegSelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€V
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?[
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€[
StopGradient_1StopGradient	mul_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€l
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€Q
IdentityIdentity	add_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
√	
ќ
$__inference_signature_wrapper_262920
inputs_!
unknown:
	unknown_0:	ь
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:
	unknown_6:	 
	unknown_7:
identityИҐStatefulPartitionedCallС
StatefulPartitionedCallStatefulPartitionedCallinputs_unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€**
_read_only_resource_inputs

	*-
config_proto

CPU

GPU 2J 8В **
f%R#
!__inference__wrapped_model_261916o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:€€€€€€€€€ь: : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:€€€€€€€€€ь
!
_user_specified_name	inputs_
Д	
О
'__inference_dense1_layer_call_fn_263873

inputs
unknown:	ь
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:	 
identityИҐStatefulPartitionedCallЧ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense1_layer_call_and_return_conditional_losses_262254o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":€€€€€€€€€ь: : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
ы	
d
E__inference_dropout_1_layer_call_and_return_conditional_losses_262695

inputs
identityИR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  Р?e
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:€€€€€€€€€ьC
dropout/ShapeShapeinputs*
T0*
_output_shapes
:Н
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:€€€€€€€€€ь*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *9Ог=І
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:€€€€€€€€€ьp
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:€€€€€€€€€ьj
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:€€€€€€€€€ьZ
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:€€€€€€€€€ь"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:€€€€€€€€€ь:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
№
c
E__inference_dropout_1_layer_call_and_return_conditional_losses_262130

inputs

identity_1O
IdentityIdentityinputs*
T0*(
_output_shapes
:€€€€€€€€€ь\

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:€€€€€€€€€ь"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:€€€€€€€€€ь:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
ћ
_
C__inference_reshape_layer_call_and_return_conditional_losses_263714

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
valueB:—
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
value	B :©
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:l
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:€€€€€€€€€`
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:€€€€€€€€€ь:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
®
—
6__inference_batch_normalization_1_layer_call_fn_264357

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identityИҐStatefulPartitionedCallА
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_1_layer_call_and_return_conditional_losses_261940o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
¶
—
6__inference_batch_normalization_1_layer_call_fn_264370

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identityИҐStatefulPartitionedCallю
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Z
fURS
Q__inference_batch_normalization_1_layer_call_and_return_conditional_losses_261987o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
Ј
B
&__inference_relu0_layer_call_fn_263767

inputs
identityі
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_relu0_layer_call_and_return_conditional_losses_262115h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:€€€€€€€€€	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€	:W S
/
_output_shapes
:€€€€€€€€€	
 
_user_specified_nameinputs
Ч(
Ґ
E__inference_cicada-v2_layer_call_and_return_conditional_losses_262889
inputs_%
conv_262861: 
dense1_262867:	ь
dense1_262869:
dense1_262871:
dense1_262873:
dense1_262875:
dense1_262877:
dense1_262879:	 
dense2_262884:
identityИҐconv/StatefulPartitionedCallҐdense1/StatefulPartitionedCallҐdense2/StatefulPartitionedCallҐ!dropout_1/StatefulPartitionedCallҐ!dropout_2/StatefulPartitionedCallњ
reshape/PartitionedCallPartitionedCallinputs_*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_reshape_layer_call_and_return_conditional_losses_262019у
conv/StatefulPartitionedCallStatefulPartitionedCall reshape/PartitionedCall:output:0conv_262861*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€	*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *I
fDRB
@__inference_conv_layer_call_and_return_conditional_losses_262062ў
relu0/PartitionedCallPartitionedCall%conv/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_relu0_layer_call_and_return_conditional_losses_262115ѕ
flatten/PartitionedCallPartitionedCallrelu0/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€ь* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_flatten_layer_call_and_return_conditional_losses_262123е
!dropout_1/StatefulPartitionedCallStatefulPartitionedCall flatten/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€ь* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_dropout_1_layer_call_and_return_conditional_losses_262695ё
dense1/StatefulPartitionedCallStatefulPartitionedCall*dropout_1/StatefulPartitionedCall:output:0dense1_262867dense1_262869dense1_262871dense1_262873dense1_262875dense1_262877dense1_262879*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense1_layer_call_and_return_conditional_losses_262658”
relu1/PartitionedCallPartitionedCall'dense1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_relu1_layer_call_and_return_conditional_losses_262319Ж
!dropout_2/StatefulPartitionedCallStatefulPartitionedCallrelu1/PartitionedCall:output:0"^dropout_1/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_dropout_2_layer_call_and_return_conditional_losses_262480ы
dense2/StatefulPartitionedCallStatefulPartitionedCall*dropout_2/StatefulPartitionedCall:output:0dense2_262884*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense2_layer_call_and_return_conditional_losses_262369„
outputs/PartitionedCallPartitionedCall'dense2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_outputs_layer_call_and_return_conditional_losses_262422o
IdentityIdentity outputs/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€п
NoOpNoOp^conv/StatefulPartitionedCall^dense1/StatefulPartitionedCall^dense2/StatefulPartitionedCall"^dropout_1/StatefulPartitionedCall"^dropout_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:€€€€€€€€€ь: : : : : : : : : 2<
conv/StatefulPartitionedCallconv/StatefulPartitionedCall2@
dense1/StatefulPartitionedCalldense1/StatefulPartitionedCall2@
dense2/StatefulPartitionedCalldense2/StatefulPartitionedCall2F
!dropout_1/StatefulPartitionedCall!dropout_1/StatefulPartitionedCall2F
!dropout_2/StatefulPartitionedCall!dropout_2/StatefulPartitionedCall:Q M
(
_output_shapes
:€€€€€€€€€ь
!
_user_specified_name	inputs_
Х
{
'__inference_dense2_layer_call_fn_264249

inputs
unknown:
identityИҐStatefulPartitionedCall 
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense2_layer_call_and_return_conditional_losses_262369o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:€€€€€€€€€: 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
Ў
c
E__inference_dropout_2_layer_call_and_return_conditional_losses_262326

inputs

identity_1N
IdentityIdentityinputs*
T0*'
_output_shapes
:€€€€€€€€€[

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:€€€€€€€€€"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
ЦЛ
Щ
B__inference_dense1_layer_call_and_return_conditional_losses_264161

inputs1
matmul_readvariableop_resource:	ь-
biasadd_readvariableop_resource:K
=batch_normalization_1_assignmovingavg_readvariableop_resource:M
?batch_normalization_1_assignmovingavg_1_readvariableop_resource:I
;batch_normalization_1_batchnorm_mul_readvariableop_resource:E
7batch_normalization_1_batchnorm_readvariableop_resource:&
assignaddvariableop_resource:	 
identityИҐAssignAddVariableOpҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpҐReadVariableOpҐReadVariableOp_1ҐReadVariableOp_2Ґadd_2/ReadVariableOpҐ%batch_normalization_1/AssignMovingAvgҐ4batch_normalization_1/AssignMovingAvg/ReadVariableOpҐ'batch_normalization_1/AssignMovingAvg_1Ґ6batch_normalization_1/AssignMovingAvg_1/ReadVariableOpҐ.batch_normalization_1/batchnorm/ReadVariableOpҐ2batch_normalization_1/batchnorm/mul/ReadVariableOpҐmul/ReadVariableOpҐmul_1/ReadVariableOpҐmul_3/ReadVariableOpH
Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Zu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€~
4batch_normalization_1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: µ
"batch_normalization_1/moments/meanMeanBiasAdd:output:0=batch_normalization_1/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(Р
*batch_normalization_1/moments/StopGradientStopGradient+batch_normalization_1/moments/mean:output:0*
T0*
_output_shapes

:љ
/batch_normalization_1/moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:03batch_normalization_1/moments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€В
8batch_normalization_1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: а
&batch_normalization_1/moments/varianceMean3batch_normalization_1/moments/SquaredDifference:z:0Abatch_normalization_1/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(Щ
%batch_normalization_1/moments/SqueezeSqueeze+batch_normalization_1/moments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 Я
'batch_normalization_1/moments/Squeeze_1Squeeze/batch_normalization_1/moments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 p
+batch_normalization_1/AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
„#<Ѓ
4batch_normalization_1/AssignMovingAvg/ReadVariableOpReadVariableOp=batch_normalization_1_assignmovingavg_readvariableop_resource*
_output_shapes
:*
dtype0√
)batch_normalization_1/AssignMovingAvg/subSub<batch_normalization_1/AssignMovingAvg/ReadVariableOp:value:0.batch_normalization_1/moments/Squeeze:output:0*
T0*
_output_shapes
:Ї
)batch_normalization_1/AssignMovingAvg/mulMul-batch_normalization_1/AssignMovingAvg/sub:z:04batch_normalization_1/AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:Д
%batch_normalization_1/AssignMovingAvgAssignSubVariableOp=batch_normalization_1_assignmovingavg_readvariableop_resource-batch_normalization_1/AssignMovingAvg/mul:z:05^batch_normalization_1/AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0r
-batch_normalization_1/AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
„#<≤
6batch_normalization_1/AssignMovingAvg_1/ReadVariableOpReadVariableOp?batch_normalization_1_assignmovingavg_1_readvariableop_resource*
_output_shapes
:*
dtype0…
+batch_normalization_1/AssignMovingAvg_1/subSub>batch_normalization_1/AssignMovingAvg_1/ReadVariableOp:value:00batch_normalization_1/moments/Squeeze_1:output:0*
T0*
_output_shapes
:ј
+batch_normalization_1/AssignMovingAvg_1/mulMul/batch_normalization_1/AssignMovingAvg_1/sub:z:06batch_normalization_1/AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:М
'batch_normalization_1/AssignMovingAvg_1AssignSubVariableOp?batch_normalization_1_assignmovingavg_1_readvariableop_resource/batch_normalization_1/AssignMovingAvg_1/mul:z:07^batch_normalization_1/AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0j
%batch_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:≥
#batch_normalization_1/batchnorm/addAddV20batch_normalization_1/moments/Squeeze_1:output:0.batch_normalization_1/batchnorm/add/y:output:0*
T0*
_output_shapes
:|
%batch_normalization_1/batchnorm/RsqrtRsqrt'batch_normalization_1/batchnorm/add:z:0*
T0*
_output_shapes
:™
2batch_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0ґ
#batch_normalization_1/batchnorm/mulMul)batch_normalization_1/batchnorm/Rsqrt:y:0:batch_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:Щ
%batch_normalization_1/batchnorm/mul_1MulBiasAdd:output:0'batch_normalization_1/batchnorm/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€™
%batch_normalization_1/batchnorm/mul_2Mul.batch_normalization_1/moments/Squeeze:output:0'batch_normalization_1/batchnorm/mul:z:0*
T0*
_output_shapes
:Ґ
.batch_normalization_1/batchnorm/ReadVariableOpReadVariableOp7batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0≤
#batch_normalization_1/batchnorm/subSub6batch_normalization_1/batchnorm/ReadVariableOp:value:0)batch_normalization_1/batchnorm/mul_2:z:0*
T0*
_output_shapes
:і
%batch_normalization_1/batchnorm/add_1AddV2)batch_normalization_1/batchnorm/mul_1:z:0'batch_normalization_1/batchnorm/sub:z:0*
T0*'
_output_shapes
:€€€€€€€€€G
ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R{
AssignAddVariableOpAssignAddVariableOpassignaddvariableop_resourceConst:output:0*
_output_shapes
 *
dtype0	h
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Й
moments/meanMeanBiasAdd:output:0'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:С
moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:0moments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Ю
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(m
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 s
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 і
ReadVariableOpReadVariableOp?batch_normalization_1_assignmovingavg_1_readvariableop_resource(^batch_normalization_1/AssignMovingAvg_1*
_output_shapes
:*
dtype0J
add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:Y
addAddV2ReadVariableOp:value:0add/y:output:0*
T0*
_output_shapes
:<
RsqrtRsqrtadd:z:0*
T0*
_output_shapes
:L
add_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:a
add_1AddV2moments/Squeeze_1:output:0add_1/y:output:0*
T0*
_output_shapes
:@
Rsqrt_1Rsqrt	add_1:z:0*
T0*
_output_shapes
:К
mul/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0V
mulMul	Rsqrt:y:0mul/ReadVariableOp:value:0*
T0*
_output_shapes
:М
mul_1/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0\
mul_1MulRsqrt_1:y:0mul_1/ReadVariableOp:value:0*
T0*
_output_shapes
:l
ReadVariableOp_1ReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0c
subSubReadVariableOp_1:value:0moments/Squeeze:output:0*
T0*
_output_shapes
:E
mul_2Mul	mul_1:z:0sub:z:0*
T0*
_output_shapes
:И
add_2/ReadVariableOpReadVariableOp7batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0\
add_2AddV2	mul_2:z:0add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:t
mul_3/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0]
mul_3Mulmul:z:0mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	ьJ
Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  а@K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: L
Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: J
mul_4Mul	mul_3:z:0Pow:z:0*
T0*
_output_shapes
:	ьR
truedivRealDiv	mul_4:z:0	Pow_1:z:0*
T0*
_output_shapes
:	ьA
NegNegtruediv:z:0*
T0*
_output_shapes
:	ьE
RoundRoundtruediv:z:0*
T0*
_output_shapes
:	ьL
add_3AddV2Neg:y:0	Round:y:0*
T0*
_output_shapes
:	ьQ
StopGradientStopGradient	add_3:z:0*
T0*
_output_shapes
:	ь\
add_4AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes
:	ь6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?L
add_5AddV2	Neg_1:y:0add_5/y:output:0*
T0*
_output_shapes
: L
mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?J
mul_5Mulmul_5/x:output:0	add_5:z:0*
T0*
_output_shapes
: L
sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?H
sub_1SubPow:z:0sub_1/y:output:0*
T0*
_output_shapes
: `
clip_by_value/MinimumMinimum	add_4:z:0	sub_1:z:0*
T0*
_output_shapes
:	ьh
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_5:z:0*
T0*
_output_shapes
:	ьT
mul_6Mul	Pow_1:z:0clip_by_value:z:0*
T0*
_output_shapes
:	ьR
	truediv_1RealDiv	mul_6:z:0Pow:z:0*
T0*
_output_shapes
:	ьL
mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?W
mul_7Mulmul_7/x:output:0truediv_1:z:0*
T0*
_output_shapes
:	ьA
Neg_2Neg	mul_3:z:0*
T0*
_output_shapes
:	ьN
add_6AddV2	Neg_2:y:0	mul_7:z:0*
T0*
_output_shapes
:	ьL
mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?S
mul_8Mulmul_8/x:output:0	add_6:z:0*
T0*
_output_shapes
:	ьS
StopGradient_1StopGradient	mul_8:z:0*
T0*
_output_shapes
:	ь\
add_7AddV2	mul_3:z:0StopGradient_1:output:0*
T0*
_output_shapes
:	ьL
Pow_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  а@Q
Pow_2PowPow_2/x:output:0Pow_2/y:output:0*
T0*
_output_shapes
: L
Pow_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@Q
Pow_3PowPow_3/x:output:0Pow_3/y:output:0*
T0*
_output_shapes
: G
mul_9Mul	add_2:z:0	Pow_2:z:0*
T0*
_output_shapes
:O
	truediv_2RealDiv	mul_9:z:0	Pow_3:z:0*
T0*
_output_shapes
:@
Neg_3Negtruediv_2:z:0*
T0*
_output_shapes
:D
Round_1Roundtruediv_2:z:0*
T0*
_output_shapes
:K
add_8AddV2	Neg_3:y:0Round_1:y:0*
T0*
_output_shapes
:N
StopGradient_2StopGradient	add_8:z:0*
T0*
_output_shapes
:[
add_9AddV2truediv_2:z:0StopGradient_2:output:0*
T0*
_output_shapes
:8
Neg_4Neg	Pow_2:z:0*
T0*
_output_shapes
: M
add_10/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?N
add_10AddV2	Neg_4:y:0add_10/y:output:0*
T0*
_output_shapes
: M
mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?M
mul_10Mulmul_10/x:output:0
add_10:z:0*
T0*
_output_shapes
: L
sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?J
sub_2Sub	Pow_2:z:0sub_2/y:output:0*
T0*
_output_shapes
: ]
clip_by_value_1/MinimumMinimum	add_9:z:0	sub_2:z:0*
T0*
_output_shapes
:h
clip_by_value_1Maximumclip_by_value_1/Minimum:z:0
mul_10:z:0*
T0*
_output_shapes
:R
mul_11Mul	Pow_3:z:0clip_by_value_1:z:0*
T0*
_output_shapes
:P
	truediv_3RealDiv
mul_11:z:0	Pow_2:z:0*
T0*
_output_shapes
:M
mul_12/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?T
mul_12Mulmul_12/x:output:0truediv_3:z:0*
T0*
_output_shapes
:<
Neg_5Neg	add_2:z:0*
T0*
_output_shapes
:K
add_11AddV2	Neg_5:y:0
mul_12:z:0*
T0*
_output_shapes
:M
mul_13/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Q
mul_13Mulmul_13/x:output:0
add_11:z:0*
T0*
_output_shapes
:O
StopGradient_3StopGradient
mul_13:z:0*
T0*
_output_shapes
:X
add_12AddV2	add_2:z:0StopGradient_3:output:0*
T0*
_output_shapes
:W
MatMul_1MatMulinputs	add_7:z:0*
T0*'
_output_shapes
:€€€€€€€€€M
add_13/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:c
add_13AddV2moments/Squeeze_1:output:0add_13/y:output:0*
T0*
_output_shapes
:A
Rsqrt_2Rsqrt
add_13:z:0*
T0*
_output_shapes
:ґ
ReadVariableOp_2ReadVariableOp?batch_normalization_1_assignmovingavg_1_readvariableop_resource(^batch_normalization_1/AssignMovingAvg_1*
_output_shapes
:*
dtype0M
add_14/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:a
add_14AddV2ReadVariableOp_2:value:0add_14/y:output:0*
T0*
_output_shapes
:=
SqrtSqrt
add_14:z:0*
T0*
_output_shapes
:M
add_15/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:c
add_15AddV2moments/Squeeze_1:output:0add_15/y:output:0*
T0*
_output_shapes
:A
Rsqrt_3Rsqrt
add_15:z:0*
T0*
_output_shapes
:I
mul_14MulSqrt:y:0Rsqrt_3:y:0*
T0*
_output_shapes
:_
Mul_15MulMatMul_1:product:0
mul_14:z:0*
T0*'
_output_shapes
:€€€€€€€€€^
	BiasAdd_1BiasAdd
Mul_15:z:0
add_12:z:0*
T0*'
_output_shapes
:€€€€€€€€€a
IdentityIdentityBiasAdd_1:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€∆
NoOpNoOp^AssignAddVariableOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2^add_2/ReadVariableOp&^batch_normalization_1/AssignMovingAvg5^batch_normalization_1/AssignMovingAvg/ReadVariableOp(^batch_normalization_1/AssignMovingAvg_17^batch_normalization_1/AssignMovingAvg_1/ReadVariableOp/^batch_normalization_1/batchnorm/ReadVariableOp3^batch_normalization_1/batchnorm/mul/ReadVariableOp^mul/ReadVariableOp^mul_1/ReadVariableOp^mul_3/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":€€€€€€€€€ь: : : : : : : 2*
AssignAddVariableOpAssignAddVariableOp20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_22,
add_2/ReadVariableOpadd_2/ReadVariableOp2N
%batch_normalization_1/AssignMovingAvg%batch_normalization_1/AssignMovingAvg2l
4batch_normalization_1/AssignMovingAvg/ReadVariableOp4batch_normalization_1/AssignMovingAvg/ReadVariableOp2R
'batch_normalization_1/AssignMovingAvg_1'batch_normalization_1/AssignMovingAvg_12p
6batch_normalization_1/AssignMovingAvg_1/ReadVariableOp6batch_normalization_1/AssignMovingAvg_1/ReadVariableOp2`
.batch_normalization_1/batchnorm/ReadVariableOp.batch_normalization_1/batchnorm/ReadVariableOp2h
2batch_normalization_1/batchnorm/mul/ReadVariableOp2batch_normalization_1/batchnorm/mul/ReadVariableOp2(
mul/ReadVariableOpmul/ReadVariableOp2,
mul_1/ReadVariableOpmul_1/ReadVariableOp2,
mul_3/ReadVariableOpmul_3/ReadVariableOp:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
к	
”
*__inference_cicada-v2_layer_call_fn_262943

inputs!
unknown:
	unknown_0:	ь
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:
	unknown_6:	 
	unknown_7:
identityИҐStatefulPartitionedCallі
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€**
_read_only_resource_inputs

	*-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_cicada-v2_layer_call_and_return_conditional_losses_262425o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:€€€€€€€€€ь: : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
•%
Џ
E__inference_cicada-v2_layer_call_and_return_conditional_losses_262857
inputs_%
conv_262829: 
dense1_262835:	ь
dense1_262837:
dense1_262839:
dense1_262841:
dense1_262843:
dense1_262845:
dense1_262847:	 
dense2_262852:
identityИҐconv/StatefulPartitionedCallҐdense1/StatefulPartitionedCallҐdense2/StatefulPartitionedCallњ
reshape/PartitionedCallPartitionedCallinputs_*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_reshape_layer_call_and_return_conditional_losses_262019у
conv/StatefulPartitionedCallStatefulPartitionedCall reshape/PartitionedCall:output:0conv_262829*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€	*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *I
fDRB
@__inference_conv_layer_call_and_return_conditional_losses_262062ў
relu0/PartitionedCallPartitionedCall%conv/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_relu0_layer_call_and_return_conditional_losses_262115ѕ
flatten/PartitionedCallPartitionedCallrelu0/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€ь* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_flatten_layer_call_and_return_conditional_losses_262123’
dropout_1/PartitionedCallPartitionedCall flatten/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€ь* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_dropout_1_layer_call_and_return_conditional_losses_262130Ў
dense1/StatefulPartitionedCallStatefulPartitionedCall"dropout_1/PartitionedCall:output:0dense1_262835dense1_262837dense1_262839dense1_262841dense1_262843dense1_262845dense1_262847*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense1_layer_call_and_return_conditional_losses_262254”
relu1/PartitionedCallPartitionedCall'dense1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_relu1_layer_call_and_return_conditional_losses_262319“
dropout_2/PartitionedCallPartitionedCallrelu1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_dropout_2_layer_call_and_return_conditional_losses_262326у
dense2/StatefulPartitionedCallStatefulPartitionedCall"dropout_2/PartitionedCall:output:0dense2_262852*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense2_layer_call_and_return_conditional_losses_262369„
outputs/PartitionedCallPartitionedCall'dense2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_outputs_layer_call_and_return_conditional_losses_262422o
IdentityIdentity outputs/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€І
NoOpNoOp^conv/StatefulPartitionedCall^dense1/StatefulPartitionedCall^dense2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:€€€€€€€€€ь: : : : : : : : : 2<
conv/StatefulPartitionedCallconv/StatefulPartitionedCall2@
dense1/StatefulPartitionedCalldense1/StatefulPartitionedCall2@
dense2/StatefulPartitionedCalldense2/StatefulPartitionedCall:Q M
(
_output_shapes
:€€€€€€€€€ь
!
_user_specified_name	inputs_
ю
√
B__inference_dense2_layer_call_and_return_conditional_losses_262369

inputs)
readvariableop_resource:
identityИҐReadVariableOpҐReadVariableOp_1ҐReadVariableOp_2J
Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  0AK
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: L
Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: f
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes

:*
dtype0T
mulMulReadVariableOp:value:0Pow:z:0*
T0*
_output_shapes

:O
truedivRealDivmul:z:0	Pow_1:z:0*
T0*
_output_shapes

:@
NegNegtruediv:z:0*
T0*
_output_shapes

:D
RoundRoundtruediv:z:0*
T0*
_output_shapes

:I
addAddV2Neg:y:0	Round:y:0*
T0*
_output_shapes

:N
StopGradientStopGradientadd:z:0*
T0*
_output_shapes

:[
add_1AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes

:6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?L
add_2AddV2	Neg_1:y:0add_2/y:output:0*
T0*
_output_shapes
: L
mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?J
mul_1Mulmul_1/x:output:0	add_2:z:0*
T0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?D
subSubPow:z:0sub/y:output:0*
T0*
_output_shapes
: ]
clip_by_value/MinimumMinimum	add_1:z:0sub:z:0*
T0*
_output_shapes

:g
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_1:z:0*
T0*
_output_shapes

:S
mul_2Mul	Pow_1:z:0clip_by_value:z:0*
T0*
_output_shapes

:Q
	truediv_1RealDiv	mul_2:z:0Pow:z:0*
T0*
_output_shapes

:L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?V
mul_3Mulmul_3/x:output:0truediv_1:z:0*
T0*
_output_shapes

:h
ReadVariableOp_1ReadVariableOpreadvariableop_resource*
_output_shapes

:*
dtype0O
Neg_2NegReadVariableOp_1:value:0*
T0*
_output_shapes

:M
add_3AddV2	Neg_2:y:0	mul_3:z:0*
T0*
_output_shapes

:L
mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?R
mul_4Mulmul_4/x:output:0	add_3:z:0*
T0*
_output_shapes

:R
StopGradient_1StopGradient	mul_4:z:0*
T0*
_output_shapes

:h
ReadVariableOp_2ReadVariableOpreadvariableop_resource*
_output_shapes

:*
dtype0j
add_4AddV2ReadVariableOp_2:value:0StopGradient_1:output:0*
T0*
_output_shapes

:U
MatMulMatMulinputs	add_4:z:0*
T0*'
_output_shapes
:€€€€€€€€€_
IdentityIdentityMatMul:product:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€}
NoOpNoOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:€€€€€€€€€: 2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_2:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
и	
”
*__inference_cicada-v2_layer_call_fn_262966

inputs!
unknown:
	unknown_0:	ь
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:
	unknown_6:	 
	unknown_7:
identityИҐStatefulPartitionedCall≤
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*(
_read_only_resource_inputs

	*-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_cicada-v2_layer_call_and_return_conditional_losses_262781o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:€€€€€€€€€ь: : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
л	
‘
*__inference_cicada-v2_layer_call_fn_262825
inputs_!
unknown:
	unknown_0:	ь
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:
	unknown_6:	 
	unknown_7:
identityИҐStatefulPartitionedCall≥
StatefulPartitionedCallStatefulPartitionedCallinputs_unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*(
_read_only_resource_inputs

	*-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_cicada-v2_layer_call_and_return_conditional_losses_262781o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:€€€€€€€€€ь: : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:€€€€€€€€€ь
!
_user_specified_name	inputs_
Юr
ю
"__inference__traced_restore_264625
file_prefix6
assignvariableop_conv_kernel:3
 assignvariableop_1_dense1_kernel:	ь,
assignvariableop_2_dense1_bias:-
#assignvariableop_3_dense1_iteration:	 2
 assignvariableop_4_dense2_kernel:C
5assignvariableop_5_dense1_batch_normalization_1_gamma:B
4assignvariableop_6_dense1_batch_normalization_1_beta:I
;assignvariableop_7_dense1_batch_normalization_1_moving_mean:M
?assignvariableop_8_dense1_batch_normalization_1_moving_variance:&
assignvariableop_9_adam_iter:	 )
assignvariableop_10_adam_beta_1: )
assignvariableop_11_adam_beta_2: (
assignvariableop_12_adam_decay: 0
&assignvariableop_13_adam_learning_rate: #
assignvariableop_14_total: #
assignvariableop_15_count: @
&assignvariableop_16_adam_conv_kernel_m:;
(assignvariableop_17_adam_dense1_kernel_m:	ь4
&assignvariableop_18_adam_dense1_bias_m::
(assignvariableop_19_adam_dense2_kernel_m:K
=assignvariableop_20_adam_dense1_batch_normalization_1_gamma_m:J
<assignvariableop_21_adam_dense1_batch_normalization_1_beta_m:@
&assignvariableop_22_adam_conv_kernel_v:;
(assignvariableop_23_adam_dense1_kernel_v:	ь4
&assignvariableop_24_adam_dense1_bias_v::
(assignvariableop_25_adam_dense2_kernel_v:K
=assignvariableop_26_adam_dense1_batch_normalization_1_gamma_v:J
<assignvariableop_27_adam_dense1_batch_normalization_1_beta_v:
identity_29ИҐAssignVariableOpҐAssignVariableOp_1ҐAssignVariableOp_10ҐAssignVariableOp_11ҐAssignVariableOp_12ҐAssignVariableOp_13ҐAssignVariableOp_14ҐAssignVariableOp_15ҐAssignVariableOp_16ҐAssignVariableOp_17ҐAssignVariableOp_18ҐAssignVariableOp_19ҐAssignVariableOp_2ҐAssignVariableOp_20ҐAssignVariableOp_21ҐAssignVariableOp_22ҐAssignVariableOp_23ҐAssignVariableOp_24ҐAssignVariableOp_25ҐAssignVariableOp_26ҐAssignVariableOp_27ҐAssignVariableOp_3ҐAssignVariableOp_4ҐAssignVariableOp_5ҐAssignVariableOp_6ҐAssignVariableOp_7ҐAssignVariableOp_8ҐAssignVariableOp_9ƒ
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*к
valueаBЁB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-1/_iteration/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH™
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*M
valueDBBB B B B B B B B B B B B B B B B B B B B B B B B B B B B B ∞
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*И
_output_shapesv
t:::::::::::::::::::::::::::::*+
dtypes!
2		[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:З
AssignVariableOpAssignVariableOpassignvariableop_conv_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:П
AssignVariableOp_1AssignVariableOp assignvariableop_1_dense1_kernelIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:Н
AssignVariableOp_2AssignVariableOpassignvariableop_2_dense1_biasIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0	*
_output_shapes
:Т
AssignVariableOp_3AssignVariableOp#assignvariableop_3_dense1_iterationIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:П
AssignVariableOp_4AssignVariableOp assignvariableop_4_dense2_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:§
AssignVariableOp_5AssignVariableOp5assignvariableop_5_dense1_batch_normalization_1_gammaIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:£
AssignVariableOp_6AssignVariableOp4assignvariableop_6_dense1_batch_normalization_1_betaIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:™
AssignVariableOp_7AssignVariableOp;assignvariableop_7_dense1_batch_normalization_1_moving_meanIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:Ѓ
AssignVariableOp_8AssignVariableOp?assignvariableop_8_dense1_batch_normalization_1_moving_varianceIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0	*
_output_shapes
:Л
AssignVariableOp_9AssignVariableOpassignvariableop_9_adam_iterIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:Р
AssignVariableOp_10AssignVariableOpassignvariableop_10_adam_beta_1Identity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:Р
AssignVariableOp_11AssignVariableOpassignvariableop_11_adam_beta_2Identity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:П
AssignVariableOp_12AssignVariableOpassignvariableop_12_adam_decayIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:Ч
AssignVariableOp_13AssignVariableOp&assignvariableop_13_adam_learning_rateIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:К
AssignVariableOp_14AssignVariableOpassignvariableop_14_totalIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:К
AssignVariableOp_15AssignVariableOpassignvariableop_15_countIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:Ч
AssignVariableOp_16AssignVariableOp&assignvariableop_16_adam_conv_kernel_mIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:Щ
AssignVariableOp_17AssignVariableOp(assignvariableop_17_adam_dense1_kernel_mIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:Ч
AssignVariableOp_18AssignVariableOp&assignvariableop_18_adam_dense1_bias_mIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:Щ
AssignVariableOp_19AssignVariableOp(assignvariableop_19_adam_dense2_kernel_mIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:Ѓ
AssignVariableOp_20AssignVariableOp=assignvariableop_20_adam_dense1_batch_normalization_1_gamma_mIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:≠
AssignVariableOp_21AssignVariableOp<assignvariableop_21_adam_dense1_batch_normalization_1_beta_mIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:Ч
AssignVariableOp_22AssignVariableOp&assignvariableop_22_adam_conv_kernel_vIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:Щ
AssignVariableOp_23AssignVariableOp(assignvariableop_23_adam_dense1_kernel_vIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:Ч
AssignVariableOp_24AssignVariableOp&assignvariableop_24_adam_dense1_bias_vIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:Щ
AssignVariableOp_25AssignVariableOp(assignvariableop_25_adam_dense2_kernel_vIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:Ѓ
AssignVariableOp_26AssignVariableOp=assignvariableop_26_adam_dense1_batch_normalization_1_gamma_vIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:≠
AssignVariableOp_27AssignVariableOp<assignvariableop_27_adam_dense1_batch_normalization_1_beta_vIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 Ј
Identity_28Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_29IdentityIdentity_28:output:0^NoOp_1*
T0*
_output_shapes
: §
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_29Identity_29:output:0*M
_input_shapes<
:: : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
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
AssignVariableOp_27AssignVariableOp_272(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
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
Ы
D
(__inference_outputs_layer_call_fn_264295

inputs
identityЃ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_outputs_layer_call_and_return_conditional_losses_262422`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
ЦЛ
Щ
B__inference_dense1_layer_call_and_return_conditional_losses_262658

inputs1
matmul_readvariableop_resource:	ь-
biasadd_readvariableop_resource:K
=batch_normalization_1_assignmovingavg_readvariableop_resource:M
?batch_normalization_1_assignmovingavg_1_readvariableop_resource:I
;batch_normalization_1_batchnorm_mul_readvariableop_resource:E
7batch_normalization_1_batchnorm_readvariableop_resource:&
assignaddvariableop_resource:	 
identityИҐAssignAddVariableOpҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpҐReadVariableOpҐReadVariableOp_1ҐReadVariableOp_2Ґadd_2/ReadVariableOpҐ%batch_normalization_1/AssignMovingAvgҐ4batch_normalization_1/AssignMovingAvg/ReadVariableOpҐ'batch_normalization_1/AssignMovingAvg_1Ґ6batch_normalization_1/AssignMovingAvg_1/ReadVariableOpҐ.batch_normalization_1/batchnorm/ReadVariableOpҐ2batch_normalization_1/batchnorm/mul/ReadVariableOpҐmul/ReadVariableOpҐmul_1/ReadVariableOpҐmul_3/ReadVariableOpH
Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Zu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€~
4batch_normalization_1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: µ
"batch_normalization_1/moments/meanMeanBiasAdd:output:0=batch_normalization_1/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(Р
*batch_normalization_1/moments/StopGradientStopGradient+batch_normalization_1/moments/mean:output:0*
T0*
_output_shapes

:љ
/batch_normalization_1/moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:03batch_normalization_1/moments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€В
8batch_normalization_1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: а
&batch_normalization_1/moments/varianceMean3batch_normalization_1/moments/SquaredDifference:z:0Abatch_normalization_1/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(Щ
%batch_normalization_1/moments/SqueezeSqueeze+batch_normalization_1/moments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 Я
'batch_normalization_1/moments/Squeeze_1Squeeze/batch_normalization_1/moments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 p
+batch_normalization_1/AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
„#<Ѓ
4batch_normalization_1/AssignMovingAvg/ReadVariableOpReadVariableOp=batch_normalization_1_assignmovingavg_readvariableop_resource*
_output_shapes
:*
dtype0√
)batch_normalization_1/AssignMovingAvg/subSub<batch_normalization_1/AssignMovingAvg/ReadVariableOp:value:0.batch_normalization_1/moments/Squeeze:output:0*
T0*
_output_shapes
:Ї
)batch_normalization_1/AssignMovingAvg/mulMul-batch_normalization_1/AssignMovingAvg/sub:z:04batch_normalization_1/AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:Д
%batch_normalization_1/AssignMovingAvgAssignSubVariableOp=batch_normalization_1_assignmovingavg_readvariableop_resource-batch_normalization_1/AssignMovingAvg/mul:z:05^batch_normalization_1/AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0r
-batch_normalization_1/AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
„#<≤
6batch_normalization_1/AssignMovingAvg_1/ReadVariableOpReadVariableOp?batch_normalization_1_assignmovingavg_1_readvariableop_resource*
_output_shapes
:*
dtype0…
+batch_normalization_1/AssignMovingAvg_1/subSub>batch_normalization_1/AssignMovingAvg_1/ReadVariableOp:value:00batch_normalization_1/moments/Squeeze_1:output:0*
T0*
_output_shapes
:ј
+batch_normalization_1/AssignMovingAvg_1/mulMul/batch_normalization_1/AssignMovingAvg_1/sub:z:06batch_normalization_1/AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:М
'batch_normalization_1/AssignMovingAvg_1AssignSubVariableOp?batch_normalization_1_assignmovingavg_1_readvariableop_resource/batch_normalization_1/AssignMovingAvg_1/mul:z:07^batch_normalization_1/AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0j
%batch_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:≥
#batch_normalization_1/batchnorm/addAddV20batch_normalization_1/moments/Squeeze_1:output:0.batch_normalization_1/batchnorm/add/y:output:0*
T0*
_output_shapes
:|
%batch_normalization_1/batchnorm/RsqrtRsqrt'batch_normalization_1/batchnorm/add:z:0*
T0*
_output_shapes
:™
2batch_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0ґ
#batch_normalization_1/batchnorm/mulMul)batch_normalization_1/batchnorm/Rsqrt:y:0:batch_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:Щ
%batch_normalization_1/batchnorm/mul_1MulBiasAdd:output:0'batch_normalization_1/batchnorm/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€™
%batch_normalization_1/batchnorm/mul_2Mul.batch_normalization_1/moments/Squeeze:output:0'batch_normalization_1/batchnorm/mul:z:0*
T0*
_output_shapes
:Ґ
.batch_normalization_1/batchnorm/ReadVariableOpReadVariableOp7batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0≤
#batch_normalization_1/batchnorm/subSub6batch_normalization_1/batchnorm/ReadVariableOp:value:0)batch_normalization_1/batchnorm/mul_2:z:0*
T0*
_output_shapes
:і
%batch_normalization_1/batchnorm/add_1AddV2)batch_normalization_1/batchnorm/mul_1:z:0'batch_normalization_1/batchnorm/sub:z:0*
T0*'
_output_shapes
:€€€€€€€€€G
ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R{
AssignAddVariableOpAssignAddVariableOpassignaddvariableop_resourceConst:output:0*
_output_shapes
 *
dtype0	h
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Й
moments/meanMeanBiasAdd:output:0'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:С
moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:0moments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Ю
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(m
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 s
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 і
ReadVariableOpReadVariableOp?batch_normalization_1_assignmovingavg_1_readvariableop_resource(^batch_normalization_1/AssignMovingAvg_1*
_output_shapes
:*
dtype0J
add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:Y
addAddV2ReadVariableOp:value:0add/y:output:0*
T0*
_output_shapes
:<
RsqrtRsqrtadd:z:0*
T0*
_output_shapes
:L
add_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:a
add_1AddV2moments/Squeeze_1:output:0add_1/y:output:0*
T0*
_output_shapes
:@
Rsqrt_1Rsqrt	add_1:z:0*
T0*
_output_shapes
:К
mul/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0V
mulMul	Rsqrt:y:0mul/ReadVariableOp:value:0*
T0*
_output_shapes
:М
mul_1/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0\
mul_1MulRsqrt_1:y:0mul_1/ReadVariableOp:value:0*
T0*
_output_shapes
:l
ReadVariableOp_1ReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0c
subSubReadVariableOp_1:value:0moments/Squeeze:output:0*
T0*
_output_shapes
:E
mul_2Mul	mul_1:z:0sub:z:0*
T0*
_output_shapes
:И
add_2/ReadVariableOpReadVariableOp7batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0\
add_2AddV2	mul_2:z:0add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:t
mul_3/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0]
mul_3Mulmul:z:0mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	ьJ
Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  а@K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: L
Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: J
mul_4Mul	mul_3:z:0Pow:z:0*
T0*
_output_shapes
:	ьR
truedivRealDiv	mul_4:z:0	Pow_1:z:0*
T0*
_output_shapes
:	ьA
NegNegtruediv:z:0*
T0*
_output_shapes
:	ьE
RoundRoundtruediv:z:0*
T0*
_output_shapes
:	ьL
add_3AddV2Neg:y:0	Round:y:0*
T0*
_output_shapes
:	ьQ
StopGradientStopGradient	add_3:z:0*
T0*
_output_shapes
:	ь\
add_4AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes
:	ь6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?L
add_5AddV2	Neg_1:y:0add_5/y:output:0*
T0*
_output_shapes
: L
mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?J
mul_5Mulmul_5/x:output:0	add_5:z:0*
T0*
_output_shapes
: L
sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?H
sub_1SubPow:z:0sub_1/y:output:0*
T0*
_output_shapes
: `
clip_by_value/MinimumMinimum	add_4:z:0	sub_1:z:0*
T0*
_output_shapes
:	ьh
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_5:z:0*
T0*
_output_shapes
:	ьT
mul_6Mul	Pow_1:z:0clip_by_value:z:0*
T0*
_output_shapes
:	ьR
	truediv_1RealDiv	mul_6:z:0Pow:z:0*
T0*
_output_shapes
:	ьL
mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?W
mul_7Mulmul_7/x:output:0truediv_1:z:0*
T0*
_output_shapes
:	ьA
Neg_2Neg	mul_3:z:0*
T0*
_output_shapes
:	ьN
add_6AddV2	Neg_2:y:0	mul_7:z:0*
T0*
_output_shapes
:	ьL
mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?S
mul_8Mulmul_8/x:output:0	add_6:z:0*
T0*
_output_shapes
:	ьS
StopGradient_1StopGradient	mul_8:z:0*
T0*
_output_shapes
:	ь\
add_7AddV2	mul_3:z:0StopGradient_1:output:0*
T0*
_output_shapes
:	ьL
Pow_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  а@Q
Pow_2PowPow_2/x:output:0Pow_2/y:output:0*
T0*
_output_shapes
: L
Pow_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@Q
Pow_3PowPow_3/x:output:0Pow_3/y:output:0*
T0*
_output_shapes
: G
mul_9Mul	add_2:z:0	Pow_2:z:0*
T0*
_output_shapes
:O
	truediv_2RealDiv	mul_9:z:0	Pow_3:z:0*
T0*
_output_shapes
:@
Neg_3Negtruediv_2:z:0*
T0*
_output_shapes
:D
Round_1Roundtruediv_2:z:0*
T0*
_output_shapes
:K
add_8AddV2	Neg_3:y:0Round_1:y:0*
T0*
_output_shapes
:N
StopGradient_2StopGradient	add_8:z:0*
T0*
_output_shapes
:[
add_9AddV2truediv_2:z:0StopGradient_2:output:0*
T0*
_output_shapes
:8
Neg_4Neg	Pow_2:z:0*
T0*
_output_shapes
: M
add_10/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?N
add_10AddV2	Neg_4:y:0add_10/y:output:0*
T0*
_output_shapes
: M
mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?M
mul_10Mulmul_10/x:output:0
add_10:z:0*
T0*
_output_shapes
: L
sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?J
sub_2Sub	Pow_2:z:0sub_2/y:output:0*
T0*
_output_shapes
: ]
clip_by_value_1/MinimumMinimum	add_9:z:0	sub_2:z:0*
T0*
_output_shapes
:h
clip_by_value_1Maximumclip_by_value_1/Minimum:z:0
mul_10:z:0*
T0*
_output_shapes
:R
mul_11Mul	Pow_3:z:0clip_by_value_1:z:0*
T0*
_output_shapes
:P
	truediv_3RealDiv
mul_11:z:0	Pow_2:z:0*
T0*
_output_shapes
:M
mul_12/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?T
mul_12Mulmul_12/x:output:0truediv_3:z:0*
T0*
_output_shapes
:<
Neg_5Neg	add_2:z:0*
T0*
_output_shapes
:K
add_11AddV2	Neg_5:y:0
mul_12:z:0*
T0*
_output_shapes
:M
mul_13/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Q
mul_13Mulmul_13/x:output:0
add_11:z:0*
T0*
_output_shapes
:O
StopGradient_3StopGradient
mul_13:z:0*
T0*
_output_shapes
:X
add_12AddV2	add_2:z:0StopGradient_3:output:0*
T0*
_output_shapes
:W
MatMul_1MatMulinputs	add_7:z:0*
T0*'
_output_shapes
:€€€€€€€€€M
add_13/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:c
add_13AddV2moments/Squeeze_1:output:0add_13/y:output:0*
T0*
_output_shapes
:A
Rsqrt_2Rsqrt
add_13:z:0*
T0*
_output_shapes
:ґ
ReadVariableOp_2ReadVariableOp?batch_normalization_1_assignmovingavg_1_readvariableop_resource(^batch_normalization_1/AssignMovingAvg_1*
_output_shapes
:*
dtype0M
add_14/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:a
add_14AddV2ReadVariableOp_2:value:0add_14/y:output:0*
T0*
_output_shapes
:=
SqrtSqrt
add_14:z:0*
T0*
_output_shapes
:M
add_15/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:c
add_15AddV2moments/Squeeze_1:output:0add_15/y:output:0*
T0*
_output_shapes
:A
Rsqrt_3Rsqrt
add_15:z:0*
T0*
_output_shapes
:I
mul_14MulSqrt:y:0Rsqrt_3:y:0*
T0*
_output_shapes
:_
Mul_15MulMatMul_1:product:0
mul_14:z:0*
T0*'
_output_shapes
:€€€€€€€€€^
	BiasAdd_1BiasAdd
Mul_15:z:0
add_12:z:0*
T0*'
_output_shapes
:€€€€€€€€€a
IdentityIdentityBiasAdd_1:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€∆
NoOpNoOp^AssignAddVariableOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2^add_2/ReadVariableOp&^batch_normalization_1/AssignMovingAvg5^batch_normalization_1/AssignMovingAvg/ReadVariableOp(^batch_normalization_1/AssignMovingAvg_17^batch_normalization_1/AssignMovingAvg_1/ReadVariableOp/^batch_normalization_1/batchnorm/ReadVariableOp3^batch_normalization_1/batchnorm/mul/ReadVariableOp^mul/ReadVariableOp^mul_1/ReadVariableOp^mul_3/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":€€€€€€€€€ь: : : : : : : 2*
AssignAddVariableOpAssignAddVariableOp20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_22,
add_2/ReadVariableOpadd_2/ReadVariableOp2N
%batch_normalization_1/AssignMovingAvg%batch_normalization_1/AssignMovingAvg2l
4batch_normalization_1/AssignMovingAvg/ReadVariableOp4batch_normalization_1/AssignMovingAvg/ReadVariableOp2R
'batch_normalization_1/AssignMovingAvg_1'batch_normalization_1/AssignMovingAvg_12p
6batch_normalization_1/AssignMovingAvg_1/ReadVariableOp6batch_normalization_1/AssignMovingAvg_1/ReadVariableOp2`
.batch_normalization_1/batchnorm/ReadVariableOp.batch_normalization_1/batchnorm/ReadVariableOp2h
2batch_normalization_1/batchnorm/mul/ReadVariableOp2batch_normalization_1/batchnorm/mul/ReadVariableOp2(
mul/ReadVariableOpmul/ReadVariableOp2,
mul_1/ReadVariableOpmul_1/ReadVariableOp2,
mul_3/ReadVariableOpmul_3/ReadVariableOp:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
В	
О
'__inference_dense1_layer_call_fn_263892

inputs
unknown:	ь
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:	 
identityИҐStatefulPartitionedCallХ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense1_layer_call_and_return_conditional_losses_262658o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":€€€€€€€€€ь: : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
ч
…
@__inference_conv_layer_call_and_return_conditional_losses_262062

inputs1
readvariableop_resource:
identityИҐReadVariableOpҐReadVariableOp_1ҐReadVariableOp_2J
Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  0AK
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: L
Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: n
ReadVariableOpReadVariableOpreadvariableop_resource*&
_output_shapes
:*
dtype0\
mulMulReadVariableOp:value:0Pow:z:0*
T0*&
_output_shapes
:W
truedivRealDivmul:z:0	Pow_1:z:0*
T0*&
_output_shapes
:H
NegNegtruediv:z:0*
T0*&
_output_shapes
:L
RoundRoundtruediv:z:0*
T0*&
_output_shapes
:Q
addAddV2Neg:y:0	Round:y:0*
T0*&
_output_shapes
:V
StopGradientStopGradientadd:z:0*
T0*&
_output_shapes
:c
add_1AddV2truediv:z:0StopGradient:output:0*
T0*&
_output_shapes
:6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?L
add_2AddV2	Neg_1:y:0add_2/y:output:0*
T0*
_output_shapes
: L
mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?J
mul_1Mulmul_1/x:output:0	add_2:z:0*
T0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?D
subSubPow:z:0sub/y:output:0*
T0*
_output_shapes
: e
clip_by_value/MinimumMinimum	add_1:z:0sub:z:0*
T0*&
_output_shapes
:o
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_1:z:0*
T0*&
_output_shapes
:[
mul_2Mul	Pow_1:z:0clip_by_value:z:0*
T0*&
_output_shapes
:Y
	truediv_1RealDiv	mul_2:z:0Pow:z:0*
T0*&
_output_shapes
:L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?^
mul_3Mulmul_3/x:output:0truediv_1:z:0*
T0*&
_output_shapes
:p
ReadVariableOp_1ReadVariableOpreadvariableop_resource*&
_output_shapes
:*
dtype0W
Neg_2NegReadVariableOp_1:value:0*
T0*&
_output_shapes
:U
add_3AddV2	Neg_2:y:0	mul_3:z:0*
T0*&
_output_shapes
:L
mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Z
mul_4Mulmul_4/x:output:0	add_3:z:0*
T0*&
_output_shapes
:Z
StopGradient_1StopGradient	mul_4:z:0*
T0*&
_output_shapes
:p
ReadVariableOp_2ReadVariableOpreadvariableop_resource*&
_output_shapes
:*
dtype0r
add_4AddV2ReadVariableOp_2:value:0StopGradient_1:output:0*
T0*&
_output_shapes
:Л
convolutionConv2Dinputs	add_4:z:0*
T0*/
_output_shapes
:€€€€€€€€€	*
paddingVALID*
strides
k
IdentityIdentityconvolution:output:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€	}
NoOpNoOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:€€€€€€€€€: 2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_2:W S
/
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
цф
∆
!__inference__wrapped_model_261916
inputs_@
&cicada_v2_conv_readvariableop_resource:B
/cicada_v2_dense1_matmul_readvariableop_resource:	ь>
0cicada_v2_dense1_biasadd_readvariableop_resource:V
Hcicada_v2_dense1_batch_normalization_1_batchnorm_readvariableop_resource:Z
Lcicada_v2_dense1_batch_normalization_1_batchnorm_mul_readvariableop_resource:X
Jcicada_v2_dense1_batch_normalization_1_batchnorm_readvariableop_1_resource:X
Jcicada_v2_dense1_batch_normalization_1_batchnorm_readvariableop_2_resource:7
-cicada_v2_dense1_assignaddvariableop_resource:	 :
(cicada_v2_dense2_readvariableop_resource:
identityИҐcicada-v2/conv/ReadVariableOpҐcicada-v2/conv/ReadVariableOp_1Ґcicada-v2/conv/ReadVariableOp_2Ґ$cicada-v2/dense1/AssignAddVariableOpҐ'cicada-v2/dense1/BiasAdd/ReadVariableOpҐ&cicada-v2/dense1/MatMul/ReadVariableOpҐcicada-v2/dense1/ReadVariableOpҐ!cicada-v2/dense1/ReadVariableOp_1Ґ%cicada-v2/dense1/add_2/ReadVariableOpҐ?cicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOpҐAcicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_1ҐAcicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_2ҐCcicada-v2/dense1/batch_normalization_1/batchnorm/mul/ReadVariableOpҐ#cicada-v2/dense1/mul/ReadVariableOpҐ%cicada-v2/dense1/mul_1/ReadVariableOpҐ%cicada-v2/dense1/mul_3/ReadVariableOpҐ#cicada-v2/dense1/sub/ReadVariableOpҐcicada-v2/dense2/ReadVariableOpҐ!cicada-v2/dense2/ReadVariableOp_1Ґ!cicada-v2/dense2/ReadVariableOp_2N
cicada-v2/reshape/ShapeShapeinputs_*
T0*
_output_shapes
:o
%cicada-v2/reshape/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: q
'cicada-v2/reshape/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:q
'cicada-v2/reshape/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Ђ
cicada-v2/reshape/strided_sliceStridedSlice cicada-v2/reshape/Shape:output:0.cicada-v2/reshape/strided_slice/stack:output:00cicada-v2/reshape/strided_slice/stack_1:output:00cicada-v2/reshape/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskc
!cicada-v2/reshape/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :c
!cicada-v2/reshape/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :c
!cicada-v2/reshape/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :Г
cicada-v2/reshape/Reshape/shapePack(cicada-v2/reshape/strided_slice:output:0*cicada-v2/reshape/Reshape/shape/1:output:0*cicada-v2/reshape/Reshape/shape/2:output:0*cicada-v2/reshape/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:С
cicada-v2/reshape/ReshapeReshapeinputs_(cicada-v2/reshape/Reshape/shape:output:0*
T0*/
_output_shapes
:€€€€€€€€€Y
cicada-v2/conv/Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @Y
cicada-v2/conv/Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  0Ax
cicada-v2/conv/PowPowcicada-v2/conv/Pow/x:output:0cicada-v2/conv/Pow/y:output:0*
T0*
_output_shapes
: [
cicada-v2/conv/Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @[
cicada-v2/conv/Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@~
cicada-v2/conv/Pow_1Powcicada-v2/conv/Pow_1/x:output:0cicada-v2/conv/Pow_1/y:output:0*
T0*
_output_shapes
: М
cicada-v2/conv/ReadVariableOpReadVariableOp&cicada_v2_conv_readvariableop_resource*&
_output_shapes
:*
dtype0Й
cicada-v2/conv/mulMul%cicada-v2/conv/ReadVariableOp:value:0cicada-v2/conv/Pow:z:0*
T0*&
_output_shapes
:Д
cicada-v2/conv/truedivRealDivcicada-v2/conv/mul:z:0cicada-v2/conv/Pow_1:z:0*
T0*&
_output_shapes
:f
cicada-v2/conv/NegNegcicada-v2/conv/truediv:z:0*
T0*&
_output_shapes
:j
cicada-v2/conv/RoundRoundcicada-v2/conv/truediv:z:0*
T0*&
_output_shapes
:~
cicada-v2/conv/addAddV2cicada-v2/conv/Neg:y:0cicada-v2/conv/Round:y:0*
T0*&
_output_shapes
:t
cicada-v2/conv/StopGradientStopGradientcicada-v2/conv/add:z:0*
T0*&
_output_shapes
:Р
cicada-v2/conv/add_1AddV2cicada-v2/conv/truediv:z:0$cicada-v2/conv/StopGradient:output:0*
T0*&
_output_shapes
:T
cicada-v2/conv/Neg_1Negcicada-v2/conv/Pow:z:0*
T0*
_output_shapes
: [
cicada-v2/conv/add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?y
cicada-v2/conv/add_2AddV2cicada-v2/conv/Neg_1:y:0cicada-v2/conv/add_2/y:output:0*
T0*
_output_shapes
: [
cicada-v2/conv/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?w
cicada-v2/conv/mul_1Mulcicada-v2/conv/mul_1/x:output:0cicada-v2/conv/add_2:z:0*
T0*
_output_shapes
: Y
cicada-v2/conv/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?q
cicada-v2/conv/subSubcicada-v2/conv/Pow:z:0cicada-v2/conv/sub/y:output:0*
T0*
_output_shapes
: Т
$cicada-v2/conv/clip_by_value/MinimumMinimumcicada-v2/conv/add_1:z:0cicada-v2/conv/sub:z:0*
T0*&
_output_shapes
:Ь
cicada-v2/conv/clip_by_valueMaximum(cicada-v2/conv/clip_by_value/Minimum:z:0cicada-v2/conv/mul_1:z:0*
T0*&
_output_shapes
:И
cicada-v2/conv/mul_2Mulcicada-v2/conv/Pow_1:z:0 cicada-v2/conv/clip_by_value:z:0*
T0*&
_output_shapes
:Ж
cicada-v2/conv/truediv_1RealDivcicada-v2/conv/mul_2:z:0cicada-v2/conv/Pow:z:0*
T0*&
_output_shapes
:[
cicada-v2/conv/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Л
cicada-v2/conv/mul_3Mulcicada-v2/conv/mul_3/x:output:0cicada-v2/conv/truediv_1:z:0*
T0*&
_output_shapes
:О
cicada-v2/conv/ReadVariableOp_1ReadVariableOp&cicada_v2_conv_readvariableop_resource*&
_output_shapes
:*
dtype0u
cicada-v2/conv/Neg_2Neg'cicada-v2/conv/ReadVariableOp_1:value:0*
T0*&
_output_shapes
:В
cicada-v2/conv/add_3AddV2cicada-v2/conv/Neg_2:y:0cicada-v2/conv/mul_3:z:0*
T0*&
_output_shapes
:[
cicada-v2/conv/mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?З
cicada-v2/conv/mul_4Mulcicada-v2/conv/mul_4/x:output:0cicada-v2/conv/add_3:z:0*
T0*&
_output_shapes
:x
cicada-v2/conv/StopGradient_1StopGradientcicada-v2/conv/mul_4:z:0*
T0*&
_output_shapes
:О
cicada-v2/conv/ReadVariableOp_2ReadVariableOp&cicada_v2_conv_readvariableop_resource*&
_output_shapes
:*
dtype0Я
cicada-v2/conv/add_4AddV2'cicada-v2/conv/ReadVariableOp_2:value:0&cicada-v2/conv/StopGradient_1:output:0*
T0*&
_output_shapes
:≈
cicada-v2/conv/convolutionConv2D"cicada-v2/reshape/Reshape:output:0cicada-v2/conv/add_4:z:0*
T0*/
_output_shapes
:€€€€€€€€€	*
paddingVALID*
strides
W
cicada-v2/relu0/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :W
cicada-v2/relu0/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
{
cicada-v2/relu0/PowPowcicada-v2/relu0/Pow/x:output:0cicada-v2/relu0/Pow/y:output:0*
T0*
_output_shapes
: e
cicada-v2/relu0/CastCastcicada-v2/relu0/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: Y
cicada-v2/relu0/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :Y
cicada-v2/relu0/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :Б
cicada-v2/relu0/Pow_1Pow cicada-v2/relu0/Pow_1/x:output:0 cicada-v2/relu0/Pow_1/y:output:0*
T0*
_output_shapes
: i
cicada-v2/relu0/Cast_1Castcicada-v2/relu0/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: Z
cicada-v2/relu0/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @Z
cicada-v2/relu0/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :q
cicada-v2/relu0/Cast_2Cast!cicada-v2/relu0/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: Z
cicada-v2/relu0/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   Aw
cicada-v2/relu0/subSubcicada-v2/relu0/Cast_2:y:0cicada-v2/relu0/sub/y:output:0*
T0*
_output_shapes
: v
cicada-v2/relu0/Pow_2Powcicada-v2/relu0/Const:output:0cicada-v2/relu0/sub:z:0*
T0*
_output_shapes
: t
cicada-v2/relu0/sub_1Subcicada-v2/relu0/Cast_1:y:0cicada-v2/relu0/Pow_2:z:0*
T0*
_output_shapes
: †
cicada-v2/relu0/LessEqual	LessEqual#cicada-v2/conv/convolution:output:0cicada-v2/relu0/sub_1:z:0*
T0*/
_output_shapes
:€€€€€€€€€	{
cicada-v2/relu0/ReluRelu#cicada-v2/conv/convolution:output:0*
T0*/
_output_shapes
:€€€€€€€€€	r
cicada-v2/relu0/ones_like/ShapeShape#cicada-v2/conv/convolution:output:0*
T0*
_output_shapes
:d
cicada-v2/relu0/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?ѓ
cicada-v2/relu0/ones_likeFill(cicada-v2/relu0/ones_like/Shape:output:0(cicada-v2/relu0/ones_like/Const:output:0*
T0*/
_output_shapes
:€€€€€€€€€	t
cicada-v2/relu0/sub_2Subcicada-v2/relu0/Cast_1:y:0cicada-v2/relu0/Pow_2:z:0*
T0*
_output_shapes
: У
cicada-v2/relu0/mulMul"cicada-v2/relu0/ones_like:output:0cicada-v2/relu0/sub_2:z:0*
T0*/
_output_shapes
:€€€€€€€€€	Ї
cicada-v2/relu0/SelectV2SelectV2cicada-v2/relu0/LessEqual:z:0"cicada-v2/relu0/Relu:activations:0cicada-v2/relu0/mul:z:0*
T0*/
_output_shapes
:€€€€€€€€€	Х
cicada-v2/relu0/mul_1Mul#cicada-v2/conv/convolution:output:0cicada-v2/relu0/Cast:y:0*
T0*/
_output_shapes
:€€€€€€€€€	У
cicada-v2/relu0/truedivRealDivcicada-v2/relu0/mul_1:z:0cicada-v2/relu0/Cast_1:y:0*
T0*/
_output_shapes
:€€€€€€€€€	q
cicada-v2/relu0/NegNegcicada-v2/relu0/truediv:z:0*
T0*/
_output_shapes
:€€€€€€€€€	u
cicada-v2/relu0/RoundRoundcicada-v2/relu0/truediv:z:0*
T0*/
_output_shapes
:€€€€€€€€€	К
cicada-v2/relu0/addAddV2cicada-v2/relu0/Neg:y:0cicada-v2/relu0/Round:y:0*
T0*/
_output_shapes
:€€€€€€€€€	
cicada-v2/relu0/StopGradientStopGradientcicada-v2/relu0/add:z:0*
T0*/
_output_shapes
:€€€€€€€€€	Ь
cicada-v2/relu0/add_1AddV2cicada-v2/relu0/truediv:z:0%cicada-v2/relu0/StopGradient:output:0*
T0*/
_output_shapes
:€€€€€€€€€	У
cicada-v2/relu0/truediv_1RealDivcicada-v2/relu0/add_1:z:0cicada-v2/relu0/Cast:y:0*
T0*/
_output_shapes
:€€€€€€€€€	`
cicada-v2/relu0/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Е
cicada-v2/relu0/truediv_2RealDiv$cicada-v2/relu0/truediv_2/x:output:0cicada-v2/relu0/Cast:y:0*
T0*
_output_shapes
: \
cicada-v2/relu0/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?~
cicada-v2/relu0/sub_3Sub cicada-v2/relu0/sub_3/x:output:0cicada-v2/relu0/truediv_2:z:0*
T0*
_output_shapes
: §
%cicada-v2/relu0/clip_by_value/MinimumMinimumcicada-v2/relu0/truediv_1:z:0cicada-v2/relu0/sub_3:z:0*
T0*/
_output_shapes
:€€€€€€€€€	d
cicada-v2/relu0/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    Ј
cicada-v2/relu0/clip_by_valueMaximum)cicada-v2/relu0/clip_by_value/Minimum:z:0(cicada-v2/relu0/clip_by_value/y:output:0*
T0*/
_output_shapes
:€€€€€€€€€	Х
cicada-v2/relu0/mul_2Mulcicada-v2/relu0/Cast_1:y:0!cicada-v2/relu0/clip_by_value:z:0*
T0*/
_output_shapes
:€€€€€€€€€	y
cicada-v2/relu0/Neg_1Neg!cicada-v2/relu0/SelectV2:output:0*
T0*/
_output_shapes
:€€€€€€€€€	О
cicada-v2/relu0/add_2AddV2cicada-v2/relu0/Neg_1:y:0cicada-v2/relu0/mul_2:z:0*
T0*/
_output_shapes
:€€€€€€€€€	\
cicada-v2/relu0/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?У
cicada-v2/relu0/mul_3Mul cicada-v2/relu0/mul_3/x:output:0cicada-v2/relu0/add_2:z:0*
T0*/
_output_shapes
:€€€€€€€€€	Г
cicada-v2/relu0/StopGradient_1StopGradientcicada-v2/relu0/mul_3:z:0*
T0*/
_output_shapes
:€€€€€€€€€	§
cicada-v2/relu0/add_3AddV2!cicada-v2/relu0/SelectV2:output:0'cicada-v2/relu0/StopGradient_1:output:0*
T0*/
_output_shapes
:€€€€€€€€€	h
cicada-v2/flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€ь   Ф
cicada-v2/flatten/ReshapeReshapecicada-v2/relu0/add_3:z:0 cicada-v2/flatten/Const:output:0*
T0*(
_output_shapes
:€€€€€€€€€ь
cicada-v2/dropout_1/IdentityIdentity"cicada-v2/flatten/Reshape:output:0*
T0*(
_output_shapes
:€€€€€€€€€ьY
cicada-v2/dense1/Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Z Ч
&cicada-v2/dense1/MatMul/ReadVariableOpReadVariableOp/cicada_v2_dense1_matmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0™
cicada-v2/dense1/MatMulMatMul%cicada-v2/dropout_1/Identity:output:0.cicada-v2/dense1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€Ф
'cicada-v2/dense1/BiasAdd/ReadVariableOpReadVariableOp0cicada_v2_dense1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0©
cicada-v2/dense1/BiasAddBiasAdd!cicada-v2/dense1/MatMul:product:0/cicada-v2/dense1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€ƒ
?cicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOpReadVariableOpHcicada_v2_dense1_batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0{
6cicada-v2/dense1/batch_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:м
4cicada-v2/dense1/batch_normalization_1/batchnorm/addAddV2Gcicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp:value:0?cicada-v2/dense1/batch_normalization_1/batchnorm/add/y:output:0*
T0*
_output_shapes
:Ю
6cicada-v2/dense1/batch_normalization_1/batchnorm/RsqrtRsqrt8cicada-v2/dense1/batch_normalization_1/batchnorm/add:z:0*
T0*
_output_shapes
:ћ
Ccicada-v2/dense1/batch_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOpLcicada_v2_dense1_batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0й
4cicada-v2/dense1/batch_normalization_1/batchnorm/mulMul:cicada-v2/dense1/batch_normalization_1/batchnorm/Rsqrt:y:0Kcicada-v2/dense1/batch_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:ћ
6cicada-v2/dense1/batch_normalization_1/batchnorm/mul_1Mul!cicada-v2/dense1/BiasAdd:output:08cicada-v2/dense1/batch_normalization_1/batchnorm/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€»
Acicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_1ReadVariableOpJcicada_v2_dense1_batch_normalization_1_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0з
6cicada-v2/dense1/batch_normalization_1/batchnorm/mul_2MulIcicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_1:value:08cicada-v2/dense1/batch_normalization_1/batchnorm/mul:z:0*
T0*
_output_shapes
:»
Acicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_2ReadVariableOpJcicada_v2_dense1_batch_normalization_1_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0з
4cicada-v2/dense1/batch_normalization_1/batchnorm/subSubIcicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_2:value:0:cicada-v2/dense1/batch_normalization_1/batchnorm/mul_2:z:0*
T0*
_output_shapes
:з
6cicada-v2/dense1/batch_normalization_1/batchnorm/add_1AddV2:cicada-v2/dense1/batch_normalization_1/batchnorm/mul_1:z:08cicada-v2/dense1/batch_normalization_1/batchnorm/sub:z:0*
T0*'
_output_shapes
:€€€€€€€€€X
cicada-v2/dense1/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R Ѓ
$cicada-v2/dense1/AssignAddVariableOpAssignAddVariableOp-cicada_v2_dense1_assignaddvariableop_resourcecicada-v2/dense1/Const:output:0*
_output_shapes
 *
dtype0	y
/cicada-v2/dense1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Љ
cicada-v2/dense1/moments/meanMean!cicada-v2/dense1/BiasAdd:output:08cicada-v2/dense1/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(Ж
%cicada-v2/dense1/moments/StopGradientStopGradient&cicada-v2/dense1/moments/mean:output:0*
T0*
_output_shapes

:ƒ
*cicada-v2/dense1/moments/SquaredDifferenceSquaredDifference!cicada-v2/dense1/BiasAdd:output:0.cicada-v2/dense1/moments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€}
3cicada-v2/dense1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: —
!cicada-v2/dense1/moments/varianceMean.cicada-v2/dense1/moments/SquaredDifference:z:0<cicada-v2/dense1/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(П
 cicada-v2/dense1/moments/SqueezeSqueeze&cicada-v2/dense1/moments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 Х
"cicada-v2/dense1/moments/Squeeze_1Squeeze*cicada-v2/dense1/moments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 §
cicada-v2/dense1/ReadVariableOpReadVariableOpHcicada_v2_dense1_batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0[
cicada-v2/dense1/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:М
cicada-v2/dense1/addAddV2'cicada-v2/dense1/ReadVariableOp:value:0cicada-v2/dense1/add/y:output:0*
T0*
_output_shapes
:^
cicada-v2/dense1/RsqrtRsqrtcicada-v2/dense1/add:z:0*
T0*
_output_shapes
:]
cicada-v2/dense1/add_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:Ф
cicada-v2/dense1/add_1AddV2+cicada-v2/dense1/moments/Squeeze_1:output:0!cicada-v2/dense1/add_1/y:output:0*
T0*
_output_shapes
:b
cicada-v2/dense1/Rsqrt_1Rsqrtcicada-v2/dense1/add_1:z:0*
T0*
_output_shapes
:ђ
#cicada-v2/dense1/mul/ReadVariableOpReadVariableOpLcicada_v2_dense1_batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0Й
cicada-v2/dense1/mulMulcicada-v2/dense1/Rsqrt:y:0+cicada-v2/dense1/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:Ѓ
%cicada-v2/dense1/mul_1/ReadVariableOpReadVariableOpLcicada_v2_dense1_batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0П
cicada-v2/dense1/mul_1Mulcicada-v2/dense1/Rsqrt_1:y:0-cicada-v2/dense1/mul_1/ReadVariableOp:value:0*
T0*
_output_shapes
:О
!cicada-v2/dense1/ReadVariableOp_1ReadVariableOp0cicada_v2_dense1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0™
#cicada-v2/dense1/sub/ReadVariableOpReadVariableOpJcicada_v2_dense1_batch_normalization_1_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0Ш
cicada-v2/dense1/subSub)cicada-v2/dense1/ReadVariableOp_1:value:0+cicada-v2/dense1/sub/ReadVariableOp:value:0*
T0*
_output_shapes
:v
cicada-v2/dense1/mul_2Mulcicada-v2/dense1/mul:z:0cicada-v2/dense1/sub:z:0*
T0*
_output_shapes
:ђ
%cicada-v2/dense1/add_2/ReadVariableOpReadVariableOpJcicada_v2_dense1_batch_normalization_1_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0П
cicada-v2/dense1/add_2AddV2cicada-v2/dense1/mul_2:z:0-cicada-v2/dense1/add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:Ц
%cicada-v2/dense1/mul_3/ReadVariableOpReadVariableOp/cicada_v2_dense1_matmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0Р
cicada-v2/dense1/mul_3Mulcicada-v2/dense1/mul:z:0-cicada-v2/dense1/mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	ь[
cicada-v2/dense1/Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @[
cicada-v2/dense1/Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  а@~
cicada-v2/dense1/PowPowcicada-v2/dense1/Pow/x:output:0cicada-v2/dense1/Pow/y:output:0*
T0*
_output_shapes
: ]
cicada-v2/dense1/Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @]
cicada-v2/dense1/Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Д
cicada-v2/dense1/Pow_1Pow!cicada-v2/dense1/Pow_1/x:output:0!cicada-v2/dense1/Pow_1/y:output:0*
T0*
_output_shapes
: }
cicada-v2/dense1/mul_4Mulcicada-v2/dense1/mul_3:z:0cicada-v2/dense1/Pow:z:0*
T0*
_output_shapes
:	ьЕ
cicada-v2/dense1/truedivRealDivcicada-v2/dense1/mul_4:z:0cicada-v2/dense1/Pow_1:z:0*
T0*
_output_shapes
:	ьc
cicada-v2/dense1/NegNegcicada-v2/dense1/truediv:z:0*
T0*
_output_shapes
:	ьg
cicada-v2/dense1/RoundRoundcicada-v2/dense1/truediv:z:0*
T0*
_output_shapes
:	ь
cicada-v2/dense1/add_3AddV2cicada-v2/dense1/Neg:y:0cicada-v2/dense1/Round:y:0*
T0*
_output_shapes
:	ьs
cicada-v2/dense1/StopGradientStopGradientcicada-v2/dense1/add_3:z:0*
T0*
_output_shapes
:	ьП
cicada-v2/dense1/add_4AddV2cicada-v2/dense1/truediv:z:0&cicada-v2/dense1/StopGradient:output:0*
T0*
_output_shapes
:	ьX
cicada-v2/dense1/Neg_1Negcicada-v2/dense1/Pow:z:0*
T0*
_output_shapes
: ]
cicada-v2/dense1/add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?
cicada-v2/dense1/add_5AddV2cicada-v2/dense1/Neg_1:y:0!cicada-v2/dense1/add_5/y:output:0*
T0*
_output_shapes
: ]
cicada-v2/dense1/mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?}
cicada-v2/dense1/mul_5Mul!cicada-v2/dense1/mul_5/x:output:0cicada-v2/dense1/add_5:z:0*
T0*
_output_shapes
: ]
cicada-v2/dense1/sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?{
cicada-v2/dense1/sub_1Subcicada-v2/dense1/Pow:z:0!cicada-v2/dense1/sub_1/y:output:0*
T0*
_output_shapes
: У
&cicada-v2/dense1/clip_by_value/MinimumMinimumcicada-v2/dense1/add_4:z:0cicada-v2/dense1/sub_1:z:0*
T0*
_output_shapes
:	ьЫ
cicada-v2/dense1/clip_by_valueMaximum*cicada-v2/dense1/clip_by_value/Minimum:z:0cicada-v2/dense1/mul_5:z:0*
T0*
_output_shapes
:	ьЗ
cicada-v2/dense1/mul_6Mulcicada-v2/dense1/Pow_1:z:0"cicada-v2/dense1/clip_by_value:z:0*
T0*
_output_shapes
:	ьЕ
cicada-v2/dense1/truediv_1RealDivcicada-v2/dense1/mul_6:z:0cicada-v2/dense1/Pow:z:0*
T0*
_output_shapes
:	ь]
cicada-v2/dense1/mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?К
cicada-v2/dense1/mul_7Mul!cicada-v2/dense1/mul_7/x:output:0cicada-v2/dense1/truediv_1:z:0*
T0*
_output_shapes
:	ьc
cicada-v2/dense1/Neg_2Negcicada-v2/dense1/mul_3:z:0*
T0*
_output_shapes
:	ьБ
cicada-v2/dense1/add_6AddV2cicada-v2/dense1/Neg_2:y:0cicada-v2/dense1/mul_7:z:0*
T0*
_output_shapes
:	ь]
cicada-v2/dense1/mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Ж
cicada-v2/dense1/mul_8Mul!cicada-v2/dense1/mul_8/x:output:0cicada-v2/dense1/add_6:z:0*
T0*
_output_shapes
:	ьu
cicada-v2/dense1/StopGradient_1StopGradientcicada-v2/dense1/mul_8:z:0*
T0*
_output_shapes
:	ьП
cicada-v2/dense1/add_7AddV2cicada-v2/dense1/mul_3:z:0(cicada-v2/dense1/StopGradient_1:output:0*
T0*
_output_shapes
:	ь]
cicada-v2/dense1/Pow_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @]
cicada-v2/dense1/Pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  а@Д
cicada-v2/dense1/Pow_2Pow!cicada-v2/dense1/Pow_2/x:output:0!cicada-v2/dense1/Pow_2/y:output:0*
T0*
_output_shapes
: ]
cicada-v2/dense1/Pow_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @]
cicada-v2/dense1/Pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@Д
cicada-v2/dense1/Pow_3Pow!cicada-v2/dense1/Pow_3/x:output:0!cicada-v2/dense1/Pow_3/y:output:0*
T0*
_output_shapes
: z
cicada-v2/dense1/mul_9Mulcicada-v2/dense1/add_2:z:0cicada-v2/dense1/Pow_2:z:0*
T0*
_output_shapes
:В
cicada-v2/dense1/truediv_2RealDivcicada-v2/dense1/mul_9:z:0cicada-v2/dense1/Pow_3:z:0*
T0*
_output_shapes
:b
cicada-v2/dense1/Neg_3Negcicada-v2/dense1/truediv_2:z:0*
T0*
_output_shapes
:f
cicada-v2/dense1/Round_1Roundcicada-v2/dense1/truediv_2:z:0*
T0*
_output_shapes
:~
cicada-v2/dense1/add_8AddV2cicada-v2/dense1/Neg_3:y:0cicada-v2/dense1/Round_1:y:0*
T0*
_output_shapes
:p
cicada-v2/dense1/StopGradient_2StopGradientcicada-v2/dense1/add_8:z:0*
T0*
_output_shapes
:О
cicada-v2/dense1/add_9AddV2cicada-v2/dense1/truediv_2:z:0(cicada-v2/dense1/StopGradient_2:output:0*
T0*
_output_shapes
:Z
cicada-v2/dense1/Neg_4Negcicada-v2/dense1/Pow_2:z:0*
T0*
_output_shapes
: ^
cicada-v2/dense1/add_10/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Б
cicada-v2/dense1/add_10AddV2cicada-v2/dense1/Neg_4:y:0"cicada-v2/dense1/add_10/y:output:0*
T0*
_output_shapes
: ^
cicada-v2/dense1/mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?А
cicada-v2/dense1/mul_10Mul"cicada-v2/dense1/mul_10/x:output:0cicada-v2/dense1/add_10:z:0*
T0*
_output_shapes
: ]
cicada-v2/dense1/sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?}
cicada-v2/dense1/sub_2Subcicada-v2/dense1/Pow_2:z:0!cicada-v2/dense1/sub_2/y:output:0*
T0*
_output_shapes
: Р
(cicada-v2/dense1/clip_by_value_1/MinimumMinimumcicada-v2/dense1/add_9:z:0cicada-v2/dense1/sub_2:z:0*
T0*
_output_shapes
:Ы
 cicada-v2/dense1/clip_by_value_1Maximum,cicada-v2/dense1/clip_by_value_1/Minimum:z:0cicada-v2/dense1/mul_10:z:0*
T0*
_output_shapes
:Е
cicada-v2/dense1/mul_11Mulcicada-v2/dense1/Pow_3:z:0$cicada-v2/dense1/clip_by_value_1:z:0*
T0*
_output_shapes
:Г
cicada-v2/dense1/truediv_3RealDivcicada-v2/dense1/mul_11:z:0cicada-v2/dense1/Pow_2:z:0*
T0*
_output_shapes
:^
cicada-v2/dense1/mul_12/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?З
cicada-v2/dense1/mul_12Mul"cicada-v2/dense1/mul_12/x:output:0cicada-v2/dense1/truediv_3:z:0*
T0*
_output_shapes
:^
cicada-v2/dense1/Neg_5Negcicada-v2/dense1/add_2:z:0*
T0*
_output_shapes
:~
cicada-v2/dense1/add_11AddV2cicada-v2/dense1/Neg_5:y:0cicada-v2/dense1/mul_12:z:0*
T0*
_output_shapes
:^
cicada-v2/dense1/mul_13/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Д
cicada-v2/dense1/mul_13Mul"cicada-v2/dense1/mul_13/x:output:0cicada-v2/dense1/add_11:z:0*
T0*
_output_shapes
:q
cicada-v2/dense1/StopGradient_3StopGradientcicada-v2/dense1/mul_13:z:0*
T0*
_output_shapes
:Л
cicada-v2/dense1/add_12AddV2cicada-v2/dense1/add_2:z:0(cicada-v2/dense1/StopGradient_3:output:0*
T0*
_output_shapes
:Ш
cicada-v2/dense1/MatMul_1MatMul%cicada-v2/dropout_1/Identity:output:0cicada-v2/dense1/add_7:z:0*
T0*'
_output_shapes
:€€€€€€€€€Щ
cicada-v2/dense1/BiasAdd_1BiasAdd#cicada-v2/dense1/MatMul_1:product:0cicada-v2/dense1/add_12:z:0*
T0*'
_output_shapes
:€€€€€€€€€W
cicada-v2/relu1/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :W
cicada-v2/relu1/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
{
cicada-v2/relu1/PowPowcicada-v2/relu1/Pow/x:output:0cicada-v2/relu1/Pow/y:output:0*
T0*
_output_shapes
: e
cicada-v2/relu1/CastCastcicada-v2/relu1/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: Y
cicada-v2/relu1/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :Y
cicada-v2/relu1/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :Б
cicada-v2/relu1/Pow_1Pow cicada-v2/relu1/Pow_1/x:output:0 cicada-v2/relu1/Pow_1/y:output:0*
T0*
_output_shapes
: i
cicada-v2/relu1/Cast_1Castcicada-v2/relu1/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: Z
cicada-v2/relu1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @Z
cicada-v2/relu1/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :q
cicada-v2/relu1/Cast_2Cast!cicada-v2/relu1/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: Z
cicada-v2/relu1/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   Aw
cicada-v2/relu1/subSubcicada-v2/relu1/Cast_2:y:0cicada-v2/relu1/sub/y:output:0*
T0*
_output_shapes
: v
cicada-v2/relu1/Pow_2Powcicada-v2/relu1/Const:output:0cicada-v2/relu1/sub:z:0*
T0*
_output_shapes
: t
cicada-v2/relu1/sub_1Subcicada-v2/relu1/Cast_1:y:0cicada-v2/relu1/Pow_2:z:0*
T0*
_output_shapes
: Ш
cicada-v2/relu1/LessEqual	LessEqual#cicada-v2/dense1/BiasAdd_1:output:0cicada-v2/relu1/sub_1:z:0*
T0*'
_output_shapes
:€€€€€€€€€s
cicada-v2/relu1/ReluRelu#cicada-v2/dense1/BiasAdd_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€r
cicada-v2/relu1/ones_like/ShapeShape#cicada-v2/dense1/BiasAdd_1:output:0*
T0*
_output_shapes
:d
cicada-v2/relu1/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?І
cicada-v2/relu1/ones_likeFill(cicada-v2/relu1/ones_like/Shape:output:0(cicada-v2/relu1/ones_like/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€t
cicada-v2/relu1/sub_2Subcicada-v2/relu1/Cast_1:y:0cicada-v2/relu1/Pow_2:z:0*
T0*
_output_shapes
: Л
cicada-v2/relu1/mulMul"cicada-v2/relu1/ones_like:output:0cicada-v2/relu1/sub_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€≤
cicada-v2/relu1/SelectV2SelectV2cicada-v2/relu1/LessEqual:z:0"cicada-v2/relu1/Relu:activations:0cicada-v2/relu1/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€Н
cicada-v2/relu1/mul_1Mul#cicada-v2/dense1/BiasAdd_1:output:0cicada-v2/relu1/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€Л
cicada-v2/relu1/truedivRealDivcicada-v2/relu1/mul_1:z:0cicada-v2/relu1/Cast_1:y:0*
T0*'
_output_shapes
:€€€€€€€€€i
cicada-v2/relu1/NegNegcicada-v2/relu1/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€m
cicada-v2/relu1/RoundRoundcicada-v2/relu1/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€В
cicada-v2/relu1/addAddV2cicada-v2/relu1/Neg:y:0cicada-v2/relu1/Round:y:0*
T0*'
_output_shapes
:€€€€€€€€€w
cicada-v2/relu1/StopGradientStopGradientcicada-v2/relu1/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€Ф
cicada-v2/relu1/add_1AddV2cicada-v2/relu1/truediv:z:0%cicada-v2/relu1/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€Л
cicada-v2/relu1/truediv_1RealDivcicada-v2/relu1/add_1:z:0cicada-v2/relu1/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€`
cicada-v2/relu1/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Е
cicada-v2/relu1/truediv_2RealDiv$cicada-v2/relu1/truediv_2/x:output:0cicada-v2/relu1/Cast:y:0*
T0*
_output_shapes
: \
cicada-v2/relu1/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?~
cicada-v2/relu1/sub_3Sub cicada-v2/relu1/sub_3/x:output:0cicada-v2/relu1/truediv_2:z:0*
T0*
_output_shapes
: Ь
%cicada-v2/relu1/clip_by_value/MinimumMinimumcicada-v2/relu1/truediv_1:z:0cicada-v2/relu1/sub_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€d
cicada-v2/relu1/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    ѓ
cicada-v2/relu1/clip_by_valueMaximum)cicada-v2/relu1/clip_by_value/Minimum:z:0(cicada-v2/relu1/clip_by_value/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€Н
cicada-v2/relu1/mul_2Mulcicada-v2/relu1/Cast_1:y:0!cicada-v2/relu1/clip_by_value:z:0*
T0*'
_output_shapes
:€€€€€€€€€q
cicada-v2/relu1/Neg_1Neg!cicada-v2/relu1/SelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€Ж
cicada-v2/relu1/add_2AddV2cicada-v2/relu1/Neg_1:y:0cicada-v2/relu1/mul_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€\
cicada-v2/relu1/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Л
cicada-v2/relu1/mul_3Mul cicada-v2/relu1/mul_3/x:output:0cicada-v2/relu1/add_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€{
cicada-v2/relu1/StopGradient_1StopGradientcicada-v2/relu1/mul_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€Ь
cicada-v2/relu1/add_3AddV2!cicada-v2/relu1/SelectV2:output:0'cicada-v2/relu1/StopGradient_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€u
cicada-v2/dropout_2/IdentityIdentitycicada-v2/relu1/add_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€[
cicada-v2/dense2/Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @[
cicada-v2/dense2/Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  0A~
cicada-v2/dense2/PowPowcicada-v2/dense2/Pow/x:output:0cicada-v2/dense2/Pow/y:output:0*
T0*
_output_shapes
: ]
cicada-v2/dense2/Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @]
cicada-v2/dense2/Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@Д
cicada-v2/dense2/Pow_1Pow!cicada-v2/dense2/Pow_1/x:output:0!cicada-v2/dense2/Pow_1/y:output:0*
T0*
_output_shapes
: И
cicada-v2/dense2/ReadVariableOpReadVariableOp(cicada_v2_dense2_readvariableop_resource*
_output_shapes

:*
dtype0З
cicada-v2/dense2/mulMul'cicada-v2/dense2/ReadVariableOp:value:0cicada-v2/dense2/Pow:z:0*
T0*
_output_shapes

:В
cicada-v2/dense2/truedivRealDivcicada-v2/dense2/mul:z:0cicada-v2/dense2/Pow_1:z:0*
T0*
_output_shapes

:b
cicada-v2/dense2/NegNegcicada-v2/dense2/truediv:z:0*
T0*
_output_shapes

:f
cicada-v2/dense2/RoundRoundcicada-v2/dense2/truediv:z:0*
T0*
_output_shapes

:|
cicada-v2/dense2/addAddV2cicada-v2/dense2/Neg:y:0cicada-v2/dense2/Round:y:0*
T0*
_output_shapes

:p
cicada-v2/dense2/StopGradientStopGradientcicada-v2/dense2/add:z:0*
T0*
_output_shapes

:О
cicada-v2/dense2/add_1AddV2cicada-v2/dense2/truediv:z:0&cicada-v2/dense2/StopGradient:output:0*
T0*
_output_shapes

:X
cicada-v2/dense2/Neg_1Negcicada-v2/dense2/Pow:z:0*
T0*
_output_shapes
: ]
cicada-v2/dense2/add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?
cicada-v2/dense2/add_2AddV2cicada-v2/dense2/Neg_1:y:0!cicada-v2/dense2/add_2/y:output:0*
T0*
_output_shapes
: ]
cicada-v2/dense2/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?}
cicada-v2/dense2/mul_1Mul!cicada-v2/dense2/mul_1/x:output:0cicada-v2/dense2/add_2:z:0*
T0*
_output_shapes
: [
cicada-v2/dense2/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?w
cicada-v2/dense2/subSubcicada-v2/dense2/Pow:z:0cicada-v2/dense2/sub/y:output:0*
T0*
_output_shapes
: Р
&cicada-v2/dense2/clip_by_value/MinimumMinimumcicada-v2/dense2/add_1:z:0cicada-v2/dense2/sub:z:0*
T0*
_output_shapes

:Ъ
cicada-v2/dense2/clip_by_valueMaximum*cicada-v2/dense2/clip_by_value/Minimum:z:0cicada-v2/dense2/mul_1:z:0*
T0*
_output_shapes

:Ж
cicada-v2/dense2/mul_2Mulcicada-v2/dense2/Pow_1:z:0"cicada-v2/dense2/clip_by_value:z:0*
T0*
_output_shapes

:Д
cicada-v2/dense2/truediv_1RealDivcicada-v2/dense2/mul_2:z:0cicada-v2/dense2/Pow:z:0*
T0*
_output_shapes

:]
cicada-v2/dense2/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Й
cicada-v2/dense2/mul_3Mul!cicada-v2/dense2/mul_3/x:output:0cicada-v2/dense2/truediv_1:z:0*
T0*
_output_shapes

:К
!cicada-v2/dense2/ReadVariableOp_1ReadVariableOp(cicada_v2_dense2_readvariableop_resource*
_output_shapes

:*
dtype0q
cicada-v2/dense2/Neg_2Neg)cicada-v2/dense2/ReadVariableOp_1:value:0*
T0*
_output_shapes

:А
cicada-v2/dense2/add_3AddV2cicada-v2/dense2/Neg_2:y:0cicada-v2/dense2/mul_3:z:0*
T0*
_output_shapes

:]
cicada-v2/dense2/mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Е
cicada-v2/dense2/mul_4Mul!cicada-v2/dense2/mul_4/x:output:0cicada-v2/dense2/add_3:z:0*
T0*
_output_shapes

:t
cicada-v2/dense2/StopGradient_1StopGradientcicada-v2/dense2/mul_4:z:0*
T0*
_output_shapes

:К
!cicada-v2/dense2/ReadVariableOp_2ReadVariableOp(cicada_v2_dense2_readvariableop_resource*
_output_shapes

:*
dtype0Э
cicada-v2/dense2/add_4AddV2)cicada-v2/dense2/ReadVariableOp_2:value:0(cicada-v2/dense2/StopGradient_1:output:0*
T0*
_output_shapes

:Ц
cicada-v2/dense2/MatMulMatMul%cicada-v2/dropout_2/Identity:output:0cicada-v2/dense2/add_4:z:0*
T0*'
_output_shapes
:€€€€€€€€€Y
cicada-v2/outputs/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :Y
cicada-v2/outputs/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :Б
cicada-v2/outputs/PowPow cicada-v2/outputs/Pow/x:output:0 cicada-v2/outputs/Pow/y:output:0*
T0*
_output_shapes
: i
cicada-v2/outputs/CastCastcicada-v2/outputs/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: [
cicada-v2/outputs/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :[
cicada-v2/outputs/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :З
cicada-v2/outputs/Pow_1Pow"cicada-v2/outputs/Pow_1/x:output:0"cicada-v2/outputs/Pow_1/y:output:0*
T0*
_output_shapes
: m
cicada-v2/outputs/Cast_1Castcicada-v2/outputs/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: \
cicada-v2/outputs/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @\
cicada-v2/outputs/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :u
cicada-v2/outputs/Cast_2Cast#cicada-v2/outputs/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: \
cicada-v2/outputs/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  АA}
cicada-v2/outputs/subSubcicada-v2/outputs/Cast_2:y:0 cicada-v2/outputs/sub/y:output:0*
T0*
_output_shapes
: |
cicada-v2/outputs/Pow_2Pow cicada-v2/outputs/Const:output:0cicada-v2/outputs/sub:z:0*
T0*
_output_shapes
: z
cicada-v2/outputs/sub_1Subcicada-v2/outputs/Cast_1:y:0cicada-v2/outputs/Pow_2:z:0*
T0*
_output_shapes
: Ъ
cicada-v2/outputs/LessEqual	LessEqual!cicada-v2/dense2/MatMul:product:0cicada-v2/outputs/sub_1:z:0*
T0*'
_output_shapes
:€€€€€€€€€s
cicada-v2/outputs/ReluRelu!cicada-v2/dense2/MatMul:product:0*
T0*'
_output_shapes
:€€€€€€€€€r
!cicada-v2/outputs/ones_like/ShapeShape!cicada-v2/dense2/MatMul:product:0*
T0*
_output_shapes
:f
!cicada-v2/outputs/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?≠
cicada-v2/outputs/ones_likeFill*cicada-v2/outputs/ones_like/Shape:output:0*cicada-v2/outputs/ones_like/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€z
cicada-v2/outputs/sub_2Subcicada-v2/outputs/Cast_1:y:0cicada-v2/outputs/Pow_2:z:0*
T0*
_output_shapes
: С
cicada-v2/outputs/mulMul$cicada-v2/outputs/ones_like:output:0cicada-v2/outputs/sub_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€Ї
cicada-v2/outputs/SelectV2SelectV2cicada-v2/outputs/LessEqual:z:0$cicada-v2/outputs/Relu:activations:0cicada-v2/outputs/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€П
cicada-v2/outputs/mul_1Mul!cicada-v2/dense2/MatMul:product:0cicada-v2/outputs/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€С
cicada-v2/outputs/truedivRealDivcicada-v2/outputs/mul_1:z:0cicada-v2/outputs/Cast_1:y:0*
T0*'
_output_shapes
:€€€€€€€€€m
cicada-v2/outputs/NegNegcicada-v2/outputs/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€q
cicada-v2/outputs/RoundRoundcicada-v2/outputs/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€И
cicada-v2/outputs/addAddV2cicada-v2/outputs/Neg:y:0cicada-v2/outputs/Round:y:0*
T0*'
_output_shapes
:€€€€€€€€€{
cicada-v2/outputs/StopGradientStopGradientcicada-v2/outputs/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€Ъ
cicada-v2/outputs/add_1AddV2cicada-v2/outputs/truediv:z:0'cicada-v2/outputs/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€С
cicada-v2/outputs/truediv_1RealDivcicada-v2/outputs/add_1:z:0cicada-v2/outputs/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€b
cicada-v2/outputs/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Л
cicada-v2/outputs/truediv_2RealDiv&cicada-v2/outputs/truediv_2/x:output:0cicada-v2/outputs/Cast:y:0*
T0*
_output_shapes
: ^
cicada-v2/outputs/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Д
cicada-v2/outputs/sub_3Sub"cicada-v2/outputs/sub_3/x:output:0cicada-v2/outputs/truediv_2:z:0*
T0*
_output_shapes
: Ґ
'cicada-v2/outputs/clip_by_value/MinimumMinimumcicada-v2/outputs/truediv_1:z:0cicada-v2/outputs/sub_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€f
!cicada-v2/outputs/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    µ
cicada-v2/outputs/clip_by_valueMaximum+cicada-v2/outputs/clip_by_value/Minimum:z:0*cicada-v2/outputs/clip_by_value/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€У
cicada-v2/outputs/mul_2Mulcicada-v2/outputs/Cast_1:y:0#cicada-v2/outputs/clip_by_value:z:0*
T0*'
_output_shapes
:€€€€€€€€€u
cicada-v2/outputs/Neg_1Neg#cicada-v2/outputs/SelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€М
cicada-v2/outputs/add_2AddV2cicada-v2/outputs/Neg_1:y:0cicada-v2/outputs/mul_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€^
cicada-v2/outputs/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?С
cicada-v2/outputs/mul_3Mul"cicada-v2/outputs/mul_3/x:output:0cicada-v2/outputs/add_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€
 cicada-v2/outputs/StopGradient_1StopGradientcicada-v2/outputs/mul_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€Ґ
cicada-v2/outputs/add_3AddV2#cicada-v2/outputs/SelectV2:output:0)cicada-v2/outputs/StopGradient_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€j
IdentityIdentitycicada-v2/outputs/add_3:z:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€®
NoOpNoOp^cicada-v2/conv/ReadVariableOp ^cicada-v2/conv/ReadVariableOp_1 ^cicada-v2/conv/ReadVariableOp_2%^cicada-v2/dense1/AssignAddVariableOp(^cicada-v2/dense1/BiasAdd/ReadVariableOp'^cicada-v2/dense1/MatMul/ReadVariableOp ^cicada-v2/dense1/ReadVariableOp"^cicada-v2/dense1/ReadVariableOp_1&^cicada-v2/dense1/add_2/ReadVariableOp@^cicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOpB^cicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_1B^cicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_2D^cicada-v2/dense1/batch_normalization_1/batchnorm/mul/ReadVariableOp$^cicada-v2/dense1/mul/ReadVariableOp&^cicada-v2/dense1/mul_1/ReadVariableOp&^cicada-v2/dense1/mul_3/ReadVariableOp$^cicada-v2/dense1/sub/ReadVariableOp ^cicada-v2/dense2/ReadVariableOp"^cicada-v2/dense2/ReadVariableOp_1"^cicada-v2/dense2/ReadVariableOp_2*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:€€€€€€€€€ь: : : : : : : : : 2>
cicada-v2/conv/ReadVariableOpcicada-v2/conv/ReadVariableOp2B
cicada-v2/conv/ReadVariableOp_1cicada-v2/conv/ReadVariableOp_12B
cicada-v2/conv/ReadVariableOp_2cicada-v2/conv/ReadVariableOp_22L
$cicada-v2/dense1/AssignAddVariableOp$cicada-v2/dense1/AssignAddVariableOp2R
'cicada-v2/dense1/BiasAdd/ReadVariableOp'cicada-v2/dense1/BiasAdd/ReadVariableOp2P
&cicada-v2/dense1/MatMul/ReadVariableOp&cicada-v2/dense1/MatMul/ReadVariableOp2B
cicada-v2/dense1/ReadVariableOpcicada-v2/dense1/ReadVariableOp2F
!cicada-v2/dense1/ReadVariableOp_1!cicada-v2/dense1/ReadVariableOp_12N
%cicada-v2/dense1/add_2/ReadVariableOp%cicada-v2/dense1/add_2/ReadVariableOp2В
?cicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp?cicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp2Ж
Acicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_1Acicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_12Ж
Acicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_2Acicada-v2/dense1/batch_normalization_1/batchnorm/ReadVariableOp_22К
Ccicada-v2/dense1/batch_normalization_1/batchnorm/mul/ReadVariableOpCcicada-v2/dense1/batch_normalization_1/batchnorm/mul/ReadVariableOp2J
#cicada-v2/dense1/mul/ReadVariableOp#cicada-v2/dense1/mul/ReadVariableOp2N
%cicada-v2/dense1/mul_1/ReadVariableOp%cicada-v2/dense1/mul_1/ReadVariableOp2N
%cicada-v2/dense1/mul_3/ReadVariableOp%cicada-v2/dense1/mul_3/ReadVariableOp2J
#cicada-v2/dense1/sub/ReadVariableOp#cicada-v2/dense1/sub/ReadVariableOp2B
cicada-v2/dense2/ReadVariableOpcicada-v2/dense2/ReadVariableOp2F
!cicada-v2/dense2/ReadVariableOp_1!cicada-v2/dense2/ReadVariableOp_12F
!cicada-v2/dense2/ReadVariableOp_2!cicada-v2/dense2/ReadVariableOp_2:Q M
(
_output_shapes
:€€€€€€€€€ь
!
_user_specified_name	inputs_
Вj
µ
B__inference_dense1_layer_call_and_return_conditional_losses_264014

inputs1
matmul_readvariableop_resource:	ь-
biasadd_readvariableop_resource:E
7batch_normalization_1_batchnorm_readvariableop_resource:I
;batch_normalization_1_batchnorm_mul_readvariableop_resource:G
9batch_normalization_1_batchnorm_readvariableop_1_resource:G
9batch_normalization_1_batchnorm_readvariableop_2_resource:&
assignaddvariableop_resource:	 
identityИҐAssignAddVariableOpҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpҐReadVariableOpҐReadVariableOp_1Ґadd_2/ReadVariableOpҐ.batch_normalization_1/batchnorm/ReadVariableOpҐ0batch_normalization_1/batchnorm/ReadVariableOp_1Ґ0batch_normalization_1/batchnorm/ReadVariableOp_2Ґ2batch_normalization_1/batchnorm/mul/ReadVariableOpҐmul/ReadVariableOpҐmul_1/ReadVariableOpҐmul_3/ReadVariableOpҐsub/ReadVariableOpH
Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Z u
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€Ґ
.batch_normalization_1/batchnorm/ReadVariableOpReadVariableOp7batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0j
%batch_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:є
#batch_normalization_1/batchnorm/addAddV26batch_normalization_1/batchnorm/ReadVariableOp:value:0.batch_normalization_1/batchnorm/add/y:output:0*
T0*
_output_shapes
:|
%batch_normalization_1/batchnorm/RsqrtRsqrt'batch_normalization_1/batchnorm/add:z:0*
T0*
_output_shapes
:™
2batch_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0ґ
#batch_normalization_1/batchnorm/mulMul)batch_normalization_1/batchnorm/Rsqrt:y:0:batch_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:Щ
%batch_normalization_1/batchnorm/mul_1MulBiasAdd:output:0'batch_normalization_1/batchnorm/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€¶
0batch_normalization_1/batchnorm/ReadVariableOp_1ReadVariableOp9batch_normalization_1_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0і
%batch_normalization_1/batchnorm/mul_2Mul8batch_normalization_1/batchnorm/ReadVariableOp_1:value:0'batch_normalization_1/batchnorm/mul:z:0*
T0*
_output_shapes
:¶
0batch_normalization_1/batchnorm/ReadVariableOp_2ReadVariableOp9batch_normalization_1_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0і
#batch_normalization_1/batchnorm/subSub8batch_normalization_1/batchnorm/ReadVariableOp_2:value:0)batch_normalization_1/batchnorm/mul_2:z:0*
T0*
_output_shapes
:і
%batch_normalization_1/batchnorm/add_1AddV2)batch_normalization_1/batchnorm/mul_1:z:0'batch_normalization_1/batchnorm/sub:z:0*
T0*'
_output_shapes
:€€€€€€€€€G
ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R {
AssignAddVariableOpAssignAddVariableOpassignaddvariableop_resourceConst:output:0*
_output_shapes
 *
dtype0	h
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Й
moments/meanMeanBiasAdd:output:0'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:С
moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:0moments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Ю
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(m
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 s
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 В
ReadVariableOpReadVariableOp7batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0J
add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:Y
addAddV2ReadVariableOp:value:0add/y:output:0*
T0*
_output_shapes
:<
RsqrtRsqrtadd:z:0*
T0*
_output_shapes
:L
add_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:a
add_1AddV2moments/Squeeze_1:output:0add_1/y:output:0*
T0*
_output_shapes
:@
Rsqrt_1Rsqrt	add_1:z:0*
T0*
_output_shapes
:К
mul/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0V
mulMul	Rsqrt:y:0mul/ReadVariableOp:value:0*
T0*
_output_shapes
:М
mul_1/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0\
mul_1MulRsqrt_1:y:0mul_1/ReadVariableOp:value:0*
T0*
_output_shapes
:l
ReadVariableOp_1ReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0И
sub/ReadVariableOpReadVariableOp9batch_normalization_1_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0e
subSubReadVariableOp_1:value:0sub/ReadVariableOp:value:0*
T0*
_output_shapes
:C
mul_2Mulmul:z:0sub:z:0*
T0*
_output_shapes
:К
add_2/ReadVariableOpReadVariableOp9batch_normalization_1_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0\
add_2AddV2	mul_2:z:0add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:t
mul_3/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0]
mul_3Mulmul:z:0mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	ьJ
Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  а@K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: L
Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: J
mul_4Mul	mul_3:z:0Pow:z:0*
T0*
_output_shapes
:	ьR
truedivRealDiv	mul_4:z:0	Pow_1:z:0*
T0*
_output_shapes
:	ьA
NegNegtruediv:z:0*
T0*
_output_shapes
:	ьE
RoundRoundtruediv:z:0*
T0*
_output_shapes
:	ьL
add_3AddV2Neg:y:0	Round:y:0*
T0*
_output_shapes
:	ьQ
StopGradientStopGradient	add_3:z:0*
T0*
_output_shapes
:	ь\
add_4AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes
:	ь6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?L
add_5AddV2	Neg_1:y:0add_5/y:output:0*
T0*
_output_shapes
: L
mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?J
mul_5Mulmul_5/x:output:0	add_5:z:0*
T0*
_output_shapes
: L
sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?H
sub_1SubPow:z:0sub_1/y:output:0*
T0*
_output_shapes
: `
clip_by_value/MinimumMinimum	add_4:z:0	sub_1:z:0*
T0*
_output_shapes
:	ьh
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_5:z:0*
T0*
_output_shapes
:	ьT
mul_6Mul	Pow_1:z:0clip_by_value:z:0*
T0*
_output_shapes
:	ьR
	truediv_1RealDiv	mul_6:z:0Pow:z:0*
T0*
_output_shapes
:	ьL
mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?W
mul_7Mulmul_7/x:output:0truediv_1:z:0*
T0*
_output_shapes
:	ьA
Neg_2Neg	mul_3:z:0*
T0*
_output_shapes
:	ьN
add_6AddV2	Neg_2:y:0	mul_7:z:0*
T0*
_output_shapes
:	ьL
mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?S
mul_8Mulmul_8/x:output:0	add_6:z:0*
T0*
_output_shapes
:	ьS
StopGradient_1StopGradient	mul_8:z:0*
T0*
_output_shapes
:	ь\
add_7AddV2	mul_3:z:0StopGradient_1:output:0*
T0*
_output_shapes
:	ьL
Pow_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  а@Q
Pow_2PowPow_2/x:output:0Pow_2/y:output:0*
T0*
_output_shapes
: L
Pow_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@Q
Pow_3PowPow_3/x:output:0Pow_3/y:output:0*
T0*
_output_shapes
: G
mul_9Mul	add_2:z:0	Pow_2:z:0*
T0*
_output_shapes
:O
	truediv_2RealDiv	mul_9:z:0	Pow_3:z:0*
T0*
_output_shapes
:@
Neg_3Negtruediv_2:z:0*
T0*
_output_shapes
:D
Round_1Roundtruediv_2:z:0*
T0*
_output_shapes
:K
add_8AddV2	Neg_3:y:0Round_1:y:0*
T0*
_output_shapes
:N
StopGradient_2StopGradient	add_8:z:0*
T0*
_output_shapes
:[
add_9AddV2truediv_2:z:0StopGradient_2:output:0*
T0*
_output_shapes
:8
Neg_4Neg	Pow_2:z:0*
T0*
_output_shapes
: M
add_10/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?N
add_10AddV2	Neg_4:y:0add_10/y:output:0*
T0*
_output_shapes
: M
mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?M
mul_10Mulmul_10/x:output:0
add_10:z:0*
T0*
_output_shapes
: L
sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?J
sub_2Sub	Pow_2:z:0sub_2/y:output:0*
T0*
_output_shapes
: ]
clip_by_value_1/MinimumMinimum	add_9:z:0	sub_2:z:0*
T0*
_output_shapes
:h
clip_by_value_1Maximumclip_by_value_1/Minimum:z:0
mul_10:z:0*
T0*
_output_shapes
:R
mul_11Mul	Pow_3:z:0clip_by_value_1:z:0*
T0*
_output_shapes
:P
	truediv_3RealDiv
mul_11:z:0	Pow_2:z:0*
T0*
_output_shapes
:M
mul_12/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?T
mul_12Mulmul_12/x:output:0truediv_3:z:0*
T0*
_output_shapes
:<
Neg_5Neg	add_2:z:0*
T0*
_output_shapes
:K
add_11AddV2	Neg_5:y:0
mul_12:z:0*
T0*
_output_shapes
:M
mul_13/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Q
mul_13Mulmul_13/x:output:0
add_11:z:0*
T0*
_output_shapes
:O
StopGradient_3StopGradient
mul_13:z:0*
T0*
_output_shapes
:X
add_12AddV2	add_2:z:0StopGradient_3:output:0*
T0*
_output_shapes
:W
MatMul_1MatMulinputs	add_7:z:0*
T0*'
_output_shapes
:€€€€€€€€€f
	BiasAdd_1BiasAddMatMul_1:product:0
add_12:z:0*
T0*'
_output_shapes
:€€€€€€€€€a
IdentityIdentityBiasAdd_1:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€м
NoOpNoOp^AssignAddVariableOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^ReadVariableOp^ReadVariableOp_1^add_2/ReadVariableOp/^batch_normalization_1/batchnorm/ReadVariableOp1^batch_normalization_1/batchnorm/ReadVariableOp_11^batch_normalization_1/batchnorm/ReadVariableOp_23^batch_normalization_1/batchnorm/mul/ReadVariableOp^mul/ReadVariableOp^mul_1/ReadVariableOp^mul_3/ReadVariableOp^sub/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":€€€€€€€€€ь: : : : : : : 2*
AssignAddVariableOpAssignAddVariableOp20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12,
add_2/ReadVariableOpadd_2/ReadVariableOp2`
.batch_normalization_1/batchnorm/ReadVariableOp.batch_normalization_1/batchnorm/ReadVariableOp2d
0batch_normalization_1/batchnorm/ReadVariableOp_10batch_normalization_1/batchnorm/ReadVariableOp_12d
0batch_normalization_1/batchnorm/ReadVariableOp_20batch_normalization_1/batchnorm/ReadVariableOp_22h
2batch_normalization_1/batchnorm/mul/ReadVariableOp2batch_normalization_1/batchnorm/mul/ReadVariableOp2(
mul/ReadVariableOpmul/ReadVariableOp2,
mul_1/ReadVariableOpmul_1/ReadVariableOp2,
mul_3/ReadVariableOpmul_3/ReadVariableOp2(
sub/ReadVariableOpsub/ReadVariableOp:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
≈
_
C__inference_flatten_layer_call_and_return_conditional_losses_263827

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€ь   ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:€€€€€€€€€ьY
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:€€€€€€€€€ь"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€	:W S
/
_output_shapes
:€€€€€€€€€	
 
_user_specified_nameinputs
н	
‘
*__inference_cicada-v2_layer_call_fn_262446
inputs_!
unknown:
	unknown_0:	ь
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:
	unknown_5:
	unknown_6:	 
	unknown_7:
identityИҐStatefulPartitionedCallµ
StatefulPartitionedCallStatefulPartitionedCallinputs_unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€**
_read_only_resource_inputs

	*-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_cicada-v2_layer_call_and_return_conditional_losses_262425o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:€€€€€€€€€ь: : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:€€€€€€€€€ь
!
_user_specified_name	inputs_
≠
D
(__inference_flatten_layer_call_fn_263821

inputs
identityѓ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€ь* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_flatten_layer_call_and_return_conditional_losses_262123a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:€€€€€€€€€ь"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€	:W S
/
_output_shapes
:€€€€€€€€€	
 
_user_specified_nameinputs
ќ
∞
Q__inference_batch_normalization_1_layer_call_and_return_conditional_losses_261940

inputs/
!batchnorm_readvariableop_resource:3
%batchnorm_mul_readvariableop_resource:1
#batchnorm_readvariableop_1_resource:1
#batchnorm_readvariableop_2_resource:
identityИҐbatchnorm/ReadVariableOpҐbatchnorm/ReadVariableOp_1Ґbatchnorm/ReadVariableOp_2Ґbatchnorm/mul/ReadVariableOpv
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:w
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes
:P
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
:~
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0t
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:c
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€z
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0r
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes
:z
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0r
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
:r
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:€€€€€€€€€b
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€Ї
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€: : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
у	
d
E__inference_dropout_2_layer_call_and_return_conditional_losses_262480

inputs
identityИR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *%IТ?d
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€C
dropout/ShapeShapeinputs*
T0*
_output_shapes
:М
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:€€€€€€€€€*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >¶
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€o
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:€€€€€€€€€i
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€Y
IdentityIdentitydropout/Mul_1:z:0*
T0*'
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
і"
]
A__inference_relu0_layer_call_and_return_conditional_losses_262115

inputs
identityG
Pow/xConst*
_output_shapes
: *
dtype0*
value	B :G
Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: E
CastCastPow:z:0*

DstT0*

SrcT0*
_output_shapes
: I
Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :I
Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: I
Cast_1Cast	Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: J
ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :Q
Cast_2CastCast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   AG
subSub
Cast_2:y:0sub/y:output:0*
T0*
_output_shapes
: F
Pow_2PowConst:output:0sub:z:0*
T0*
_output_shapes
: D
sub_1Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: c
	LessEqual	LessEqualinputs	sub_1:z:0*
T0*/
_output_shapes
:€€€€€€€€€	N
ReluReluinputs*
T0*/
_output_shapes
:€€€€€€€€€	E
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:T
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*/
_output_shapes
:€€€€€€€€€	D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: c
mulMulones_like:output:0	sub_2:z:0*
T0*/
_output_shapes
:€€€€€€€€€	z
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*/
_output_shapes
:€€€€€€€€€	X
mul_1MulinputsCast:y:0*
T0*/
_output_shapes
:€€€€€€€€€	c
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*/
_output_shapes
:€€€€€€€€€	Q
NegNegtruediv:z:0*
T0*/
_output_shapes
:€€€€€€€€€	U
RoundRoundtruediv:z:0*
T0*/
_output_shapes
:€€€€€€€€€	Z
addAddV2Neg:y:0	Round:y:0*
T0*/
_output_shapes
:€€€€€€€€€	_
StopGradientStopGradientadd:z:0*
T0*/
_output_shapes
:€€€€€€€€€	l
add_1AddV2truediv:z:0StopGradient:output:0*
T0*/
_output_shapes
:€€€€€€€€€	c
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*/
_output_shapes
:€€€€€€€€€	P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: t
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*/
_output_shapes
:€€€€€€€€€	T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    З
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*/
_output_shapes
:€€€€€€€€€	e
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*/
_output_shapes
:€€€€€€€€€	Y
Neg_1NegSelectV2:output:0*
T0*/
_output_shapes
:€€€€€€€€€	^
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*/
_output_shapes
:€€€€€€€€€	L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?c
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*/
_output_shapes
:€€€€€€€€€	c
StopGradient_1StopGradient	mul_3:z:0*
T0*/
_output_shapes
:€€€€€€€€€	t
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*/
_output_shapes
:€€€€€€€€€	Y
IdentityIdentity	add_3:z:0*
T0*/
_output_shapes
:€€€€€€€€€	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€	:W S
/
_output_shapes
:€€€€€€€€€	
 
_user_specified_nameinputs
Т%
к
Q__inference_batch_normalization_1_layer_call_and_return_conditional_losses_264424

inputs5
'assignmovingavg_readvariableop_resource:7
)assignmovingavg_1_readvariableop_resource:3
%batchnorm_mul_readvariableop_resource:/
!batchnorm_readvariableop_resource:
identityИҐAssignMovingAvgҐAssignMovingAvg/ReadVariableOpҐAssignMovingAvg_1Ґ AssignMovingAvg_1/ReadVariableOpҐbatchnorm/ReadVariableOpҐbatchnorm/mul/ReadVariableOph
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:З
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Ю
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(m
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 s
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 Z
AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
„#<В
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes
:*
dtype0Б
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes
:x
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:ђ
AssignMovingAvgAssignSubVariableOp'assignmovingavg_readvariableop_resourceAssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0\
AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
„#<Ж
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes
:*
dtype0З
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes
:~
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:і
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:q
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes
:P
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
:~
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0t
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:c
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€h
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes
:v
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0p
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
:r
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:€€€€€€€€€b
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€к
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€: : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
ы	
d
E__inference_dropout_1_layer_call_and_return_conditional_losses_263854

inputs
identityИR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  Р?e
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:€€€€€€€€€ьC
dropout/ShapeShapeinputs*
T0*
_output_shapes
:Н
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:€€€€€€€€€ь*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *9Ог=І
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:€€€€€€€€€ьp
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:€€€€€€€€€ьj
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:€€€€€€€€€ьZ
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:€€€€€€€€€ь"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:€€€€€€€€€ь:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
у	
d
E__inference_dropout_2_layer_call_and_return_conditional_losses_264242

inputs
identityИR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *%IТ?d
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€C
dropout/ShapeShapeinputs*
T0*
_output_shapes
:М
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:€€€€€€€€€*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >¶
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€o
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:€€€€€€€€€i
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€Y
IdentityIdentitydropout/Mul_1:z:0*
T0*'
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
Ґ%
ў
E__inference_cicada-v2_layer_call_and_return_conditional_losses_262425

inputs%
conv_262063: 
dense1_262255:	ь
dense1_262257:
dense1_262259:
dense1_262261:
dense1_262263:
dense1_262265:
dense1_262267:	 
dense2_262370:
identityИҐconv/StatefulPartitionedCallҐdense1/StatefulPartitionedCallҐdense2/StatefulPartitionedCallЊ
reshape/PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_reshape_layer_call_and_return_conditional_losses_262019у
conv/StatefulPartitionedCallStatefulPartitionedCall reshape/PartitionedCall:output:0conv_262063*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€	*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *I
fDRB
@__inference_conv_layer_call_and_return_conditional_losses_262062ў
relu0/PartitionedCallPartitionedCall%conv/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_relu0_layer_call_and_return_conditional_losses_262115ѕ
flatten/PartitionedCallPartitionedCallrelu0/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€ь* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_flatten_layer_call_and_return_conditional_losses_262123’
dropout_1/PartitionedCallPartitionedCall flatten/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€ь* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_dropout_1_layer_call_and_return_conditional_losses_262130Ў
dense1/StatefulPartitionedCallStatefulPartitionedCall"dropout_1/PartitionedCall:output:0dense1_262255dense1_262257dense1_262259dense1_262261dense1_262263dense1_262265dense1_262267*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense1_layer_call_and_return_conditional_losses_262254”
relu1/PartitionedCallPartitionedCall'dense1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_relu1_layer_call_and_return_conditional_losses_262319“
dropout_2/PartitionedCallPartitionedCallrelu1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_dropout_2_layer_call_and_return_conditional_losses_262326у
dense2/StatefulPartitionedCallStatefulPartitionedCall"dropout_2/PartitionedCall:output:0dense2_262370*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense2_layer_call_and_return_conditional_losses_262369„
outputs/PartitionedCallPartitionedCall'dense2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_outputs_layer_call_and_return_conditional_losses_262422o
IdentityIdentity outputs/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€І
NoOpNoOp^conv/StatefulPartitionedCall^dense1/StatefulPartitionedCall^dense2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:€€€€€€€€€ь: : : : : : : : : 2<
conv/StatefulPartitionedCallconv/StatefulPartitionedCall2@
dense1/StatefulPartitionedCalldense1/StatefulPartitionedCall2@
dense2/StatefulPartitionedCalldense2/StatefulPartitionedCall:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
с
c
*__inference_dropout_2_layer_call_fn_264225

inputs
identityИҐStatefulPartitionedCallј
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_dropout_2_layer_call_and_return_conditional_losses_262480o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
Я
F
*__inference_dropout_2_layer_call_fn_264220

inputs
identity∞
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_dropout_2_layer_call_and_return_conditional_losses_262326`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
≠
D
(__inference_reshape_layer_call_fn_263700

inputs
identityґ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_reshape_layer_call_and_return_conditional_losses_262019h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:€€€€€€€€€ь:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
ћ
_
C__inference_reshape_layer_call_and_return_conditional_losses_262019

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
valueB:—
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
value	B :©
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:l
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:€€€€€€€€€`
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:€€€€€€€€€ь:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
Т%
к
Q__inference_batch_normalization_1_layer_call_and_return_conditional_losses_261987

inputs5
'assignmovingavg_readvariableop_resource:7
)assignmovingavg_1_readvariableop_resource:3
%batchnorm_mul_readvariableop_resource:/
!batchnorm_readvariableop_resource:
identityИҐAssignMovingAvgҐAssignMovingAvg/ReadVariableOpҐAssignMovingAvg_1Ґ AssignMovingAvg_1/ReadVariableOpҐbatchnorm/ReadVariableOpҐbatchnorm/mul/ReadVariableOph
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:З
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Ю
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(m
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 s
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 Z
AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
„#<В
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes
:*
dtype0Б
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes
:x
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:ђ
AssignMovingAvgAssignSubVariableOp'assignmovingavg_readvariableop_resourceAssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0\
AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
„#<Ж
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes
:*
dtype0З
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes
:~
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:і
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:q
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes
:P
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
:~
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0t
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:c
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€h
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes
:v
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0p
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
:r
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:€€€€€€€€€b
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€к
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€: : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
х 
_
C__inference_outputs_layer_call_and_return_conditional_losses_264344

inputs
identityG
Pow/xConst*
_output_shapes
: *
dtype0*
value	B :G
Pow/yConst*
_output_shapes
: *
dtype0*
value	B :K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: E
CastCastPow:z:0*

DstT0*

SrcT0*
_output_shapes
: I
Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :I
Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: I
Cast_1Cast	Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: J
ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :Q
Cast_2CastCast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  АAG
subSub
Cast_2:y:0sub/y:output:0*
T0*
_output_shapes
: F
Pow_2PowConst:output:0sub:z:0*
T0*
_output_shapes
: D
sub_1Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
	LessEqual	LessEqualinputs	sub_1:z:0*
T0*'
_output_shapes
:€€€€€€€€€F
ReluReluinputs*
T0*'
_output_shapes
:€€€€€€€€€E
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:T
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?w
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
mulMulones_like:output:0	sub_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€r
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€P
mul_1MulinputsCast:y:0*
T0*'
_output_shapes
:€€€€€€€€€[
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*'
_output_shapes
:€€€€€€€€€I
NegNegtruediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€M
RoundRoundtruediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€R
addAddV2Neg:y:0	Round:y:0*
T0*'
_output_shapes
:€€€€€€€€€W
StopGradientStopGradientadd:z:0*
T0*'
_output_shapes
:€€€€€€€€€d
add_1AddV2truediv:z:0StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€[
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: l
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€]
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*'
_output_shapes
:€€€€€€€€€Q
Neg_1NegSelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€V
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?[
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€[
StopGradient_1StopGradient	mul_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€l
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€Q
IdentityIdentity	add_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
ю
√
B__inference_dense2_layer_call_and_return_conditional_losses_264290

inputs)
readvariableop_resource:
identityИҐReadVariableOpҐReadVariableOp_1ҐReadVariableOp_2J
Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  0AK
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: L
Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: f
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes

:*
dtype0T
mulMulReadVariableOp:value:0Pow:z:0*
T0*
_output_shapes

:O
truedivRealDivmul:z:0	Pow_1:z:0*
T0*
_output_shapes

:@
NegNegtruediv:z:0*
T0*
_output_shapes

:D
RoundRoundtruediv:z:0*
T0*
_output_shapes

:I
addAddV2Neg:y:0	Round:y:0*
T0*
_output_shapes

:N
StopGradientStopGradientadd:z:0*
T0*
_output_shapes

:[
add_1AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes

:6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?L
add_2AddV2	Neg_1:y:0add_2/y:output:0*
T0*
_output_shapes
: L
mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?J
mul_1Mulmul_1/x:output:0	add_2:z:0*
T0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?D
subSubPow:z:0sub/y:output:0*
T0*
_output_shapes
: ]
clip_by_value/MinimumMinimum	add_1:z:0sub:z:0*
T0*
_output_shapes

:g
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_1:z:0*
T0*
_output_shapes

:S
mul_2Mul	Pow_1:z:0clip_by_value:z:0*
T0*
_output_shapes

:Q
	truediv_1RealDiv	mul_2:z:0Pow:z:0*
T0*
_output_shapes

:L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?V
mul_3Mulmul_3/x:output:0truediv_1:z:0*
T0*
_output_shapes

:h
ReadVariableOp_1ReadVariableOpreadvariableop_resource*
_output_shapes

:*
dtype0O
Neg_2NegReadVariableOp_1:value:0*
T0*
_output_shapes

:M
add_3AddV2	Neg_2:y:0	mul_3:z:0*
T0*
_output_shapes

:L
mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?R
mul_4Mulmul_4/x:output:0	add_3:z:0*
T0*
_output_shapes

:R
StopGradient_1StopGradient	mul_4:z:0*
T0*
_output_shapes

:h
ReadVariableOp_2ReadVariableOpreadvariableop_resource*
_output_shapes

:*
dtype0j
add_4AddV2ReadVariableOp_2:value:0StopGradient_1:output:0*
T0*
_output_shapes

:U
MatMulMatMulinputs	add_4:z:0*
T0*'
_output_shapes
:€€€€€€€€€_
IdentityIdentityMatMul:product:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€}
NoOpNoOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:€€€€€€€€€: 2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_2:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
Ч
B
&__inference_relu1_layer_call_fn_264166

inputs
identityђ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_relu1_layer_call_and_return_conditional_losses_262319`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
ч
…
@__inference_conv_layer_call_and_return_conditional_losses_263762

inputs1
readvariableop_resource:
identityИҐReadVariableOpҐReadVariableOp_1ҐReadVariableOp_2J
Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  0AK
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: L
Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: n
ReadVariableOpReadVariableOpreadvariableop_resource*&
_output_shapes
:*
dtype0\
mulMulReadVariableOp:value:0Pow:z:0*
T0*&
_output_shapes
:W
truedivRealDivmul:z:0	Pow_1:z:0*
T0*&
_output_shapes
:H
NegNegtruediv:z:0*
T0*&
_output_shapes
:L
RoundRoundtruediv:z:0*
T0*&
_output_shapes
:Q
addAddV2Neg:y:0	Round:y:0*
T0*&
_output_shapes
:V
StopGradientStopGradientadd:z:0*
T0*&
_output_shapes
:c
add_1AddV2truediv:z:0StopGradient:output:0*
T0*&
_output_shapes
:6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?L
add_2AddV2	Neg_1:y:0add_2/y:output:0*
T0*
_output_shapes
: L
mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?J
mul_1Mulmul_1/x:output:0	add_2:z:0*
T0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?D
subSubPow:z:0sub/y:output:0*
T0*
_output_shapes
: e
clip_by_value/MinimumMinimum	add_1:z:0sub:z:0*
T0*&
_output_shapes
:o
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_1:z:0*
T0*&
_output_shapes
:[
mul_2Mul	Pow_1:z:0clip_by_value:z:0*
T0*&
_output_shapes
:Y
	truediv_1RealDiv	mul_2:z:0Pow:z:0*
T0*&
_output_shapes
:L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?^
mul_3Mulmul_3/x:output:0truediv_1:z:0*
T0*&
_output_shapes
:p
ReadVariableOp_1ReadVariableOpreadvariableop_resource*&
_output_shapes
:*
dtype0W
Neg_2NegReadVariableOp_1:value:0*
T0*&
_output_shapes
:U
add_3AddV2	Neg_2:y:0	mul_3:z:0*
T0*&
_output_shapes
:L
mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Z
mul_4Mulmul_4/x:output:0	add_3:z:0*
T0*&
_output_shapes
:Z
StopGradient_1StopGradient	mul_4:z:0*
T0*&
_output_shapes
:p
ReadVariableOp_2ReadVariableOpreadvariableop_resource*&
_output_shapes
:*
dtype0r
add_4AddV2ReadVariableOp_2:value:0StopGradient_1:output:0*
T0*&
_output_shapes
:Л
convolutionConv2Dinputs	add_4:z:0*
T0*/
_output_shapes
:€€€€€€€€€	*
paddingVALID*
strides
k
IdentityIdentityconvolution:output:0^NoOp*
T0*/
_output_shapes
:€€€€€€€€€	}
NoOpNoOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:€€€€€€€€€: 2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_2:W S
/
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
ќ
∞
Q__inference_batch_normalization_1_layer_call_and_return_conditional_losses_264390

inputs/
!batchnorm_readvariableop_resource:3
%batchnorm_mul_readvariableop_resource:1
#batchnorm_readvariableop_1_resource:1
#batchnorm_readvariableop_2_resource:
identityИҐbatchnorm/ReadVariableOpҐbatchnorm/ReadVariableOp_1Ґbatchnorm/ReadVariableOp_2Ґbatchnorm/mul/ReadVariableOpv
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:w
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes
:P
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
:~
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0t
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:c
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€z
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0r
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes
:z
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0r
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
:r
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:€€€€€€€€€b
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€Ї
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€: : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
у 
]
A__inference_relu1_layer_call_and_return_conditional_losses_262319

inputs
identityG
Pow/xConst*
_output_shapes
: *
dtype0*
value	B :G
Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: E
CastCastPow:z:0*

DstT0*

SrcT0*
_output_shapes
: I
Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :I
Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: I
Cast_1Cast	Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: J
ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :Q
Cast_2CastCast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   AG
subSub
Cast_2:y:0sub/y:output:0*
T0*
_output_shapes
: F
Pow_2PowConst:output:0sub:z:0*
T0*
_output_shapes
: D
sub_1Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
	LessEqual	LessEqualinputs	sub_1:z:0*
T0*'
_output_shapes
:€€€€€€€€€F
ReluReluinputs*
T0*'
_output_shapes
:€€€€€€€€€E
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:T
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?w
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
mulMulones_like:output:0	sub_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€r
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€P
mul_1MulinputsCast:y:0*
T0*'
_output_shapes
:€€€€€€€€€[
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*'
_output_shapes
:€€€€€€€€€I
NegNegtruediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€M
RoundRoundtruediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€R
addAddV2Neg:y:0	Round:y:0*
T0*'
_output_shapes
:€€€€€€€€€W
StopGradientStopGradientadd:z:0*
T0*'
_output_shapes
:€€€€€€€€€d
add_1AddV2truediv:z:0StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€[
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: l
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€]
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*'
_output_shapes
:€€€€€€€€€Q
Neg_1NegSelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€V
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?[
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€[
StopGradient_1StopGradient	mul_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€l
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€Q
IdentityIdentity	add_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
і"
]
A__inference_relu0_layer_call_and_return_conditional_losses_263816

inputs
identityG
Pow/xConst*
_output_shapes
: *
dtype0*
value	B :G
Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: E
CastCastPow:z:0*

DstT0*

SrcT0*
_output_shapes
: I
Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :I
Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: I
Cast_1Cast	Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: J
ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :Q
Cast_2CastCast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: J
sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   AG
subSub
Cast_2:y:0sub/y:output:0*
T0*
_output_shapes
: F
Pow_2PowConst:output:0sub:z:0*
T0*
_output_shapes
: D
sub_1Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: c
	LessEqual	LessEqualinputs	sub_1:z:0*
T0*/
_output_shapes
:€€€€€€€€€	N
ReluReluinputs*
T0*/
_output_shapes
:€€€€€€€€€	E
ones_like/ShapeShapeinputs*
T0*
_output_shapes
:T
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*/
_output_shapes
:€€€€€€€€€	D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: c
mulMulones_like:output:0	sub_2:z:0*
T0*/
_output_shapes
:€€€€€€€€€	z
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*/
_output_shapes
:€€€€€€€€€	X
mul_1MulinputsCast:y:0*
T0*/
_output_shapes
:€€€€€€€€€	c
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*/
_output_shapes
:€€€€€€€€€	Q
NegNegtruediv:z:0*
T0*/
_output_shapes
:€€€€€€€€€	U
RoundRoundtruediv:z:0*
T0*/
_output_shapes
:€€€€€€€€€	Z
addAddV2Neg:y:0	Round:y:0*
T0*/
_output_shapes
:€€€€€€€€€	_
StopGradientStopGradientadd:z:0*
T0*/
_output_shapes
:€€€€€€€€€	l
add_1AddV2truediv:z:0StopGradient:output:0*
T0*/
_output_shapes
:€€€€€€€€€	c
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*/
_output_shapes
:€€€€€€€€€	P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: t
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*/
_output_shapes
:€€€€€€€€€	T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    З
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*/
_output_shapes
:€€€€€€€€€	e
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*/
_output_shapes
:€€€€€€€€€	Y
Neg_1NegSelectV2:output:0*
T0*/
_output_shapes
:€€€€€€€€€	^
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*/
_output_shapes
:€€€€€€€€€	L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?c
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*/
_output_shapes
:€€€€€€€€€	c
StopGradient_1StopGradient	mul_3:z:0*
T0*/
_output_shapes
:€€€€€€€€€	t
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*/
_output_shapes
:€€€€€€€€€	Y
IdentityIdentity	add_3:z:0*
T0*/
_output_shapes
:€€€€€€€€€	"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€	:W S
/
_output_shapes
:€€€€€€€€€	
 
_user_specified_nameinputs
Ў
c
E__inference_dropout_2_layer_call_and_return_conditional_losses_264230

inputs

identity_1N
IdentityIdentityinputs*
T0*'
_output_shapes
:€€€€€€€€€[

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:€€€€€€€€€"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:€€€€€€€€€:O K
'
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
Вj
µ
B__inference_dense1_layer_call_and_return_conditional_losses_262254

inputs1
matmul_readvariableop_resource:	ь-
biasadd_readvariableop_resource:E
7batch_normalization_1_batchnorm_readvariableop_resource:I
;batch_normalization_1_batchnorm_mul_readvariableop_resource:G
9batch_normalization_1_batchnorm_readvariableop_1_resource:G
9batch_normalization_1_batchnorm_readvariableop_2_resource:&
assignaddvariableop_resource:	 
identityИҐAssignAddVariableOpҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpҐReadVariableOpҐReadVariableOp_1Ґadd_2/ReadVariableOpҐ.batch_normalization_1/batchnorm/ReadVariableOpҐ0batch_normalization_1/batchnorm/ReadVariableOp_1Ґ0batch_normalization_1/batchnorm/ReadVariableOp_2Ґ2batch_normalization_1/batchnorm/mul/ReadVariableOpҐmul/ReadVariableOpҐmul_1/ReadVariableOpҐmul_3/ReadVariableOpҐsub/ReadVariableOpH
Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Z u
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€Ґ
.batch_normalization_1/batchnorm/ReadVariableOpReadVariableOp7batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0j
%batch_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:є
#batch_normalization_1/batchnorm/addAddV26batch_normalization_1/batchnorm/ReadVariableOp:value:0.batch_normalization_1/batchnorm/add/y:output:0*
T0*
_output_shapes
:|
%batch_normalization_1/batchnorm/RsqrtRsqrt'batch_normalization_1/batchnorm/add:z:0*
T0*
_output_shapes
:™
2batch_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0ґ
#batch_normalization_1/batchnorm/mulMul)batch_normalization_1/batchnorm/Rsqrt:y:0:batch_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:Щ
%batch_normalization_1/batchnorm/mul_1MulBiasAdd:output:0'batch_normalization_1/batchnorm/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€¶
0batch_normalization_1/batchnorm/ReadVariableOp_1ReadVariableOp9batch_normalization_1_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0і
%batch_normalization_1/batchnorm/mul_2Mul8batch_normalization_1/batchnorm/ReadVariableOp_1:value:0'batch_normalization_1/batchnorm/mul:z:0*
T0*
_output_shapes
:¶
0batch_normalization_1/batchnorm/ReadVariableOp_2ReadVariableOp9batch_normalization_1_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0і
#batch_normalization_1/batchnorm/subSub8batch_normalization_1/batchnorm/ReadVariableOp_2:value:0)batch_normalization_1/batchnorm/mul_2:z:0*
T0*
_output_shapes
:і
%batch_normalization_1/batchnorm/add_1AddV2)batch_normalization_1/batchnorm/mul_1:z:0'batch_normalization_1/batchnorm/sub:z:0*
T0*'
_output_shapes
:€€€€€€€€€G
ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R {
AssignAddVariableOpAssignAddVariableOpassignaddvariableop_resourceConst:output:0*
_output_shapes
 *
dtype0	h
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Й
moments/meanMeanBiasAdd:output:0'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:С
moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:0moments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Ю
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(m
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 s
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 В
ReadVariableOpReadVariableOp7batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0J
add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:Y
addAddV2ReadVariableOp:value:0add/y:output:0*
T0*
_output_shapes
:<
RsqrtRsqrtadd:z:0*
T0*
_output_shapes
:L
add_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:a
add_1AddV2moments/Squeeze_1:output:0add_1/y:output:0*
T0*
_output_shapes
:@
Rsqrt_1Rsqrt	add_1:z:0*
T0*
_output_shapes
:К
mul/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0V
mulMul	Rsqrt:y:0mul/ReadVariableOp:value:0*
T0*
_output_shapes
:М
mul_1/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0\
mul_1MulRsqrt_1:y:0mul_1/ReadVariableOp:value:0*
T0*
_output_shapes
:l
ReadVariableOp_1ReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0И
sub/ReadVariableOpReadVariableOp9batch_normalization_1_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0e
subSubReadVariableOp_1:value:0sub/ReadVariableOp:value:0*
T0*
_output_shapes
:C
mul_2Mulmul:z:0sub:z:0*
T0*
_output_shapes
:К
add_2/ReadVariableOpReadVariableOp9batch_normalization_1_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0\
add_2AddV2	mul_2:z:0add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:t
mul_3/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0]
mul_3Mulmul:z:0mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	ьJ
Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @J
Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  а@K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: L
Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: J
mul_4Mul	mul_3:z:0Pow:z:0*
T0*
_output_shapes
:	ьR
truedivRealDiv	mul_4:z:0	Pow_1:z:0*
T0*
_output_shapes
:	ьA
NegNegtruediv:z:0*
T0*
_output_shapes
:	ьE
RoundRoundtruediv:z:0*
T0*
_output_shapes
:	ьL
add_3AddV2Neg:y:0	Round:y:0*
T0*
_output_shapes
:	ьQ
StopGradientStopGradient	add_3:z:0*
T0*
_output_shapes
:	ь\
add_4AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes
:	ь6
Neg_1NegPow:z:0*
T0*
_output_shapes
: L
add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?L
add_5AddV2	Neg_1:y:0add_5/y:output:0*
T0*
_output_shapes
: L
mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?J
mul_5Mulmul_5/x:output:0	add_5:z:0*
T0*
_output_shapes
: L
sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?H
sub_1SubPow:z:0sub_1/y:output:0*
T0*
_output_shapes
: `
clip_by_value/MinimumMinimum	add_4:z:0	sub_1:z:0*
T0*
_output_shapes
:	ьh
clip_by_valueMaximumclip_by_value/Minimum:z:0	mul_5:z:0*
T0*
_output_shapes
:	ьT
mul_6Mul	Pow_1:z:0clip_by_value:z:0*
T0*
_output_shapes
:	ьR
	truediv_1RealDiv	mul_6:z:0Pow:z:0*
T0*
_output_shapes
:	ьL
mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?W
mul_7Mulmul_7/x:output:0truediv_1:z:0*
T0*
_output_shapes
:	ьA
Neg_2Neg	mul_3:z:0*
T0*
_output_shapes
:	ьN
add_6AddV2	Neg_2:y:0	mul_7:z:0*
T0*
_output_shapes
:	ьL
mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?S
mul_8Mulmul_8/x:output:0	add_6:z:0*
T0*
_output_shapes
:	ьS
StopGradient_1StopGradient	mul_8:z:0*
T0*
_output_shapes
:	ь\
add_7AddV2	mul_3:z:0StopGradient_1:output:0*
T0*
_output_shapes
:	ьL
Pow_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  а@Q
Pow_2PowPow_2/x:output:0Pow_2/y:output:0*
T0*
_output_shapes
: L
Pow_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @L
Pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@Q
Pow_3PowPow_3/x:output:0Pow_3/y:output:0*
T0*
_output_shapes
: G
mul_9Mul	add_2:z:0	Pow_2:z:0*
T0*
_output_shapes
:O
	truediv_2RealDiv	mul_9:z:0	Pow_3:z:0*
T0*
_output_shapes
:@
Neg_3Negtruediv_2:z:0*
T0*
_output_shapes
:D
Round_1Roundtruediv_2:z:0*
T0*
_output_shapes
:K
add_8AddV2	Neg_3:y:0Round_1:y:0*
T0*
_output_shapes
:N
StopGradient_2StopGradient	add_8:z:0*
T0*
_output_shapes
:[
add_9AddV2truediv_2:z:0StopGradient_2:output:0*
T0*
_output_shapes
:8
Neg_4Neg	Pow_2:z:0*
T0*
_output_shapes
: M
add_10/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?N
add_10AddV2	Neg_4:y:0add_10/y:output:0*
T0*
_output_shapes
: M
mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?M
mul_10Mulmul_10/x:output:0
add_10:z:0*
T0*
_output_shapes
: L
sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?J
sub_2Sub	Pow_2:z:0sub_2/y:output:0*
T0*
_output_shapes
: ]
clip_by_value_1/MinimumMinimum	add_9:z:0	sub_2:z:0*
T0*
_output_shapes
:h
clip_by_value_1Maximumclip_by_value_1/Minimum:z:0
mul_10:z:0*
T0*
_output_shapes
:R
mul_11Mul	Pow_3:z:0clip_by_value_1:z:0*
T0*
_output_shapes
:P
	truediv_3RealDiv
mul_11:z:0	Pow_2:z:0*
T0*
_output_shapes
:M
mul_12/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?T
mul_12Mulmul_12/x:output:0truediv_3:z:0*
T0*
_output_shapes
:<
Neg_5Neg	add_2:z:0*
T0*
_output_shapes
:K
add_11AddV2	Neg_5:y:0
mul_12:z:0*
T0*
_output_shapes
:M
mul_13/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Q
mul_13Mulmul_13/x:output:0
add_11:z:0*
T0*
_output_shapes
:O
StopGradient_3StopGradient
mul_13:z:0*
T0*
_output_shapes
:X
add_12AddV2	add_2:z:0StopGradient_3:output:0*
T0*
_output_shapes
:W
MatMul_1MatMulinputs	add_7:z:0*
T0*'
_output_shapes
:€€€€€€€€€f
	BiasAdd_1BiasAddMatMul_1:product:0
add_12:z:0*
T0*'
_output_shapes
:€€€€€€€€€a
IdentityIdentityBiasAdd_1:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€м
NoOpNoOp^AssignAddVariableOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp^ReadVariableOp^ReadVariableOp_1^add_2/ReadVariableOp/^batch_normalization_1/batchnorm/ReadVariableOp1^batch_normalization_1/batchnorm/ReadVariableOp_11^batch_normalization_1/batchnorm/ReadVariableOp_23^batch_normalization_1/batchnorm/mul/ReadVariableOp^mul/ReadVariableOp^mul_1/ReadVariableOp^mul_3/ReadVariableOp^sub/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":€€€€€€€€€ь: : : : : : : 2*
AssignAddVariableOpAssignAddVariableOp20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12,
add_2/ReadVariableOpadd_2/ReadVariableOp2`
.batch_normalization_1/batchnorm/ReadVariableOp.batch_normalization_1/batchnorm/ReadVariableOp2d
0batch_normalization_1/batchnorm/ReadVariableOp_10batch_normalization_1/batchnorm/ReadVariableOp_12d
0batch_normalization_1/batchnorm/ReadVariableOp_20batch_normalization_1/batchnorm/ReadVariableOp_22h
2batch_normalization_1/batchnorm/mul/ReadVariableOp2batch_normalization_1/batchnorm/mul/ReadVariableOp2(
mul/ReadVariableOpmul/ReadVariableOp2,
mul_1/ReadVariableOpmul_1/ReadVariableOp2,
mul_3/ReadVariableOpmul_3/ReadVariableOp2(
sub/ReadVariableOpsub/ReadVariableOp:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
х
c
*__inference_dropout_1_layer_call_fn_263837

inputs
identityИҐStatefulPartitionedCallЅ
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€ь* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_dropout_1_layer_call_and_return_conditional_losses_262695p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:€€€€€€€€€ь`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:€€€€€€€€€ь22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
£
F
*__inference_dropout_1_layer_call_fn_263832

inputs
identity±
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€ь* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_dropout_1_layer_call_and_return_conditional_losses_262130a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:€€€€€€€€€ь"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:€€€€€€€€€ь:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
≈
_
C__inference_flatten_layer_call_and_return_conditional_losses_262123

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€ь   ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:€€€€€€€€€ьY
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:€€€€€€€€€ь"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€	:W S
/
_output_shapes
:€€€€€€€€€	
 
_user_specified_nameinputs
иж
є
E__inference_cicada-v2_layer_call_and_return_conditional_losses_263695

inputs6
conv_readvariableop_resource:8
%dense1_matmul_readvariableop_resource:	ь4
&dense1_biasadd_readvariableop_resource:R
Ddense1_batch_normalization_1_assignmovingavg_readvariableop_resource:T
Fdense1_batch_normalization_1_assignmovingavg_1_readvariableop_resource:P
Bdense1_batch_normalization_1_batchnorm_mul_readvariableop_resource:L
>dense1_batch_normalization_1_batchnorm_readvariableop_resource:-
#dense1_assignaddvariableop_resource:	 0
dense2_readvariableop_resource:
identityИҐconv/ReadVariableOpҐconv/ReadVariableOp_1Ґconv/ReadVariableOp_2Ґdense1/AssignAddVariableOpҐdense1/BiasAdd/ReadVariableOpҐdense1/MatMul/ReadVariableOpҐdense1/ReadVariableOpҐdense1/ReadVariableOp_1Ґdense1/ReadVariableOp_2Ґdense1/add_2/ReadVariableOpҐ,dense1/batch_normalization_1/AssignMovingAvgҐ;dense1/batch_normalization_1/AssignMovingAvg/ReadVariableOpҐ.dense1/batch_normalization_1/AssignMovingAvg_1Ґ=dense1/batch_normalization_1/AssignMovingAvg_1/ReadVariableOpҐ5dense1/batch_normalization_1/batchnorm/ReadVariableOpҐ9dense1/batch_normalization_1/batchnorm/mul/ReadVariableOpҐdense1/mul/ReadVariableOpҐdense1/mul_1/ReadVariableOpҐdense1/mul_3/ReadVariableOpҐdense2/ReadVariableOpҐdense2/ReadVariableOp_1Ґdense2/ReadVariableOp_2C
reshape/ShapeShapeinputs*
T0*
_output_shapes
:e
reshape/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: g
reshape/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:g
reshape/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:щ
reshape/strided_sliceStridedSlicereshape/Shape:output:0$reshape/strided_slice/stack:output:0&reshape/strided_slice/stack_1:output:0&reshape/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskY
reshape/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :Y
reshape/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :Y
reshape/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :—
reshape/Reshape/shapePackreshape/strided_slice:output:0 reshape/Reshape/shape/1:output:0 reshape/Reshape/shape/2:output:0 reshape/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:|
reshape/ReshapeReshapeinputsreshape/Reshape/shape:output:0*
T0*/
_output_shapes
:€€€€€€€€€O

conv/Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @O

conv/Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  0AZ
conv/PowPowconv/Pow/x:output:0conv/Pow/y:output:0*
T0*
_output_shapes
: Q
conv/Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @Q
conv/Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@`

conv/Pow_1Powconv/Pow_1/x:output:0conv/Pow_1/y:output:0*
T0*
_output_shapes
: x
conv/ReadVariableOpReadVariableOpconv_readvariableop_resource*&
_output_shapes
:*
dtype0k
conv/mulMulconv/ReadVariableOp:value:0conv/Pow:z:0*
T0*&
_output_shapes
:f
conv/truedivRealDivconv/mul:z:0conv/Pow_1:z:0*
T0*&
_output_shapes
:R
conv/NegNegconv/truediv:z:0*
T0*&
_output_shapes
:V

conv/RoundRoundconv/truediv:z:0*
T0*&
_output_shapes
:`
conv/addAddV2conv/Neg:y:0conv/Round:y:0*
T0*&
_output_shapes
:`
conv/StopGradientStopGradientconv/add:z:0*
T0*&
_output_shapes
:r

conv/add_1AddV2conv/truediv:z:0conv/StopGradient:output:0*
T0*&
_output_shapes
:@

conv/Neg_1Negconv/Pow:z:0*
T0*
_output_shapes
: Q
conv/add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?[

conv/add_2AddV2conv/Neg_1:y:0conv/add_2/y:output:0*
T0*
_output_shapes
: Q
conv/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Y

conv/mul_1Mulconv/mul_1/x:output:0conv/add_2:z:0*
T0*
_output_shapes
: O

conv/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?S
conv/subSubconv/Pow:z:0conv/sub/y:output:0*
T0*
_output_shapes
: t
conv/clip_by_value/MinimumMinimumconv/add_1:z:0conv/sub:z:0*
T0*&
_output_shapes
:~
conv/clip_by_valueMaximumconv/clip_by_value/Minimum:z:0conv/mul_1:z:0*
T0*&
_output_shapes
:j

conv/mul_2Mulconv/Pow_1:z:0conv/clip_by_value:z:0*
T0*&
_output_shapes
:h
conv/truediv_1RealDivconv/mul_2:z:0conv/Pow:z:0*
T0*&
_output_shapes
:Q
conv/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?m

conv/mul_3Mulconv/mul_3/x:output:0conv/truediv_1:z:0*
T0*&
_output_shapes
:z
conv/ReadVariableOp_1ReadVariableOpconv_readvariableop_resource*&
_output_shapes
:*
dtype0a

conv/Neg_2Negconv/ReadVariableOp_1:value:0*
T0*&
_output_shapes
:d

conv/add_3AddV2conv/Neg_2:y:0conv/mul_3:z:0*
T0*&
_output_shapes
:Q
conv/mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?i

conv/mul_4Mulconv/mul_4/x:output:0conv/add_3:z:0*
T0*&
_output_shapes
:d
conv/StopGradient_1StopGradientconv/mul_4:z:0*
T0*&
_output_shapes
:z
conv/ReadVariableOp_2ReadVariableOpconv_readvariableop_resource*&
_output_shapes
:*
dtype0Б

conv/add_4AddV2conv/ReadVariableOp_2:value:0conv/StopGradient_1:output:0*
T0*&
_output_shapes
:І
conv/convolutionConv2Dreshape/Reshape:output:0conv/add_4:z:0*
T0*/
_output_shapes
:€€€€€€€€€	*
paddingVALID*
strides
M
relu0/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :M
relu0/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
]
	relu0/PowPowrelu0/Pow/x:output:0relu0/Pow/y:output:0*
T0*
_output_shapes
: Q

relu0/CastCastrelu0/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: O
relu0/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :O
relu0/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :c
relu0/Pow_1Powrelu0/Pow_1/x:output:0relu0/Pow_1/y:output:0*
T0*
_output_shapes
: U
relu0/Cast_1Castrelu0/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: P
relu0/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @P
relu0/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :]
relu0/Cast_2Castrelu0/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: P
relu0/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   AY
	relu0/subSubrelu0/Cast_2:y:0relu0/sub/y:output:0*
T0*
_output_shapes
: X
relu0/Pow_2Powrelu0/Const:output:0relu0/sub:z:0*
T0*
_output_shapes
: V
relu0/sub_1Subrelu0/Cast_1:y:0relu0/Pow_2:z:0*
T0*
_output_shapes
: В
relu0/LessEqual	LessEqualconv/convolution:output:0relu0/sub_1:z:0*
T0*/
_output_shapes
:€€€€€€€€€	g

relu0/ReluReluconv/convolution:output:0*
T0*/
_output_shapes
:€€€€€€€€€	^
relu0/ones_like/ShapeShapeconv/convolution:output:0*
T0*
_output_shapes
:Z
relu0/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?С
relu0/ones_likeFillrelu0/ones_like/Shape:output:0relu0/ones_like/Const:output:0*
T0*/
_output_shapes
:€€€€€€€€€	V
relu0/sub_2Subrelu0/Cast_1:y:0relu0/Pow_2:z:0*
T0*
_output_shapes
: u
	relu0/mulMulrelu0/ones_like:output:0relu0/sub_2:z:0*
T0*/
_output_shapes
:€€€€€€€€€	Т
relu0/SelectV2SelectV2relu0/LessEqual:z:0relu0/Relu:activations:0relu0/mul:z:0*
T0*/
_output_shapes
:€€€€€€€€€	w
relu0/mul_1Mulconv/convolution:output:0relu0/Cast:y:0*
T0*/
_output_shapes
:€€€€€€€€€	u
relu0/truedivRealDivrelu0/mul_1:z:0relu0/Cast_1:y:0*
T0*/
_output_shapes
:€€€€€€€€€	]
	relu0/NegNegrelu0/truediv:z:0*
T0*/
_output_shapes
:€€€€€€€€€	a
relu0/RoundRoundrelu0/truediv:z:0*
T0*/
_output_shapes
:€€€€€€€€€	l
	relu0/addAddV2relu0/Neg:y:0relu0/Round:y:0*
T0*/
_output_shapes
:€€€€€€€€€	k
relu0/StopGradientStopGradientrelu0/add:z:0*
T0*/
_output_shapes
:€€€€€€€€€	~
relu0/add_1AddV2relu0/truediv:z:0relu0/StopGradient:output:0*
T0*/
_output_shapes
:€€€€€€€€€	u
relu0/truediv_1RealDivrelu0/add_1:z:0relu0/Cast:y:0*
T0*/
_output_shapes
:€€€€€€€€€	V
relu0/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?g
relu0/truediv_2RealDivrelu0/truediv_2/x:output:0relu0/Cast:y:0*
T0*
_output_shapes
: R
relu0/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?`
relu0/sub_3Subrelu0/sub_3/x:output:0relu0/truediv_2:z:0*
T0*
_output_shapes
: Ж
relu0/clip_by_value/MinimumMinimumrelu0/truediv_1:z:0relu0/sub_3:z:0*
T0*/
_output_shapes
:€€€€€€€€€	Z
relu0/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    Щ
relu0/clip_by_valueMaximumrelu0/clip_by_value/Minimum:z:0relu0/clip_by_value/y:output:0*
T0*/
_output_shapes
:€€€€€€€€€	w
relu0/mul_2Mulrelu0/Cast_1:y:0relu0/clip_by_value:z:0*
T0*/
_output_shapes
:€€€€€€€€€	e
relu0/Neg_1Negrelu0/SelectV2:output:0*
T0*/
_output_shapes
:€€€€€€€€€	p
relu0/add_2AddV2relu0/Neg_1:y:0relu0/mul_2:z:0*
T0*/
_output_shapes
:€€€€€€€€€	R
relu0/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?u
relu0/mul_3Mulrelu0/mul_3/x:output:0relu0/add_2:z:0*
T0*/
_output_shapes
:€€€€€€€€€	o
relu0/StopGradient_1StopGradientrelu0/mul_3:z:0*
T0*/
_output_shapes
:€€€€€€€€€	Ж
relu0/add_3AddV2relu0/SelectV2:output:0relu0/StopGradient_1:output:0*
T0*/
_output_shapes
:€€€€€€€€€	^
flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€ь   v
flatten/ReshapeReshaperelu0/add_3:z:0flatten/Const:output:0*
T0*(
_output_shapes
:€€€€€€€€€ь\
dropout_1/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  Р?Л
dropout_1/dropout/MulMulflatten/Reshape:output:0 dropout_1/dropout/Const:output:0*
T0*(
_output_shapes
:€€€€€€€€€ь_
dropout_1/dropout/ShapeShapeflatten/Reshape:output:0*
T0*
_output_shapes
:°
.dropout_1/dropout/random_uniform/RandomUniformRandomUniform dropout_1/dropout/Shape:output:0*
T0*(
_output_shapes
:€€€€€€€€€ь*
dtype0e
 dropout_1/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *9Ог=≈
dropout_1/dropout/GreaterEqualGreaterEqual7dropout_1/dropout/random_uniform/RandomUniform:output:0)dropout_1/dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:€€€€€€€€€ьД
dropout_1/dropout/CastCast"dropout_1/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:€€€€€€€€€ьИ
dropout_1/dropout/Mul_1Muldropout_1/dropout/Mul:z:0dropout_1/dropout/Cast:y:0*
T0*(
_output_shapes
:€€€€€€€€€ьO
dense1/Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 ZГ
dense1/MatMul/ReadVariableOpReadVariableOp%dense1_matmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0М
dense1/MatMulMatMuldropout_1/dropout/Mul_1:z:0$dense1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€А
dense1/BiasAdd/ReadVariableOpReadVariableOp&dense1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0Л
dense1/BiasAddBiasAdddense1/MatMul:product:0%dense1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€Е
;dense1/batch_normalization_1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:  
)dense1/batch_normalization_1/moments/meanMeandense1/BiasAdd:output:0Ddense1/batch_normalization_1/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(Ю
1dense1/batch_normalization_1/moments/StopGradientStopGradient2dense1/batch_normalization_1/moments/mean:output:0*
T0*
_output_shapes

:“
6dense1/batch_normalization_1/moments/SquaredDifferenceSquaredDifferencedense1/BiasAdd:output:0:dense1/batch_normalization_1/moments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€Й
?dense1/batch_normalization_1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: х
-dense1/batch_normalization_1/moments/varianceMean:dense1/batch_normalization_1/moments/SquaredDifference:z:0Hdense1/batch_normalization_1/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(І
,dense1/batch_normalization_1/moments/SqueezeSqueeze2dense1/batch_normalization_1/moments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 ≠
.dense1/batch_normalization_1/moments/Squeeze_1Squeeze6dense1/batch_normalization_1/moments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 w
2dense1/batch_normalization_1/AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
„#<Љ
;dense1/batch_normalization_1/AssignMovingAvg/ReadVariableOpReadVariableOpDdense1_batch_normalization_1_assignmovingavg_readvariableop_resource*
_output_shapes
:*
dtype0Ў
0dense1/batch_normalization_1/AssignMovingAvg/subSubCdense1/batch_normalization_1/AssignMovingAvg/ReadVariableOp:value:05dense1/batch_normalization_1/moments/Squeeze:output:0*
T0*
_output_shapes
:ѕ
0dense1/batch_normalization_1/AssignMovingAvg/mulMul4dense1/batch_normalization_1/AssignMovingAvg/sub:z:0;dense1/batch_normalization_1/AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:†
,dense1/batch_normalization_1/AssignMovingAvgAssignSubVariableOpDdense1_batch_normalization_1_assignmovingavg_readvariableop_resource4dense1/batch_normalization_1/AssignMovingAvg/mul:z:0<^dense1/batch_normalization_1/AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0y
4dense1/batch_normalization_1/AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
„#<ј
=dense1/batch_normalization_1/AssignMovingAvg_1/ReadVariableOpReadVariableOpFdense1_batch_normalization_1_assignmovingavg_1_readvariableop_resource*
_output_shapes
:*
dtype0ё
2dense1/batch_normalization_1/AssignMovingAvg_1/subSubEdense1/batch_normalization_1/AssignMovingAvg_1/ReadVariableOp:value:07dense1/batch_normalization_1/moments/Squeeze_1:output:0*
T0*
_output_shapes
:’
2dense1/batch_normalization_1/AssignMovingAvg_1/mulMul6dense1/batch_normalization_1/AssignMovingAvg_1/sub:z:0=dense1/batch_normalization_1/AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:®
.dense1/batch_normalization_1/AssignMovingAvg_1AssignSubVariableOpFdense1_batch_normalization_1_assignmovingavg_1_readvariableop_resource6dense1/batch_normalization_1/AssignMovingAvg_1/mul:z:0>^dense1/batch_normalization_1/AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0q
,dense1/batch_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:»
*dense1/batch_normalization_1/batchnorm/addAddV27dense1/batch_normalization_1/moments/Squeeze_1:output:05dense1/batch_normalization_1/batchnorm/add/y:output:0*
T0*
_output_shapes
:К
,dense1/batch_normalization_1/batchnorm/RsqrtRsqrt.dense1/batch_normalization_1/batchnorm/add:z:0*
T0*
_output_shapes
:Є
9dense1/batch_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOpBdense1_batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0Ћ
*dense1/batch_normalization_1/batchnorm/mulMul0dense1/batch_normalization_1/batchnorm/Rsqrt:y:0Adense1/batch_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:Ѓ
,dense1/batch_normalization_1/batchnorm/mul_1Muldense1/BiasAdd:output:0.dense1/batch_normalization_1/batchnorm/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€њ
,dense1/batch_normalization_1/batchnorm/mul_2Mul5dense1/batch_normalization_1/moments/Squeeze:output:0.dense1/batch_normalization_1/batchnorm/mul:z:0*
T0*
_output_shapes
:∞
5dense1/batch_normalization_1/batchnorm/ReadVariableOpReadVariableOp>dense1_batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0«
*dense1/batch_normalization_1/batchnorm/subSub=dense1/batch_normalization_1/batchnorm/ReadVariableOp:value:00dense1/batch_normalization_1/batchnorm/mul_2:z:0*
T0*
_output_shapes
:…
,dense1/batch_normalization_1/batchnorm/add_1AddV20dense1/batch_normalization_1/batchnorm/mul_1:z:0.dense1/batch_normalization_1/batchnorm/sub:z:0*
T0*'
_output_shapes
:€€€€€€€€€N
dense1/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 RР
dense1/AssignAddVariableOpAssignAddVariableOp#dense1_assignaddvariableop_resourcedense1/Const:output:0*
_output_shapes
 *
dtype0	o
%dense1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Ю
dense1/moments/meanMeandense1/BiasAdd:output:0.dense1/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(r
dense1/moments/StopGradientStopGradientdense1/moments/mean:output:0*
T0*
_output_shapes

:¶
 dense1/moments/SquaredDifferenceSquaredDifferencedense1/BiasAdd:output:0$dense1/moments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€s
)dense1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: ≥
dense1/moments/varianceMean$dense1/moments/SquaredDifference:z:02dense1/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims({
dense1/moments/SqueezeSqueezedense1/moments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 Б
dense1/moments/Squeeze_1Squeeze dense1/moments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 …
dense1/ReadVariableOpReadVariableOpFdense1_batch_normalization_1_assignmovingavg_1_readvariableop_resource/^dense1/batch_normalization_1/AssignMovingAvg_1*
_output_shapes
:*
dtype0Q
dense1/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:n

dense1/addAddV2dense1/ReadVariableOp:value:0dense1/add/y:output:0*
T0*
_output_shapes
:J
dense1/RsqrtRsqrtdense1/add:z:0*
T0*
_output_shapes
:S
dense1/add_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:v
dense1/add_1AddV2!dense1/moments/Squeeze_1:output:0dense1/add_1/y:output:0*
T0*
_output_shapes
:N
dense1/Rsqrt_1Rsqrtdense1/add_1:z:0*
T0*
_output_shapes
:Ш
dense1/mul/ReadVariableOpReadVariableOpBdense1_batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0k

dense1/mulMuldense1/Rsqrt:y:0!dense1/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:Ъ
dense1/mul_1/ReadVariableOpReadVariableOpBdense1_batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0q
dense1/mul_1Muldense1/Rsqrt_1:y:0#dense1/mul_1/ReadVariableOp:value:0*
T0*
_output_shapes
:z
dense1/ReadVariableOp_1ReadVariableOp&dense1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0x

dense1/subSubdense1/ReadVariableOp_1:value:0dense1/moments/Squeeze:output:0*
T0*
_output_shapes
:Z
dense1/mul_2Muldense1/mul_1:z:0dense1/sub:z:0*
T0*
_output_shapes
:Ц
dense1/add_2/ReadVariableOpReadVariableOp>dense1_batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0q
dense1/add_2AddV2dense1/mul_2:z:0#dense1/add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:В
dense1/mul_3/ReadVariableOpReadVariableOp%dense1_matmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0r
dense1/mul_3Muldense1/mul:z:0#dense1/mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	ьQ
dense1/Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @Q
dense1/Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  а@`

dense1/PowPowdense1/Pow/x:output:0dense1/Pow/y:output:0*
T0*
_output_shapes
: S
dense1/Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @S
dense1/Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?f
dense1/Pow_1Powdense1/Pow_1/x:output:0dense1/Pow_1/y:output:0*
T0*
_output_shapes
: _
dense1/mul_4Muldense1/mul_3:z:0dense1/Pow:z:0*
T0*
_output_shapes
:	ьg
dense1/truedivRealDivdense1/mul_4:z:0dense1/Pow_1:z:0*
T0*
_output_shapes
:	ьO

dense1/NegNegdense1/truediv:z:0*
T0*
_output_shapes
:	ьS
dense1/RoundRounddense1/truediv:z:0*
T0*
_output_shapes
:	ьa
dense1/add_3AddV2dense1/Neg:y:0dense1/Round:y:0*
T0*
_output_shapes
:	ь_
dense1/StopGradientStopGradientdense1/add_3:z:0*
T0*
_output_shapes
:	ьq
dense1/add_4AddV2dense1/truediv:z:0dense1/StopGradient:output:0*
T0*
_output_shapes
:	ьD
dense1/Neg_1Negdense1/Pow:z:0*
T0*
_output_shapes
: S
dense1/add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?a
dense1/add_5AddV2dense1/Neg_1:y:0dense1/add_5/y:output:0*
T0*
_output_shapes
: S
dense1/mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?_
dense1/mul_5Muldense1/mul_5/x:output:0dense1/add_5:z:0*
T0*
_output_shapes
: S
dense1/sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?]
dense1/sub_1Subdense1/Pow:z:0dense1/sub_1/y:output:0*
T0*
_output_shapes
: u
dense1/clip_by_value/MinimumMinimumdense1/add_4:z:0dense1/sub_1:z:0*
T0*
_output_shapes
:	ь}
dense1/clip_by_valueMaximum dense1/clip_by_value/Minimum:z:0dense1/mul_5:z:0*
T0*
_output_shapes
:	ьi
dense1/mul_6Muldense1/Pow_1:z:0dense1/clip_by_value:z:0*
T0*
_output_shapes
:	ьg
dense1/truediv_1RealDivdense1/mul_6:z:0dense1/Pow:z:0*
T0*
_output_shapes
:	ьS
dense1/mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?l
dense1/mul_7Muldense1/mul_7/x:output:0dense1/truediv_1:z:0*
T0*
_output_shapes
:	ьO
dense1/Neg_2Negdense1/mul_3:z:0*
T0*
_output_shapes
:	ьc
dense1/add_6AddV2dense1/Neg_2:y:0dense1/mul_7:z:0*
T0*
_output_shapes
:	ьS
dense1/mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?h
dense1/mul_8Muldense1/mul_8/x:output:0dense1/add_6:z:0*
T0*
_output_shapes
:	ьa
dense1/StopGradient_1StopGradientdense1/mul_8:z:0*
T0*
_output_shapes
:	ьq
dense1/add_7AddV2dense1/mul_3:z:0dense1/StopGradient_1:output:0*
T0*
_output_shapes
:	ьS
dense1/Pow_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @S
dense1/Pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  а@f
dense1/Pow_2Powdense1/Pow_2/x:output:0dense1/Pow_2/y:output:0*
T0*
_output_shapes
: S
dense1/Pow_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @S
dense1/Pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@f
dense1/Pow_3Powdense1/Pow_3/x:output:0dense1/Pow_3/y:output:0*
T0*
_output_shapes
: \
dense1/mul_9Muldense1/add_2:z:0dense1/Pow_2:z:0*
T0*
_output_shapes
:d
dense1/truediv_2RealDivdense1/mul_9:z:0dense1/Pow_3:z:0*
T0*
_output_shapes
:N
dense1/Neg_3Negdense1/truediv_2:z:0*
T0*
_output_shapes
:R
dense1/Round_1Rounddense1/truediv_2:z:0*
T0*
_output_shapes
:`
dense1/add_8AddV2dense1/Neg_3:y:0dense1/Round_1:y:0*
T0*
_output_shapes
:\
dense1/StopGradient_2StopGradientdense1/add_8:z:0*
T0*
_output_shapes
:p
dense1/add_9AddV2dense1/truediv_2:z:0dense1/StopGradient_2:output:0*
T0*
_output_shapes
:F
dense1/Neg_4Negdense1/Pow_2:z:0*
T0*
_output_shapes
: T
dense1/add_10/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?c
dense1/add_10AddV2dense1/Neg_4:y:0dense1/add_10/y:output:0*
T0*
_output_shapes
: T
dense1/mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?b
dense1/mul_10Muldense1/mul_10/x:output:0dense1/add_10:z:0*
T0*
_output_shapes
: S
dense1/sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?_
dense1/sub_2Subdense1/Pow_2:z:0dense1/sub_2/y:output:0*
T0*
_output_shapes
: r
dense1/clip_by_value_1/MinimumMinimumdense1/add_9:z:0dense1/sub_2:z:0*
T0*
_output_shapes
:}
dense1/clip_by_value_1Maximum"dense1/clip_by_value_1/Minimum:z:0dense1/mul_10:z:0*
T0*
_output_shapes
:g
dense1/mul_11Muldense1/Pow_3:z:0dense1/clip_by_value_1:z:0*
T0*
_output_shapes
:e
dense1/truediv_3RealDivdense1/mul_11:z:0dense1/Pow_2:z:0*
T0*
_output_shapes
:T
dense1/mul_12/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?i
dense1/mul_12Muldense1/mul_12/x:output:0dense1/truediv_3:z:0*
T0*
_output_shapes
:J
dense1/Neg_5Negdense1/add_2:z:0*
T0*
_output_shapes
:`
dense1/add_11AddV2dense1/Neg_5:y:0dense1/mul_12:z:0*
T0*
_output_shapes
:T
dense1/mul_13/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?f
dense1/mul_13Muldense1/mul_13/x:output:0dense1/add_11:z:0*
T0*
_output_shapes
:]
dense1/StopGradient_3StopGradientdense1/mul_13:z:0*
T0*
_output_shapes
:m
dense1/add_12AddV2dense1/add_2:z:0dense1/StopGradient_3:output:0*
T0*
_output_shapes
:z
dense1/MatMul_1MatMuldropout_1/dropout/Mul_1:z:0dense1/add_7:z:0*
T0*'
_output_shapes
:€€€€€€€€€T
dense1/add_13/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:x
dense1/add_13AddV2!dense1/moments/Squeeze_1:output:0dense1/add_13/y:output:0*
T0*
_output_shapes
:O
dense1/Rsqrt_2Rsqrtdense1/add_13:z:0*
T0*
_output_shapes
:Ћ
dense1/ReadVariableOp_2ReadVariableOpFdense1_batch_normalization_1_assignmovingavg_1_readvariableop_resource/^dense1/batch_normalization_1/AssignMovingAvg_1*
_output_shapes
:*
dtype0T
dense1/add_14/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:v
dense1/add_14AddV2dense1/ReadVariableOp_2:value:0dense1/add_14/y:output:0*
T0*
_output_shapes
:K
dense1/SqrtSqrtdense1/add_14:z:0*
T0*
_output_shapes
:T
dense1/add_15/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:x
dense1/add_15AddV2!dense1/moments/Squeeze_1:output:0dense1/add_15/y:output:0*
T0*
_output_shapes
:O
dense1/Rsqrt_3Rsqrtdense1/add_15:z:0*
T0*
_output_shapes
:^
dense1/mul_14Muldense1/Sqrt:y:0dense1/Rsqrt_3:y:0*
T0*
_output_shapes
:t
dense1/Mul_15Muldense1/MatMul_1:product:0dense1/mul_14:z:0*
T0*'
_output_shapes
:€€€€€€€€€s
dense1/BiasAdd_1BiasAdddense1/Mul_15:z:0dense1/add_12:z:0*
T0*'
_output_shapes
:€€€€€€€€€M
relu1/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :M
relu1/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
]
	relu1/PowPowrelu1/Pow/x:output:0relu1/Pow/y:output:0*
T0*
_output_shapes
: Q

relu1/CastCastrelu1/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: O
relu1/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :O
relu1/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :c
relu1/Pow_1Powrelu1/Pow_1/x:output:0relu1/Pow_1/y:output:0*
T0*
_output_shapes
: U
relu1/Cast_1Castrelu1/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: P
relu1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @P
relu1/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :]
relu1/Cast_2Castrelu1/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: P
relu1/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   AY
	relu1/subSubrelu1/Cast_2:y:0relu1/sub/y:output:0*
T0*
_output_shapes
: X
relu1/Pow_2Powrelu1/Const:output:0relu1/sub:z:0*
T0*
_output_shapes
: V
relu1/sub_1Subrelu1/Cast_1:y:0relu1/Pow_2:z:0*
T0*
_output_shapes
: z
relu1/LessEqual	LessEqualdense1/BiasAdd_1:output:0relu1/sub_1:z:0*
T0*'
_output_shapes
:€€€€€€€€€_

relu1/ReluReludense1/BiasAdd_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€^
relu1/ones_like/ShapeShapedense1/BiasAdd_1:output:0*
T0*
_output_shapes
:Z
relu1/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Й
relu1/ones_likeFillrelu1/ones_like/Shape:output:0relu1/ones_like/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€V
relu1/sub_2Subrelu1/Cast_1:y:0relu1/Pow_2:z:0*
T0*
_output_shapes
: m
	relu1/mulMulrelu1/ones_like:output:0relu1/sub_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€К
relu1/SelectV2SelectV2relu1/LessEqual:z:0relu1/Relu:activations:0relu1/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€o
relu1/mul_1Muldense1/BiasAdd_1:output:0relu1/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€m
relu1/truedivRealDivrelu1/mul_1:z:0relu1/Cast_1:y:0*
T0*'
_output_shapes
:€€€€€€€€€U
	relu1/NegNegrelu1/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€Y
relu1/RoundRoundrelu1/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€d
	relu1/addAddV2relu1/Neg:y:0relu1/Round:y:0*
T0*'
_output_shapes
:€€€€€€€€€c
relu1/StopGradientStopGradientrelu1/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€v
relu1/add_1AddV2relu1/truediv:z:0relu1/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€m
relu1/truediv_1RealDivrelu1/add_1:z:0relu1/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€V
relu1/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?g
relu1/truediv_2RealDivrelu1/truediv_2/x:output:0relu1/Cast:y:0*
T0*
_output_shapes
: R
relu1/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?`
relu1/sub_3Subrelu1/sub_3/x:output:0relu1/truediv_2:z:0*
T0*
_output_shapes
: ~
relu1/clip_by_value/MinimumMinimumrelu1/truediv_1:z:0relu1/sub_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€Z
relu1/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    С
relu1/clip_by_valueMaximumrelu1/clip_by_value/Minimum:z:0relu1/clip_by_value/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€o
relu1/mul_2Mulrelu1/Cast_1:y:0relu1/clip_by_value:z:0*
T0*'
_output_shapes
:€€€€€€€€€]
relu1/Neg_1Negrelu1/SelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€h
relu1/add_2AddV2relu1/Neg_1:y:0relu1/mul_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€R
relu1/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?m
relu1/mul_3Mulrelu1/mul_3/x:output:0relu1/add_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€g
relu1/StopGradient_1StopGradientrelu1/mul_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€~
relu1/add_3AddV2relu1/SelectV2:output:0relu1/StopGradient_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€\
dropout_2/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *%IТ?Б
dropout_2/dropout/MulMulrelu1/add_3:z:0 dropout_2/dropout/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€V
dropout_2/dropout/ShapeShaperelu1/add_3:z:0*
T0*
_output_shapes
:†
.dropout_2/dropout/random_uniform/RandomUniformRandomUniform dropout_2/dropout/Shape:output:0*
T0*'
_output_shapes
:€€€€€€€€€*
dtype0e
 dropout_2/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >ƒ
dropout_2/dropout/GreaterEqualGreaterEqual7dropout_2/dropout/random_uniform/RandomUniform:output:0)dropout_2/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€Г
dropout_2/dropout/CastCast"dropout_2/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:€€€€€€€€€З
dropout_2/dropout/Mul_1Muldropout_2/dropout/Mul:z:0dropout_2/dropout/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€Q
dense2/Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @Q
dense2/Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  0A`

dense2/PowPowdense2/Pow/x:output:0dense2/Pow/y:output:0*
T0*
_output_shapes
: S
dense2/Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @S
dense2/Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@f
dense2/Pow_1Powdense2/Pow_1/x:output:0dense2/Pow_1/y:output:0*
T0*
_output_shapes
: t
dense2/ReadVariableOpReadVariableOpdense2_readvariableop_resource*
_output_shapes

:*
dtype0i

dense2/mulMuldense2/ReadVariableOp:value:0dense2/Pow:z:0*
T0*
_output_shapes

:d
dense2/truedivRealDivdense2/mul:z:0dense2/Pow_1:z:0*
T0*
_output_shapes

:N

dense2/NegNegdense2/truediv:z:0*
T0*
_output_shapes

:R
dense2/RoundRounddense2/truediv:z:0*
T0*
_output_shapes

:^

dense2/addAddV2dense2/Neg:y:0dense2/Round:y:0*
T0*
_output_shapes

:\
dense2/StopGradientStopGradientdense2/add:z:0*
T0*
_output_shapes

:p
dense2/add_1AddV2dense2/truediv:z:0dense2/StopGradient:output:0*
T0*
_output_shapes

:D
dense2/Neg_1Negdense2/Pow:z:0*
T0*
_output_shapes
: S
dense2/add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?a
dense2/add_2AddV2dense2/Neg_1:y:0dense2/add_2/y:output:0*
T0*
_output_shapes
: S
dense2/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?_
dense2/mul_1Muldense2/mul_1/x:output:0dense2/add_2:z:0*
T0*
_output_shapes
: Q
dense2/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Y

dense2/subSubdense2/Pow:z:0dense2/sub/y:output:0*
T0*
_output_shapes
: r
dense2/clip_by_value/MinimumMinimumdense2/add_1:z:0dense2/sub:z:0*
T0*
_output_shapes

:|
dense2/clip_by_valueMaximum dense2/clip_by_value/Minimum:z:0dense2/mul_1:z:0*
T0*
_output_shapes

:h
dense2/mul_2Muldense2/Pow_1:z:0dense2/clip_by_value:z:0*
T0*
_output_shapes

:f
dense2/truediv_1RealDivdense2/mul_2:z:0dense2/Pow:z:0*
T0*
_output_shapes

:S
dense2/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?k
dense2/mul_3Muldense2/mul_3/x:output:0dense2/truediv_1:z:0*
T0*
_output_shapes

:v
dense2/ReadVariableOp_1ReadVariableOpdense2_readvariableop_resource*
_output_shapes

:*
dtype0]
dense2/Neg_2Negdense2/ReadVariableOp_1:value:0*
T0*
_output_shapes

:b
dense2/add_3AddV2dense2/Neg_2:y:0dense2/mul_3:z:0*
T0*
_output_shapes

:S
dense2/mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?g
dense2/mul_4Muldense2/mul_4/x:output:0dense2/add_3:z:0*
T0*
_output_shapes

:`
dense2/StopGradient_1StopGradientdense2/mul_4:z:0*
T0*
_output_shapes

:v
dense2/ReadVariableOp_2ReadVariableOpdense2_readvariableop_resource*
_output_shapes

:*
dtype0
dense2/add_4AddV2dense2/ReadVariableOp_2:value:0dense2/StopGradient_1:output:0*
T0*
_output_shapes

:x
dense2/MatMulMatMuldropout_2/dropout/Mul_1:z:0dense2/add_4:z:0*
T0*'
_output_shapes
:€€€€€€€€€O
outputs/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :O
outputs/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :c
outputs/PowPowoutputs/Pow/x:output:0outputs/Pow/y:output:0*
T0*
_output_shapes
: U
outputs/CastCastoutputs/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: Q
outputs/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :Q
outputs/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :i
outputs/Pow_1Powoutputs/Pow_1/x:output:0outputs/Pow_1/y:output:0*
T0*
_output_shapes
: Y
outputs/Cast_1Castoutputs/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: R
outputs/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @R
outputs/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :a
outputs/Cast_2Castoutputs/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: R
outputs/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  АA_
outputs/subSuboutputs/Cast_2:y:0outputs/sub/y:output:0*
T0*
_output_shapes
: ^
outputs/Pow_2Powoutputs/Const:output:0outputs/sub:z:0*
T0*
_output_shapes
: \
outputs/sub_1Suboutputs/Cast_1:y:0outputs/Pow_2:z:0*
T0*
_output_shapes
: |
outputs/LessEqual	LessEqualdense2/MatMul:product:0outputs/sub_1:z:0*
T0*'
_output_shapes
:€€€€€€€€€_
outputs/ReluReludense2/MatMul:product:0*
T0*'
_output_shapes
:€€€€€€€€€^
outputs/ones_like/ShapeShapedense2/MatMul:product:0*
T0*
_output_shapes
:\
outputs/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?П
outputs/ones_likeFill outputs/ones_like/Shape:output:0 outputs/ones_like/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€\
outputs/sub_2Suboutputs/Cast_1:y:0outputs/Pow_2:z:0*
T0*
_output_shapes
: s
outputs/mulMuloutputs/ones_like:output:0outputs/sub_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€Т
outputs/SelectV2SelectV2outputs/LessEqual:z:0outputs/Relu:activations:0outputs/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€q
outputs/mul_1Muldense2/MatMul:product:0outputs/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€s
outputs/truedivRealDivoutputs/mul_1:z:0outputs/Cast_1:y:0*
T0*'
_output_shapes
:€€€€€€€€€Y
outputs/NegNegoutputs/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€]
outputs/RoundRoundoutputs/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€j
outputs/addAddV2outputs/Neg:y:0outputs/Round:y:0*
T0*'
_output_shapes
:€€€€€€€€€g
outputs/StopGradientStopGradientoutputs/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€|
outputs/add_1AddV2outputs/truediv:z:0outputs/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€s
outputs/truediv_1RealDivoutputs/add_1:z:0outputs/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€X
outputs/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?m
outputs/truediv_2RealDivoutputs/truediv_2/x:output:0outputs/Cast:y:0*
T0*
_output_shapes
: T
outputs/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?f
outputs/sub_3Suboutputs/sub_3/x:output:0outputs/truediv_2:z:0*
T0*
_output_shapes
: Д
outputs/clip_by_value/MinimumMinimumoutputs/truediv_1:z:0outputs/sub_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€\
outputs/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    Ч
outputs/clip_by_valueMaximum!outputs/clip_by_value/Minimum:z:0 outputs/clip_by_value/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€u
outputs/mul_2Muloutputs/Cast_1:y:0outputs/clip_by_value:z:0*
T0*'
_output_shapes
:€€€€€€€€€a
outputs/Neg_1Negoutputs/SelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€n
outputs/add_2AddV2outputs/Neg_1:y:0outputs/mul_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€T
outputs/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?s
outputs/mul_3Muloutputs/mul_3/x:output:0outputs/add_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€k
outputs/StopGradient_1StopGradientoutputs/mul_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€Д
outputs/add_3AddV2outputs/SelectV2:output:0outputs/StopGradient_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€`
IdentityIdentityoutputs/add_3:z:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€»
NoOpNoOp^conv/ReadVariableOp^conv/ReadVariableOp_1^conv/ReadVariableOp_2^dense1/AssignAddVariableOp^dense1/BiasAdd/ReadVariableOp^dense1/MatMul/ReadVariableOp^dense1/ReadVariableOp^dense1/ReadVariableOp_1^dense1/ReadVariableOp_2^dense1/add_2/ReadVariableOp-^dense1/batch_normalization_1/AssignMovingAvg<^dense1/batch_normalization_1/AssignMovingAvg/ReadVariableOp/^dense1/batch_normalization_1/AssignMovingAvg_1>^dense1/batch_normalization_1/AssignMovingAvg_1/ReadVariableOp6^dense1/batch_normalization_1/batchnorm/ReadVariableOp:^dense1/batch_normalization_1/batchnorm/mul/ReadVariableOp^dense1/mul/ReadVariableOp^dense1/mul_1/ReadVariableOp^dense1/mul_3/ReadVariableOp^dense2/ReadVariableOp^dense2/ReadVariableOp_1^dense2/ReadVariableOp_2*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:€€€€€€€€€ь: : : : : : : : : 2*
conv/ReadVariableOpconv/ReadVariableOp2.
conv/ReadVariableOp_1conv/ReadVariableOp_12.
conv/ReadVariableOp_2conv/ReadVariableOp_228
dense1/AssignAddVariableOpdense1/AssignAddVariableOp2>
dense1/BiasAdd/ReadVariableOpdense1/BiasAdd/ReadVariableOp2<
dense1/MatMul/ReadVariableOpdense1/MatMul/ReadVariableOp2.
dense1/ReadVariableOpdense1/ReadVariableOp22
dense1/ReadVariableOp_1dense1/ReadVariableOp_122
dense1/ReadVariableOp_2dense1/ReadVariableOp_22:
dense1/add_2/ReadVariableOpdense1/add_2/ReadVariableOp2\
,dense1/batch_normalization_1/AssignMovingAvg,dense1/batch_normalization_1/AssignMovingAvg2z
;dense1/batch_normalization_1/AssignMovingAvg/ReadVariableOp;dense1/batch_normalization_1/AssignMovingAvg/ReadVariableOp2`
.dense1/batch_normalization_1/AssignMovingAvg_1.dense1/batch_normalization_1/AssignMovingAvg_12~
=dense1/batch_normalization_1/AssignMovingAvg_1/ReadVariableOp=dense1/batch_normalization_1/AssignMovingAvg_1/ReadVariableOp2n
5dense1/batch_normalization_1/batchnorm/ReadVariableOp5dense1/batch_normalization_1/batchnorm/ReadVariableOp2v
9dense1/batch_normalization_1/batchnorm/mul/ReadVariableOp9dense1/batch_normalization_1/batchnorm/mul/ReadVariableOp26
dense1/mul/ReadVariableOpdense1/mul/ReadVariableOp2:
dense1/mul_1/ReadVariableOpdense1/mul_1/ReadVariableOp2:
dense1/mul_3/ReadVariableOpdense1/mul_3/ReadVariableOp2.
dense2/ReadVariableOpdense2/ReadVariableOp22
dense2/ReadVariableOp_1dense2/ReadVariableOp_122
dense2/ReadVariableOp_2dense2/ReadVariableOp_2:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
№
c
E__inference_dropout_1_layer_call_and_return_conditional_losses_263842

inputs

identity_1O
IdentityIdentityinputs*
T0*(
_output_shapes
:€€€€€€€€€ь\

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:€€€€€€€€€ь"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:€€€€€€€€€ь:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
≥?
ё
__inference__traced_save_264531
file_prefix*
&savev2_conv_kernel_read_readvariableop,
(savev2_dense1_kernel_read_readvariableop*
&savev2_dense1_bias_read_readvariableop/
+savev2_dense1_iteration_read_readvariableop	,
(savev2_dense2_kernel_read_readvariableopA
=savev2_dense1_batch_normalization_1_gamma_read_readvariableop@
<savev2_dense1_batch_normalization_1_beta_read_readvariableopG
Csavev2_dense1_batch_normalization_1_moving_mean_read_readvariableopK
Gsavev2_dense1_batch_normalization_1_moving_variance_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop1
-savev2_adam_conv_kernel_m_read_readvariableop3
/savev2_adam_dense1_kernel_m_read_readvariableop1
-savev2_adam_dense1_bias_m_read_readvariableop3
/savev2_adam_dense2_kernel_m_read_readvariableopH
Dsavev2_adam_dense1_batch_normalization_1_gamma_m_read_readvariableopG
Csavev2_adam_dense1_batch_normalization_1_beta_m_read_readvariableop1
-savev2_adam_conv_kernel_v_read_readvariableop3
/savev2_adam_dense1_kernel_v_read_readvariableop1
-savev2_adam_dense1_bias_v_read_readvariableop3
/savev2_adam_dense2_kernel_v_read_readvariableopH
Dsavev2_adam_dense1_batch_normalization_1_gamma_v_read_readvariableopG
Csavev2_adam_dense1_batch_normalization_1_beta_v_read_readvariableop
savev2_const

identity_1ИҐMergeV2Checkpointsw
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
_temp/partБ
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
value	B : У
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: Ѕ
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*к
valueаBЁB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-1/_iteration/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPHІ
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*M
valueDBBB B B B B B B B B B B B B B B B B B B B B B B B B B B B B ќ
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0&savev2_conv_kernel_read_readvariableop(savev2_dense1_kernel_read_readvariableop&savev2_dense1_bias_read_readvariableop+savev2_dense1_iteration_read_readvariableop(savev2_dense2_kernel_read_readvariableop=savev2_dense1_batch_normalization_1_gamma_read_readvariableop<savev2_dense1_batch_normalization_1_beta_read_readvariableopCsavev2_dense1_batch_normalization_1_moving_mean_read_readvariableopGsavev2_dense1_batch_normalization_1_moving_variance_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop-savev2_adam_conv_kernel_m_read_readvariableop/savev2_adam_dense1_kernel_m_read_readvariableop-savev2_adam_dense1_bias_m_read_readvariableop/savev2_adam_dense2_kernel_m_read_readvariableopDsavev2_adam_dense1_batch_normalization_1_gamma_m_read_readvariableopCsavev2_adam_dense1_batch_normalization_1_beta_m_read_readvariableop-savev2_adam_conv_kernel_v_read_readvariableop/savev2_adam_dense1_kernel_v_read_readvariableop-savev2_adam_dense1_bias_v_read_readvariableop/savev2_adam_dense2_kernel_v_read_readvariableopDsavev2_adam_dense1_batch_normalization_1_gamma_v_read_readvariableopCsavev2_adam_dense1_batch_normalization_1_beta_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *+
dtypes!
2		Р
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:Л
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

identity_1Identity_1:output:0*а
_input_shapesќ
Ћ: ::	ь:: :::::: : : : : : : ::	ь::::::	ь::::: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:,(
&
_output_shapes
::%!

_output_shapes
:	ь: 

_output_shapes
::

_output_shapes
: :$ 

_output_shapes

:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 	

_output_shapes
::


_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :,(
&
_output_shapes
::%!

_output_shapes
:	ь: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
:: 

_output_shapes
::,(
&
_output_shapes
::%!

_output_shapes
:	ь: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
:: 

_output_shapes
::

_output_shapes
: 
„≤
«

E__inference_cicada-v2_layer_call_and_return_conditional_losses_263311

inputs6
conv_readvariableop_resource:8
%dense1_matmul_readvariableop_resource:	ь4
&dense1_biasadd_readvariableop_resource:L
>dense1_batch_normalization_1_batchnorm_readvariableop_resource:P
Bdense1_batch_normalization_1_batchnorm_mul_readvariableop_resource:N
@dense1_batch_normalization_1_batchnorm_readvariableop_1_resource:N
@dense1_batch_normalization_1_batchnorm_readvariableop_2_resource:-
#dense1_assignaddvariableop_resource:	 0
dense2_readvariableop_resource:
identityИҐconv/ReadVariableOpҐconv/ReadVariableOp_1Ґconv/ReadVariableOp_2Ґdense1/AssignAddVariableOpҐdense1/BiasAdd/ReadVariableOpҐdense1/MatMul/ReadVariableOpҐdense1/ReadVariableOpҐdense1/ReadVariableOp_1Ґdense1/add_2/ReadVariableOpҐ5dense1/batch_normalization_1/batchnorm/ReadVariableOpҐ7dense1/batch_normalization_1/batchnorm/ReadVariableOp_1Ґ7dense1/batch_normalization_1/batchnorm/ReadVariableOp_2Ґ9dense1/batch_normalization_1/batchnorm/mul/ReadVariableOpҐdense1/mul/ReadVariableOpҐdense1/mul_1/ReadVariableOpҐdense1/mul_3/ReadVariableOpҐdense1/sub/ReadVariableOpҐdense2/ReadVariableOpҐdense2/ReadVariableOp_1Ґdense2/ReadVariableOp_2C
reshape/ShapeShapeinputs*
T0*
_output_shapes
:e
reshape/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: g
reshape/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:g
reshape/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:щ
reshape/strided_sliceStridedSlicereshape/Shape:output:0$reshape/strided_slice/stack:output:0&reshape/strided_slice/stack_1:output:0&reshape/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskY
reshape/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :Y
reshape/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :Y
reshape/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :—
reshape/Reshape/shapePackreshape/strided_slice:output:0 reshape/Reshape/shape/1:output:0 reshape/Reshape/shape/2:output:0 reshape/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:|
reshape/ReshapeReshapeinputsreshape/Reshape/shape:output:0*
T0*/
_output_shapes
:€€€€€€€€€O

conv/Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @O

conv/Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  0AZ
conv/PowPowconv/Pow/x:output:0conv/Pow/y:output:0*
T0*
_output_shapes
: Q
conv/Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @Q
conv/Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@`

conv/Pow_1Powconv/Pow_1/x:output:0conv/Pow_1/y:output:0*
T0*
_output_shapes
: x
conv/ReadVariableOpReadVariableOpconv_readvariableop_resource*&
_output_shapes
:*
dtype0k
conv/mulMulconv/ReadVariableOp:value:0conv/Pow:z:0*
T0*&
_output_shapes
:f
conv/truedivRealDivconv/mul:z:0conv/Pow_1:z:0*
T0*&
_output_shapes
:R
conv/NegNegconv/truediv:z:0*
T0*&
_output_shapes
:V

conv/RoundRoundconv/truediv:z:0*
T0*&
_output_shapes
:`
conv/addAddV2conv/Neg:y:0conv/Round:y:0*
T0*&
_output_shapes
:`
conv/StopGradientStopGradientconv/add:z:0*
T0*&
_output_shapes
:r

conv/add_1AddV2conv/truediv:z:0conv/StopGradient:output:0*
T0*&
_output_shapes
:@

conv/Neg_1Negconv/Pow:z:0*
T0*
_output_shapes
: Q
conv/add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?[

conv/add_2AddV2conv/Neg_1:y:0conv/add_2/y:output:0*
T0*
_output_shapes
: Q
conv/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Y

conv/mul_1Mulconv/mul_1/x:output:0conv/add_2:z:0*
T0*
_output_shapes
: O

conv/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?S
conv/subSubconv/Pow:z:0conv/sub/y:output:0*
T0*
_output_shapes
: t
conv/clip_by_value/MinimumMinimumconv/add_1:z:0conv/sub:z:0*
T0*&
_output_shapes
:~
conv/clip_by_valueMaximumconv/clip_by_value/Minimum:z:0conv/mul_1:z:0*
T0*&
_output_shapes
:j

conv/mul_2Mulconv/Pow_1:z:0conv/clip_by_value:z:0*
T0*&
_output_shapes
:h
conv/truediv_1RealDivconv/mul_2:z:0conv/Pow:z:0*
T0*&
_output_shapes
:Q
conv/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?m

conv/mul_3Mulconv/mul_3/x:output:0conv/truediv_1:z:0*
T0*&
_output_shapes
:z
conv/ReadVariableOp_1ReadVariableOpconv_readvariableop_resource*&
_output_shapes
:*
dtype0a

conv/Neg_2Negconv/ReadVariableOp_1:value:0*
T0*&
_output_shapes
:d

conv/add_3AddV2conv/Neg_2:y:0conv/mul_3:z:0*
T0*&
_output_shapes
:Q
conv/mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?i

conv/mul_4Mulconv/mul_4/x:output:0conv/add_3:z:0*
T0*&
_output_shapes
:d
conv/StopGradient_1StopGradientconv/mul_4:z:0*
T0*&
_output_shapes
:z
conv/ReadVariableOp_2ReadVariableOpconv_readvariableop_resource*&
_output_shapes
:*
dtype0Б

conv/add_4AddV2conv/ReadVariableOp_2:value:0conv/StopGradient_1:output:0*
T0*&
_output_shapes
:І
conv/convolutionConv2Dreshape/Reshape:output:0conv/add_4:z:0*
T0*/
_output_shapes
:€€€€€€€€€	*
paddingVALID*
strides
M
relu0/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :M
relu0/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
]
	relu0/PowPowrelu0/Pow/x:output:0relu0/Pow/y:output:0*
T0*
_output_shapes
: Q

relu0/CastCastrelu0/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: O
relu0/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :O
relu0/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :c
relu0/Pow_1Powrelu0/Pow_1/x:output:0relu0/Pow_1/y:output:0*
T0*
_output_shapes
: U
relu0/Cast_1Castrelu0/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: P
relu0/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @P
relu0/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :]
relu0/Cast_2Castrelu0/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: P
relu0/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   AY
	relu0/subSubrelu0/Cast_2:y:0relu0/sub/y:output:0*
T0*
_output_shapes
: X
relu0/Pow_2Powrelu0/Const:output:0relu0/sub:z:0*
T0*
_output_shapes
: V
relu0/sub_1Subrelu0/Cast_1:y:0relu0/Pow_2:z:0*
T0*
_output_shapes
: В
relu0/LessEqual	LessEqualconv/convolution:output:0relu0/sub_1:z:0*
T0*/
_output_shapes
:€€€€€€€€€	g

relu0/ReluReluconv/convolution:output:0*
T0*/
_output_shapes
:€€€€€€€€€	^
relu0/ones_like/ShapeShapeconv/convolution:output:0*
T0*
_output_shapes
:Z
relu0/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?С
relu0/ones_likeFillrelu0/ones_like/Shape:output:0relu0/ones_like/Const:output:0*
T0*/
_output_shapes
:€€€€€€€€€	V
relu0/sub_2Subrelu0/Cast_1:y:0relu0/Pow_2:z:0*
T0*
_output_shapes
: u
	relu0/mulMulrelu0/ones_like:output:0relu0/sub_2:z:0*
T0*/
_output_shapes
:€€€€€€€€€	Т
relu0/SelectV2SelectV2relu0/LessEqual:z:0relu0/Relu:activations:0relu0/mul:z:0*
T0*/
_output_shapes
:€€€€€€€€€	w
relu0/mul_1Mulconv/convolution:output:0relu0/Cast:y:0*
T0*/
_output_shapes
:€€€€€€€€€	u
relu0/truedivRealDivrelu0/mul_1:z:0relu0/Cast_1:y:0*
T0*/
_output_shapes
:€€€€€€€€€	]
	relu0/NegNegrelu0/truediv:z:0*
T0*/
_output_shapes
:€€€€€€€€€	a
relu0/RoundRoundrelu0/truediv:z:0*
T0*/
_output_shapes
:€€€€€€€€€	l
	relu0/addAddV2relu0/Neg:y:0relu0/Round:y:0*
T0*/
_output_shapes
:€€€€€€€€€	k
relu0/StopGradientStopGradientrelu0/add:z:0*
T0*/
_output_shapes
:€€€€€€€€€	~
relu0/add_1AddV2relu0/truediv:z:0relu0/StopGradient:output:0*
T0*/
_output_shapes
:€€€€€€€€€	u
relu0/truediv_1RealDivrelu0/add_1:z:0relu0/Cast:y:0*
T0*/
_output_shapes
:€€€€€€€€€	V
relu0/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?g
relu0/truediv_2RealDivrelu0/truediv_2/x:output:0relu0/Cast:y:0*
T0*
_output_shapes
: R
relu0/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?`
relu0/sub_3Subrelu0/sub_3/x:output:0relu0/truediv_2:z:0*
T0*
_output_shapes
: Ж
relu0/clip_by_value/MinimumMinimumrelu0/truediv_1:z:0relu0/sub_3:z:0*
T0*/
_output_shapes
:€€€€€€€€€	Z
relu0/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    Щ
relu0/clip_by_valueMaximumrelu0/clip_by_value/Minimum:z:0relu0/clip_by_value/y:output:0*
T0*/
_output_shapes
:€€€€€€€€€	w
relu0/mul_2Mulrelu0/Cast_1:y:0relu0/clip_by_value:z:0*
T0*/
_output_shapes
:€€€€€€€€€	e
relu0/Neg_1Negrelu0/SelectV2:output:0*
T0*/
_output_shapes
:€€€€€€€€€	p
relu0/add_2AddV2relu0/Neg_1:y:0relu0/mul_2:z:0*
T0*/
_output_shapes
:€€€€€€€€€	R
relu0/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?u
relu0/mul_3Mulrelu0/mul_3/x:output:0relu0/add_2:z:0*
T0*/
_output_shapes
:€€€€€€€€€	o
relu0/StopGradient_1StopGradientrelu0/mul_3:z:0*
T0*/
_output_shapes
:€€€€€€€€€	Ж
relu0/add_3AddV2relu0/SelectV2:output:0relu0/StopGradient_1:output:0*
T0*/
_output_shapes
:€€€€€€€€€	^
flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€ь   v
flatten/ReshapeReshaperelu0/add_3:z:0flatten/Const:output:0*
T0*(
_output_shapes
:€€€€€€€€€ьk
dropout_1/IdentityIdentityflatten/Reshape:output:0*
T0*(
_output_shapes
:€€€€€€€€€ьO
dense1/Cast/xConst*
_output_shapes
: *
dtype0
*
value	B
 Z Г
dense1/MatMul/ReadVariableOpReadVariableOp%dense1_matmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0М
dense1/MatMulMatMuldropout_1/Identity:output:0$dense1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€А
dense1/BiasAdd/ReadVariableOpReadVariableOp&dense1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0Л
dense1/BiasAddBiasAdddense1/MatMul:product:0%dense1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€∞
5dense1/batch_normalization_1/batchnorm/ReadVariableOpReadVariableOp>dense1_batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0q
,dense1/batch_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:ќ
*dense1/batch_normalization_1/batchnorm/addAddV2=dense1/batch_normalization_1/batchnorm/ReadVariableOp:value:05dense1/batch_normalization_1/batchnorm/add/y:output:0*
T0*
_output_shapes
:К
,dense1/batch_normalization_1/batchnorm/RsqrtRsqrt.dense1/batch_normalization_1/batchnorm/add:z:0*
T0*
_output_shapes
:Є
9dense1/batch_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOpBdense1_batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0Ћ
*dense1/batch_normalization_1/batchnorm/mulMul0dense1/batch_normalization_1/batchnorm/Rsqrt:y:0Adense1/batch_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:Ѓ
,dense1/batch_normalization_1/batchnorm/mul_1Muldense1/BiasAdd:output:0.dense1/batch_normalization_1/batchnorm/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€і
7dense1/batch_normalization_1/batchnorm/ReadVariableOp_1ReadVariableOp@dense1_batch_normalization_1_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0…
,dense1/batch_normalization_1/batchnorm/mul_2Mul?dense1/batch_normalization_1/batchnorm/ReadVariableOp_1:value:0.dense1/batch_normalization_1/batchnorm/mul:z:0*
T0*
_output_shapes
:і
7dense1/batch_normalization_1/batchnorm/ReadVariableOp_2ReadVariableOp@dense1_batch_normalization_1_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0…
*dense1/batch_normalization_1/batchnorm/subSub?dense1/batch_normalization_1/batchnorm/ReadVariableOp_2:value:00dense1/batch_normalization_1/batchnorm/mul_2:z:0*
T0*
_output_shapes
:…
,dense1/batch_normalization_1/batchnorm/add_1AddV20dense1/batch_normalization_1/batchnorm/mul_1:z:0.dense1/batch_normalization_1/batchnorm/sub:z:0*
T0*'
_output_shapes
:€€€€€€€€€N
dense1/ConstConst*
_output_shapes
: *
dtype0	*
value	B	 R Р
dense1/AssignAddVariableOpAssignAddVariableOp#dense1_assignaddvariableop_resourcedense1/Const:output:0*
_output_shapes
 *
dtype0	o
%dense1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: Ю
dense1/moments/meanMeandense1/BiasAdd:output:0.dense1/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims(r
dense1/moments/StopGradientStopGradientdense1/moments/mean:output:0*
T0*
_output_shapes

:¶
 dense1/moments/SquaredDifferenceSquaredDifferencedense1/BiasAdd:output:0$dense1/moments/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€s
)dense1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: ≥
dense1/moments/varianceMean$dense1/moments/SquaredDifference:z:02dense1/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:*
	keep_dims({
dense1/moments/SqueezeSqueezedense1/moments/mean:output:0*
T0*
_output_shapes
:*
squeeze_dims
 Б
dense1/moments/Squeeze_1Squeeze dense1/moments/variance:output:0*
T0*
_output_shapes
:*
squeeze_dims
 Р
dense1/ReadVariableOpReadVariableOp>dense1_batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0Q
dense1/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:n

dense1/addAddV2dense1/ReadVariableOp:value:0dense1/add/y:output:0*
T0*
_output_shapes
:J
dense1/RsqrtRsqrtdense1/add:z:0*
T0*
_output_shapes
:S
dense1/add_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *oГ:v
dense1/add_1AddV2!dense1/moments/Squeeze_1:output:0dense1/add_1/y:output:0*
T0*
_output_shapes
:N
dense1/Rsqrt_1Rsqrtdense1/add_1:z:0*
T0*
_output_shapes
:Ш
dense1/mul/ReadVariableOpReadVariableOpBdense1_batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0k

dense1/mulMuldense1/Rsqrt:y:0!dense1/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:Ъ
dense1/mul_1/ReadVariableOpReadVariableOpBdense1_batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0q
dense1/mul_1Muldense1/Rsqrt_1:y:0#dense1/mul_1/ReadVariableOp:value:0*
T0*
_output_shapes
:z
dense1/ReadVariableOp_1ReadVariableOp&dense1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0Ц
dense1/sub/ReadVariableOpReadVariableOp@dense1_batch_normalization_1_batchnorm_readvariableop_1_resource*
_output_shapes
:*
dtype0z

dense1/subSubdense1/ReadVariableOp_1:value:0!dense1/sub/ReadVariableOp:value:0*
T0*
_output_shapes
:X
dense1/mul_2Muldense1/mul:z:0dense1/sub:z:0*
T0*
_output_shapes
:Ш
dense1/add_2/ReadVariableOpReadVariableOp@dense1_batch_normalization_1_batchnorm_readvariableop_2_resource*
_output_shapes
:*
dtype0q
dense1/add_2AddV2dense1/mul_2:z:0#dense1/add_2/ReadVariableOp:value:0*
T0*
_output_shapes
:В
dense1/mul_3/ReadVariableOpReadVariableOp%dense1_matmul_readvariableop_resource*
_output_shapes
:	ь*
dtype0r
dense1/mul_3Muldense1/mul:z:0#dense1/mul_3/ReadVariableOp:value:0*
T0*
_output_shapes
:	ьQ
dense1/Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @Q
dense1/Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  а@`

dense1/PowPowdense1/Pow/x:output:0dense1/Pow/y:output:0*
T0*
_output_shapes
: S
dense1/Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @S
dense1/Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?f
dense1/Pow_1Powdense1/Pow_1/x:output:0dense1/Pow_1/y:output:0*
T0*
_output_shapes
: _
dense1/mul_4Muldense1/mul_3:z:0dense1/Pow:z:0*
T0*
_output_shapes
:	ьg
dense1/truedivRealDivdense1/mul_4:z:0dense1/Pow_1:z:0*
T0*
_output_shapes
:	ьO

dense1/NegNegdense1/truediv:z:0*
T0*
_output_shapes
:	ьS
dense1/RoundRounddense1/truediv:z:0*
T0*
_output_shapes
:	ьa
dense1/add_3AddV2dense1/Neg:y:0dense1/Round:y:0*
T0*
_output_shapes
:	ь_
dense1/StopGradientStopGradientdense1/add_3:z:0*
T0*
_output_shapes
:	ьq
dense1/add_4AddV2dense1/truediv:z:0dense1/StopGradient:output:0*
T0*
_output_shapes
:	ьD
dense1/Neg_1Negdense1/Pow:z:0*
T0*
_output_shapes
: S
dense1/add_5/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?a
dense1/add_5AddV2dense1/Neg_1:y:0dense1/add_5/y:output:0*
T0*
_output_shapes
: S
dense1/mul_5/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?_
dense1/mul_5Muldense1/mul_5/x:output:0dense1/add_5:z:0*
T0*
_output_shapes
: S
dense1/sub_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?]
dense1/sub_1Subdense1/Pow:z:0dense1/sub_1/y:output:0*
T0*
_output_shapes
: u
dense1/clip_by_value/MinimumMinimumdense1/add_4:z:0dense1/sub_1:z:0*
T0*
_output_shapes
:	ь}
dense1/clip_by_valueMaximum dense1/clip_by_value/Minimum:z:0dense1/mul_5:z:0*
T0*
_output_shapes
:	ьi
dense1/mul_6Muldense1/Pow_1:z:0dense1/clip_by_value:z:0*
T0*
_output_shapes
:	ьg
dense1/truediv_1RealDivdense1/mul_6:z:0dense1/Pow:z:0*
T0*
_output_shapes
:	ьS
dense1/mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?l
dense1/mul_7Muldense1/mul_7/x:output:0dense1/truediv_1:z:0*
T0*
_output_shapes
:	ьO
dense1/Neg_2Negdense1/mul_3:z:0*
T0*
_output_shapes
:	ьc
dense1/add_6AddV2dense1/Neg_2:y:0dense1/mul_7:z:0*
T0*
_output_shapes
:	ьS
dense1/mul_8/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?h
dense1/mul_8Muldense1/mul_8/x:output:0dense1/add_6:z:0*
T0*
_output_shapes
:	ьa
dense1/StopGradient_1StopGradientdense1/mul_8:z:0*
T0*
_output_shapes
:	ьq
dense1/add_7AddV2dense1/mul_3:z:0dense1/StopGradient_1:output:0*
T0*
_output_shapes
:	ьS
dense1/Pow_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @S
dense1/Pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  а@f
dense1/Pow_2Powdense1/Pow_2/x:output:0dense1/Pow_2/y:output:0*
T0*
_output_shapes
: S
dense1/Pow_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @S
dense1/Pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@f
dense1/Pow_3Powdense1/Pow_3/x:output:0dense1/Pow_3/y:output:0*
T0*
_output_shapes
: \
dense1/mul_9Muldense1/add_2:z:0dense1/Pow_2:z:0*
T0*
_output_shapes
:d
dense1/truediv_2RealDivdense1/mul_9:z:0dense1/Pow_3:z:0*
T0*
_output_shapes
:N
dense1/Neg_3Negdense1/truediv_2:z:0*
T0*
_output_shapes
:R
dense1/Round_1Rounddense1/truediv_2:z:0*
T0*
_output_shapes
:`
dense1/add_8AddV2dense1/Neg_3:y:0dense1/Round_1:y:0*
T0*
_output_shapes
:\
dense1/StopGradient_2StopGradientdense1/add_8:z:0*
T0*
_output_shapes
:p
dense1/add_9AddV2dense1/truediv_2:z:0dense1/StopGradient_2:output:0*
T0*
_output_shapes
:F
dense1/Neg_4Negdense1/Pow_2:z:0*
T0*
_output_shapes
: T
dense1/add_10/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?c
dense1/add_10AddV2dense1/Neg_4:y:0dense1/add_10/y:output:0*
T0*
_output_shapes
: T
dense1/mul_10/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?b
dense1/mul_10Muldense1/mul_10/x:output:0dense1/add_10:z:0*
T0*
_output_shapes
: S
dense1/sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?_
dense1/sub_2Subdense1/Pow_2:z:0dense1/sub_2/y:output:0*
T0*
_output_shapes
: r
dense1/clip_by_value_1/MinimumMinimumdense1/add_9:z:0dense1/sub_2:z:0*
T0*
_output_shapes
:}
dense1/clip_by_value_1Maximum"dense1/clip_by_value_1/Minimum:z:0dense1/mul_10:z:0*
T0*
_output_shapes
:g
dense1/mul_11Muldense1/Pow_3:z:0dense1/clip_by_value_1:z:0*
T0*
_output_shapes
:e
dense1/truediv_3RealDivdense1/mul_11:z:0dense1/Pow_2:z:0*
T0*
_output_shapes
:T
dense1/mul_12/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?i
dense1/mul_12Muldense1/mul_12/x:output:0dense1/truediv_3:z:0*
T0*
_output_shapes
:J
dense1/Neg_5Negdense1/add_2:z:0*
T0*
_output_shapes
:`
dense1/add_11AddV2dense1/Neg_5:y:0dense1/mul_12:z:0*
T0*
_output_shapes
:T
dense1/mul_13/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?f
dense1/mul_13Muldense1/mul_13/x:output:0dense1/add_11:z:0*
T0*
_output_shapes
:]
dense1/StopGradient_3StopGradientdense1/mul_13:z:0*
T0*
_output_shapes
:m
dense1/add_12AddV2dense1/add_2:z:0dense1/StopGradient_3:output:0*
T0*
_output_shapes
:z
dense1/MatMul_1MatMuldropout_1/Identity:output:0dense1/add_7:z:0*
T0*'
_output_shapes
:€€€€€€€€€{
dense1/BiasAdd_1BiasAdddense1/MatMul_1:product:0dense1/add_12:z:0*
T0*'
_output_shapes
:€€€€€€€€€M
relu1/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :M
relu1/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
]
	relu1/PowPowrelu1/Pow/x:output:0relu1/Pow/y:output:0*
T0*
_output_shapes
: Q

relu1/CastCastrelu1/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: O
relu1/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :O
relu1/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :c
relu1/Pow_1Powrelu1/Pow_1/x:output:0relu1/Pow_1/y:output:0*
T0*
_output_shapes
: U
relu1/Cast_1Castrelu1/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: P
relu1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @P
relu1/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :]
relu1/Cast_2Castrelu1/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: P
relu1/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   AY
	relu1/subSubrelu1/Cast_2:y:0relu1/sub/y:output:0*
T0*
_output_shapes
: X
relu1/Pow_2Powrelu1/Const:output:0relu1/sub:z:0*
T0*
_output_shapes
: V
relu1/sub_1Subrelu1/Cast_1:y:0relu1/Pow_2:z:0*
T0*
_output_shapes
: z
relu1/LessEqual	LessEqualdense1/BiasAdd_1:output:0relu1/sub_1:z:0*
T0*'
_output_shapes
:€€€€€€€€€_

relu1/ReluReludense1/BiasAdd_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€^
relu1/ones_like/ShapeShapedense1/BiasAdd_1:output:0*
T0*
_output_shapes
:Z
relu1/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Й
relu1/ones_likeFillrelu1/ones_like/Shape:output:0relu1/ones_like/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€V
relu1/sub_2Subrelu1/Cast_1:y:0relu1/Pow_2:z:0*
T0*
_output_shapes
: m
	relu1/mulMulrelu1/ones_like:output:0relu1/sub_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€К
relu1/SelectV2SelectV2relu1/LessEqual:z:0relu1/Relu:activations:0relu1/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€o
relu1/mul_1Muldense1/BiasAdd_1:output:0relu1/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€m
relu1/truedivRealDivrelu1/mul_1:z:0relu1/Cast_1:y:0*
T0*'
_output_shapes
:€€€€€€€€€U
	relu1/NegNegrelu1/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€Y
relu1/RoundRoundrelu1/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€d
	relu1/addAddV2relu1/Neg:y:0relu1/Round:y:0*
T0*'
_output_shapes
:€€€€€€€€€c
relu1/StopGradientStopGradientrelu1/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€v
relu1/add_1AddV2relu1/truediv:z:0relu1/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€m
relu1/truediv_1RealDivrelu1/add_1:z:0relu1/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€V
relu1/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?g
relu1/truediv_2RealDivrelu1/truediv_2/x:output:0relu1/Cast:y:0*
T0*
_output_shapes
: R
relu1/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?`
relu1/sub_3Subrelu1/sub_3/x:output:0relu1/truediv_2:z:0*
T0*
_output_shapes
: ~
relu1/clip_by_value/MinimumMinimumrelu1/truediv_1:z:0relu1/sub_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€Z
relu1/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    С
relu1/clip_by_valueMaximumrelu1/clip_by_value/Minimum:z:0relu1/clip_by_value/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€o
relu1/mul_2Mulrelu1/Cast_1:y:0relu1/clip_by_value:z:0*
T0*'
_output_shapes
:€€€€€€€€€]
relu1/Neg_1Negrelu1/SelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€h
relu1/add_2AddV2relu1/Neg_1:y:0relu1/mul_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€R
relu1/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?m
relu1/mul_3Mulrelu1/mul_3/x:output:0relu1/add_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€g
relu1/StopGradient_1StopGradientrelu1/mul_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€~
relu1/add_3AddV2relu1/SelectV2:output:0relu1/StopGradient_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€a
dropout_2/IdentityIdentityrelu1/add_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€Q
dense2/Pow/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @Q
dense2/Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  0A`

dense2/PowPowdense2/Pow/x:output:0dense2/Pow/y:output:0*
T0*
_output_shapes
: S
dense2/Pow_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @S
dense2/Pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@f
dense2/Pow_1Powdense2/Pow_1/x:output:0dense2/Pow_1/y:output:0*
T0*
_output_shapes
: t
dense2/ReadVariableOpReadVariableOpdense2_readvariableop_resource*
_output_shapes

:*
dtype0i

dense2/mulMuldense2/ReadVariableOp:value:0dense2/Pow:z:0*
T0*
_output_shapes

:d
dense2/truedivRealDivdense2/mul:z:0dense2/Pow_1:z:0*
T0*
_output_shapes

:N

dense2/NegNegdense2/truediv:z:0*
T0*
_output_shapes

:R
dense2/RoundRounddense2/truediv:z:0*
T0*
_output_shapes

:^

dense2/addAddV2dense2/Neg:y:0dense2/Round:y:0*
T0*
_output_shapes

:\
dense2/StopGradientStopGradientdense2/add:z:0*
T0*
_output_shapes

:p
dense2/add_1AddV2dense2/truediv:z:0dense2/StopGradient:output:0*
T0*
_output_shapes

:D
dense2/Neg_1Negdense2/Pow:z:0*
T0*
_output_shapes
: S
dense2/add_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?a
dense2/add_2AddV2dense2/Neg_1:y:0dense2/add_2/y:output:0*
T0*
_output_shapes
: S
dense2/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?_
dense2/mul_1Muldense2/mul_1/x:output:0dense2/add_2:z:0*
T0*
_output_shapes
: Q
dense2/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Y

dense2/subSubdense2/Pow:z:0dense2/sub/y:output:0*
T0*
_output_shapes
: r
dense2/clip_by_value/MinimumMinimumdense2/add_1:z:0dense2/sub:z:0*
T0*
_output_shapes

:|
dense2/clip_by_valueMaximum dense2/clip_by_value/Minimum:z:0dense2/mul_1:z:0*
T0*
_output_shapes

:h
dense2/mul_2Muldense2/Pow_1:z:0dense2/clip_by_value:z:0*
T0*
_output_shapes

:f
dense2/truediv_1RealDivdense2/mul_2:z:0dense2/Pow:z:0*
T0*
_output_shapes

:S
dense2/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?k
dense2/mul_3Muldense2/mul_3/x:output:0dense2/truediv_1:z:0*
T0*
_output_shapes

:v
dense2/ReadVariableOp_1ReadVariableOpdense2_readvariableop_resource*
_output_shapes

:*
dtype0]
dense2/Neg_2Negdense2/ReadVariableOp_1:value:0*
T0*
_output_shapes

:b
dense2/add_3AddV2dense2/Neg_2:y:0dense2/mul_3:z:0*
T0*
_output_shapes

:S
dense2/mul_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?g
dense2/mul_4Muldense2/mul_4/x:output:0dense2/add_3:z:0*
T0*
_output_shapes

:`
dense2/StopGradient_1StopGradientdense2/mul_4:z:0*
T0*
_output_shapes

:v
dense2/ReadVariableOp_2ReadVariableOpdense2_readvariableop_resource*
_output_shapes

:*
dtype0
dense2/add_4AddV2dense2/ReadVariableOp_2:value:0dense2/StopGradient_1:output:0*
T0*
_output_shapes

:x
dense2/MatMulMatMuldropout_2/Identity:output:0dense2/add_4:z:0*
T0*'
_output_shapes
:€€€€€€€€€O
outputs/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :O
outputs/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :c
outputs/PowPowoutputs/Pow/x:output:0outputs/Pow/y:output:0*
T0*
_output_shapes
: U
outputs/CastCastoutputs/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: Q
outputs/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :Q
outputs/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :i
outputs/Pow_1Powoutputs/Pow_1/x:output:0outputs/Pow_1/y:output:0*
T0*
_output_shapes
: Y
outputs/Cast_1Castoutputs/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: R
outputs/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @R
outputs/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :a
outputs/Cast_2Castoutputs/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: R
outputs/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  АA_
outputs/subSuboutputs/Cast_2:y:0outputs/sub/y:output:0*
T0*
_output_shapes
: ^
outputs/Pow_2Powoutputs/Const:output:0outputs/sub:z:0*
T0*
_output_shapes
: \
outputs/sub_1Suboutputs/Cast_1:y:0outputs/Pow_2:z:0*
T0*
_output_shapes
: |
outputs/LessEqual	LessEqualdense2/MatMul:product:0outputs/sub_1:z:0*
T0*'
_output_shapes
:€€€€€€€€€_
outputs/ReluReludense2/MatMul:product:0*
T0*'
_output_shapes
:€€€€€€€€€^
outputs/ones_like/ShapeShapedense2/MatMul:product:0*
T0*
_output_shapes
:\
outputs/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  А?П
outputs/ones_likeFill outputs/ones_like/Shape:output:0 outputs/ones_like/Const:output:0*
T0*'
_output_shapes
:€€€€€€€€€\
outputs/sub_2Suboutputs/Cast_1:y:0outputs/Pow_2:z:0*
T0*
_output_shapes
: s
outputs/mulMuloutputs/ones_like:output:0outputs/sub_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€Т
outputs/SelectV2SelectV2outputs/LessEqual:z:0outputs/Relu:activations:0outputs/mul:z:0*
T0*'
_output_shapes
:€€€€€€€€€q
outputs/mul_1Muldense2/MatMul:product:0outputs/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€s
outputs/truedivRealDivoutputs/mul_1:z:0outputs/Cast_1:y:0*
T0*'
_output_shapes
:€€€€€€€€€Y
outputs/NegNegoutputs/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€]
outputs/RoundRoundoutputs/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€j
outputs/addAddV2outputs/Neg:y:0outputs/Round:y:0*
T0*'
_output_shapes
:€€€€€€€€€g
outputs/StopGradientStopGradientoutputs/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€|
outputs/add_1AddV2outputs/truediv:z:0outputs/StopGradient:output:0*
T0*'
_output_shapes
:€€€€€€€€€s
outputs/truediv_1RealDivoutputs/add_1:z:0outputs/Cast:y:0*
T0*'
_output_shapes
:€€€€€€€€€X
outputs/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?m
outputs/truediv_2RealDivoutputs/truediv_2/x:output:0outputs/Cast:y:0*
T0*
_output_shapes
: T
outputs/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?f
outputs/sub_3Suboutputs/sub_3/x:output:0outputs/truediv_2:z:0*
T0*
_output_shapes
: Д
outputs/clip_by_value/MinimumMinimumoutputs/truediv_1:z:0outputs/sub_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€\
outputs/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    Ч
outputs/clip_by_valueMaximum!outputs/clip_by_value/Minimum:z:0 outputs/clip_by_value/y:output:0*
T0*'
_output_shapes
:€€€€€€€€€u
outputs/mul_2Muloutputs/Cast_1:y:0outputs/clip_by_value:z:0*
T0*'
_output_shapes
:€€€€€€€€€a
outputs/Neg_1Negoutputs/SelectV2:output:0*
T0*'
_output_shapes
:€€€€€€€€€n
outputs/add_2AddV2outputs/Neg_1:y:0outputs/mul_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€T
outputs/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?s
outputs/mul_3Muloutputs/mul_3/x:output:0outputs/add_2:z:0*
T0*'
_output_shapes
:€€€€€€€€€k
outputs/StopGradient_1StopGradientoutputs/mul_3:z:0*
T0*'
_output_shapes
:€€€€€€€€€Д
outputs/add_3AddV2outputs/SelectV2:output:0outputs/StopGradient_1:output:0*
T0*'
_output_shapes
:€€€€€€€€€`
IdentityIdentityoutputs/add_3:z:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€а
NoOpNoOp^conv/ReadVariableOp^conv/ReadVariableOp_1^conv/ReadVariableOp_2^dense1/AssignAddVariableOp^dense1/BiasAdd/ReadVariableOp^dense1/MatMul/ReadVariableOp^dense1/ReadVariableOp^dense1/ReadVariableOp_1^dense1/add_2/ReadVariableOp6^dense1/batch_normalization_1/batchnorm/ReadVariableOp8^dense1/batch_normalization_1/batchnorm/ReadVariableOp_18^dense1/batch_normalization_1/batchnorm/ReadVariableOp_2:^dense1/batch_normalization_1/batchnorm/mul/ReadVariableOp^dense1/mul/ReadVariableOp^dense1/mul_1/ReadVariableOp^dense1/mul_3/ReadVariableOp^dense1/sub/ReadVariableOp^dense2/ReadVariableOp^dense2/ReadVariableOp_1^dense2/ReadVariableOp_2*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:€€€€€€€€€ь: : : : : : : : : 2*
conv/ReadVariableOpconv/ReadVariableOp2.
conv/ReadVariableOp_1conv/ReadVariableOp_12.
conv/ReadVariableOp_2conv/ReadVariableOp_228
dense1/AssignAddVariableOpdense1/AssignAddVariableOp2>
dense1/BiasAdd/ReadVariableOpdense1/BiasAdd/ReadVariableOp2<
dense1/MatMul/ReadVariableOpdense1/MatMul/ReadVariableOp2.
dense1/ReadVariableOpdense1/ReadVariableOp22
dense1/ReadVariableOp_1dense1/ReadVariableOp_12:
dense1/add_2/ReadVariableOpdense1/add_2/ReadVariableOp2n
5dense1/batch_normalization_1/batchnorm/ReadVariableOp5dense1/batch_normalization_1/batchnorm/ReadVariableOp2r
7dense1/batch_normalization_1/batchnorm/ReadVariableOp_17dense1/batch_normalization_1/batchnorm/ReadVariableOp_12r
7dense1/batch_normalization_1/batchnorm/ReadVariableOp_27dense1/batch_normalization_1/batchnorm/ReadVariableOp_22v
9dense1/batch_normalization_1/batchnorm/mul/ReadVariableOp9dense1/batch_normalization_1/batchnorm/mul/ReadVariableOp26
dense1/mul/ReadVariableOpdense1/mul/ReadVariableOp2:
dense1/mul_1/ReadVariableOpdense1/mul_1/ReadVariableOp2:
dense1/mul_3/ReadVariableOpdense1/mul_3/ReadVariableOp26
dense1/sub/ReadVariableOpdense1/sub/ReadVariableOp2.
dense2/ReadVariableOpdense2/ReadVariableOp22
dense2/ReadVariableOp_1dense2/ReadVariableOp_122
dense2/ReadVariableOp_2dense2/ReadVariableOp_2:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs
Ф(
°
E__inference_cicada-v2_layer_call_and_return_conditional_losses_262781

inputs%
conv_262753: 
dense1_262759:	ь
dense1_262761:
dense1_262763:
dense1_262765:
dense1_262767:
dense1_262769:
dense1_262771:	 
dense2_262776:
identityИҐconv/StatefulPartitionedCallҐdense1/StatefulPartitionedCallҐdense2/StatefulPartitionedCallҐ!dropout_1/StatefulPartitionedCallҐ!dropout_2/StatefulPartitionedCallЊ
reshape/PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_reshape_layer_call_and_return_conditional_losses_262019у
conv/StatefulPartitionedCallStatefulPartitionedCall reshape/PartitionedCall:output:0conv_262753*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€	*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *I
fDRB
@__inference_conv_layer_call_and_return_conditional_losses_262062ў
relu0/PartitionedCallPartitionedCall%conv/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€	* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_relu0_layer_call_and_return_conditional_losses_262115ѕ
flatten/PartitionedCallPartitionedCallrelu0/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€ь* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_flatten_layer_call_and_return_conditional_losses_262123е
!dropout_1/StatefulPartitionedCallStatefulPartitionedCall flatten/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€ь* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_dropout_1_layer_call_and_return_conditional_losses_262695ё
dense1/StatefulPartitionedCallStatefulPartitionedCall*dropout_1/StatefulPartitionedCall:output:0dense1_262759dense1_262761dense1_262763dense1_262765dense1_262767dense1_262769dense1_262771*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense1_layer_call_and_return_conditional_losses_262658”
relu1/PartitionedCallPartitionedCall'dense1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_relu1_layer_call_and_return_conditional_losses_262319Ж
!dropout_2/StatefulPartitionedCallStatefulPartitionedCallrelu1/PartitionedCall:output:0"^dropout_1/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_dropout_2_layer_call_and_return_conditional_losses_262480ы
dense2/StatefulPartitionedCallStatefulPartitionedCall*dropout_2/StatefulPartitionedCall:output:0dense2_262776*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense2_layer_call_and_return_conditional_losses_262369„
outputs/PartitionedCallPartitionedCall'dense2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_outputs_layer_call_and_return_conditional_losses_262422o
IdentityIdentity outputs/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€п
NoOpNoOp^conv/StatefulPartitionedCall^dense1/StatefulPartitionedCall^dense2/StatefulPartitionedCall"^dropout_1/StatefulPartitionedCall"^dropout_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:€€€€€€€€€ь: : : : : : : : : 2<
conv/StatefulPartitionedCallconv/StatefulPartitionedCall2@
dense1/StatefulPartitionedCalldense1/StatefulPartitionedCall2@
dense2/StatefulPartitionedCalldense2/StatefulPartitionedCall2F
!dropout_1/StatefulPartitionedCall!dropout_1/StatefulPartitionedCall2F
!dropout_2/StatefulPartitionedCall!dropout_2/StatefulPartitionedCall:P L
(
_output_shapes
:€€€€€€€€€ь
 
_user_specified_nameinputs"µ	L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*Ђ
serving_defaultЧ
<
inputs_1
serving_default_inputs_:0€€€€€€€€€ь;
outputs0
StatefulPartitionedCall:0€€€€€€€€€tensorflow/serving/predict:сЩ
Ѕ
layer-0
layer-1
layer_with_weights-0
layer-2
layer-3
layer-4
layer-5
layer_with_weights-1
layer-6
layer-7
	layer-8

layer_with_weights-2

layer-9
layer-10
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures"
_tf_keras_network
"
_tf_keras_input_layer
•
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses"
_tf_keras_layer
Ш
	variables
trainable_variables
regularization_losses
	keras_api
__call__
* &call_and_return_all_conditional_losses
!kernel_quantizer
!kernel_quantizer_internal
"
quantizers

#kernel
 $_jit_compiled_convolution_op"
_tf_keras_layer
і
%	variables
&trainable_variables
'regularization_losses
(	keras_api
)__call__
**&call_and_return_all_conditional_losses
+	quantizer"
_tf_keras_layer
•
,	variables
-trainable_variables
.regularization_losses
/	keras_api
0__call__
*1&call_and_return_all_conditional_losses"
_tf_keras_layer
Љ
2	variables
3trainable_variables
4regularization_losses
5	keras_api
6__call__
*7&call_and_return_all_conditional_losses
8_random_generator"
_tf_keras_layer
–
9	variables
:trainable_variables
;regularization_losses
<	keras_api
=__call__
*>&call_and_return_all_conditional_losses
?kernel_quantizer
@bias_quantizer
?kernel_quantizer_internal
@bias_quantizer_internal
A
quantizers
B	batchnorm

Ckernel
Dbias
E
_iteration"
_tf_keras_layer
і
F	variables
Gtrainable_variables
Hregularization_losses
I	keras_api
J__call__
*K&call_and_return_all_conditional_losses
L	quantizer"
_tf_keras_layer
Љ
M	variables
Ntrainable_variables
Oregularization_losses
P	keras_api
Q__call__
*R&call_and_return_all_conditional_losses
S_random_generator"
_tf_keras_layer
ц
T	variables
Utrainable_variables
Vregularization_losses
W	keras_api
X__call__
*Y&call_and_return_all_conditional_losses
Zkernel_quantizer
Zkernel_quantizer_internal
[
quantizers

\kernel"
_tf_keras_layer
і
]	variables
^trainable_variables
_regularization_losses
`	keras_api
a__call__
*b&call_and_return_all_conditional_losses
c	quantizer"
_tf_keras_layer
_
#0
C1
D2
d3
e4
E5
f6
g7
\8"
trackable_list_wrapper
J
#0
C1
D2
d3
e4
\5"
trackable_list_wrapper
 "
trackable_list_wrapper
 
hnon_trainable_variables

ilayers
jmetrics
klayer_regularization_losses
llayer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
Ё
mtrace_0
ntrace_1
otrace_2
ptrace_32т
*__inference_cicada-v2_layer_call_fn_262446
*__inference_cicada-v2_layer_call_fn_262943
*__inference_cicada-v2_layer_call_fn_262966
*__inference_cicada-v2_layer_call_fn_262825њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zmtrace_0zntrace_1zotrace_2zptrace_3
…
qtrace_0
rtrace_1
strace_2
ttrace_32ё
E__inference_cicada-v2_layer_call_and_return_conditional_losses_263311
E__inference_cicada-v2_layer_call_and_return_conditional_losses_263695
E__inference_cicada-v2_layer_call_and_return_conditional_losses_262857
E__inference_cicada-v2_layer_call_and_return_conditional_losses_262889њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zqtrace_0zrtrace_1zstrace_2zttrace_3
ћB…
!__inference__wrapped_model_261916inputs_"Ш
С≤Н
FullArgSpec
argsЪ 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
Ћ
uiter

vbeta_1

wbeta_2
	xdecay
ylearning_rate#m№CmЁDmё\mяdmаemб#vвCvгDvд\vеdvжevз"
	optimizer
,
zserving_default"
signature_map
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
≠
{non_trainable_variables

|layers
}metrics
~layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
о
Аtrace_02ѕ
(__inference_reshape_layer_call_fn_263700Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zАtrace_0
Й
Бtrace_02к
C__inference_reshape_layer_call_and_return_conditional_losses_263714Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zБtrace_0
'
#0"
trackable_list_wrapper
'
#0"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
Вnon_trainable_variables
Гlayers
Дmetrics
 Еlayer_regularization_losses
Жlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
* &call_and_return_all_conditional_losses
& "call_and_return_conditional_losses"
_generic_user_object
л
Зtrace_02ћ
%__inference_conv_layer_call_fn_263721Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЗtrace_0
Ж
Иtrace_02з
@__inference_conv_layer_call_and_return_conditional_losses_263762Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zИtrace_0
"
_generic_user_object
'
!0"
trackable_list_wrapper
%:#2conv/kernel
і2±Ѓ
£≤Я
FullArgSpec'
argsЪ
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
≤
Йnon_trainable_variables
Кlayers
Лmetrics
 Мlayer_regularization_losses
Нlayer_metrics
%	variables
&trainable_variables
'regularization_losses
)__call__
**&call_and_return_all_conditional_losses
&*"call_and_return_conditional_losses"
_generic_user_object
м
Оtrace_02Ќ
&__inference_relu0_layer_call_fn_263767Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zОtrace_0
З
Пtrace_02и
A__inference_relu0_layer_call_and_return_conditional_losses_263816Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zПtrace_0
"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
≤
Рnon_trainable_variables
Сlayers
Тmetrics
 Уlayer_regularization_losses
Фlayer_metrics
,	variables
-trainable_variables
.regularization_losses
0__call__
*1&call_and_return_all_conditional_losses
&1"call_and_return_conditional_losses"
_generic_user_object
о
Хtrace_02ѕ
(__inference_flatten_layer_call_fn_263821Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zХtrace_0
Й
Цtrace_02к
C__inference_flatten_layer_call_and_return_conditional_losses_263827Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЦtrace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
≤
Чnon_trainable_variables
Шlayers
Щmetrics
 Ъlayer_regularization_losses
Ыlayer_metrics
2	variables
3trainable_variables
4regularization_losses
6__call__
*7&call_and_return_all_conditional_losses
&7"call_and_return_conditional_losses"
_generic_user_object
…
Ьtrace_0
Эtrace_12О
*__inference_dropout_1_layer_call_fn_263832
*__inference_dropout_1_layer_call_fn_263837≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЬtrace_0zЭtrace_1
€
Юtrace_0
Яtrace_12ƒ
E__inference_dropout_1_layer_call_and_return_conditional_losses_263842
E__inference_dropout_1_layer_call_and_return_conditional_losses_263854≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЮtrace_0zЯtrace_1
"
_generic_user_object
Q
C0
D1
d2
e3
E4
f5
g6"
trackable_list_wrapper
<
C0
D1
d2
e3"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
†non_trainable_variables
°layers
Ґmetrics
 £layer_regularization_losses
§layer_metrics
9	variables
:trainable_variables
;regularization_losses
=__call__
*>&call_and_return_all_conditional_losses
&>"call_and_return_conditional_losses"
_generic_user_object
√
•trace_0
¶trace_12И
'__inference_dense1_layer_call_fn_263873
'__inference_dense1_layer_call_fn_263892≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z•trace_0z¶trace_1
щ
Іtrace_0
®trace_12Њ
B__inference_dense1_layer_call_and_return_conditional_losses_264014
B__inference_dense1_layer_call_and_return_conditional_losses_264161≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zІtrace_0z®trace_1
"
_generic_user_object
"
_generic_user_object
.
?0
@1"
trackable_list_wrapper
с
©	variables
™trainable_variables
Ђregularization_losses
ђ	keras_api
≠__call__
+Ѓ&call_and_return_all_conditional_losses
	ѓaxis
	dgamma
ebeta
fmoving_mean
gmoving_variance"
_tf_keras_layer
 :	ь2dense1/kernel
:2dense1/bias
:	 2dense1/iteration
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
≤
∞non_trainable_variables
±layers
≤metrics
 ≥layer_regularization_losses
іlayer_metrics
F	variables
Gtrainable_variables
Hregularization_losses
J__call__
*K&call_and_return_all_conditional_losses
&K"call_and_return_conditional_losses"
_generic_user_object
м
µtrace_02Ќ
&__inference_relu1_layer_call_fn_264166Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zµtrace_0
З
ґtrace_02и
A__inference_relu1_layer_call_and_return_conditional_losses_264215Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zґtrace_0
"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
≤
Јnon_trainable_variables
Єlayers
єmetrics
 Їlayer_regularization_losses
їlayer_metrics
M	variables
Ntrainable_variables
Oregularization_losses
Q__call__
*R&call_and_return_all_conditional_losses
&R"call_and_return_conditional_losses"
_generic_user_object
…
Љtrace_0
љtrace_12О
*__inference_dropout_2_layer_call_fn_264220
*__inference_dropout_2_layer_call_fn_264225≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЉtrace_0zљtrace_1
€
Њtrace_0
њtrace_12ƒ
E__inference_dropout_2_layer_call_and_return_conditional_losses_264230
E__inference_dropout_2_layer_call_and_return_conditional_losses_264242≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЊtrace_0zњtrace_1
"
_generic_user_object
'
\0"
trackable_list_wrapper
'
\0"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
јnon_trainable_variables
Ѕlayers
¬metrics
 √layer_regularization_losses
ƒlayer_metrics
T	variables
Utrainable_variables
Vregularization_losses
X__call__
*Y&call_and_return_all_conditional_losses
&Y"call_and_return_conditional_losses"
_generic_user_object
н
≈trace_02ќ
'__inference_dense2_layer_call_fn_264249Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z≈trace_0
И
∆trace_02й
B__inference_dense2_layer_call_and_return_conditional_losses_264290Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z∆trace_0
"
_generic_user_object
'
Z0"
trackable_list_wrapper
:2dense2/kernel
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
≤
«non_trainable_variables
»layers
…metrics
  layer_regularization_losses
Ћlayer_metrics
]	variables
^trainable_variables
_regularization_losses
a__call__
*b&call_and_return_all_conditional_losses
&b"call_and_return_conditional_losses"
_generic_user_object
о
ћtrace_02ѕ
(__inference_outputs_layer_call_fn_264295Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zћtrace_0
Й
Ќtrace_02к
C__inference_outputs_layer_call_and_return_conditional_losses_264344Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЌtrace_0
"
_generic_user_object
0:.2"dense1/batch_normalization_1/gamma
/:-2!dense1/batch_normalization_1/beta
8:6 (2(dense1/batch_normalization_1/moving_mean
<:: (2,dense1/batch_normalization_1/moving_variance
5
E0
f1
g2"
trackable_list_wrapper
n
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
10"
trackable_list_wrapper
(
ќ0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ьBщ
*__inference_cicada-v2_layer_call_fn_262446inputs_"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ыBш
*__inference_cicada-v2_layer_call_fn_262943inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ыBш
*__inference_cicada-v2_layer_call_fn_262966inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ьBщ
*__inference_cicada-v2_layer_call_fn_262825inputs_"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЦBУ
E__inference_cicada-v2_layer_call_and_return_conditional_losses_263311inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЦBУ
E__inference_cicada-v2_layer_call_and_return_conditional_losses_263695inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЧBФ
E__inference_cicada-v2_layer_call_and_return_conditional_losses_262857inputs_"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЧBФ
E__inference_cicada-v2_layer_call_and_return_conditional_losses_262889inputs_"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
ЋB»
$__inference_signature_wrapper_262920inputs_"Ф
Н≤Й
FullArgSpec
argsЪ 
varargs
 
varkwjkwargs
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
№Bў
(__inference_reshape_layer_call_fn_263700inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
C__inference_reshape_layer_call_and_return_conditional_losses_263714inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
ўB÷
%__inference_conv_layer_call_fn_263721inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
фBс
@__inference_conv_layer_call_and_return_conditional_losses_263762inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
ЏB„
&__inference_relu0_layer_call_fn_263767inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
хBт
A__inference_relu0_layer_call_and_return_conditional_losses_263816inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
№Bў
(__inference_flatten_layer_call_fn_263821inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
C__inference_flatten_layer_call_and_return_conditional_losses_263827inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
пBм
*__inference_dropout_1_layer_call_fn_263832inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
пBм
*__inference_dropout_1_layer_call_fn_263837inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
КBЗ
E__inference_dropout_1_layer_call_and_return_conditional_losses_263842inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
КBЗ
E__inference_dropout_1_layer_call_and_return_conditional_losses_263854inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
5
E0
f1
g2"
trackable_list_wrapper
'
B0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
мBй
'__inference_dense1_layer_call_fn_263873inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
мBй
'__inference_dense1_layer_call_fn_263892inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЗBД
B__inference_dense1_layer_call_and_return_conditional_losses_264014inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЗBД
B__inference_dense1_layer_call_and_return_conditional_losses_264161inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
<
d0
e1
f2
g3"
trackable_list_wrapper
.
d0
e1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
ѕnon_trainable_variables
–layers
—metrics
 “layer_regularization_losses
”layer_metrics
©	variables
™trainable_variables
Ђregularization_losses
≠__call__
+Ѓ&call_and_return_all_conditional_losses
'Ѓ"call_and_return_conditional_losses"
_generic_user_object
б
‘trace_0
’trace_12¶
6__inference_batch_normalization_1_layer_call_fn_264357
6__inference_batch_normalization_1_layer_call_fn_264370≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z‘trace_0z’trace_1
Ч
÷trace_0
„trace_12№
Q__inference_batch_normalization_1_layer_call_and_return_conditional_losses_264390
Q__inference_batch_normalization_1_layer_call_and_return_conditional_losses_264424≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z÷trace_0z„trace_1
 "
trackable_list_wrapper
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
ЏB„
&__inference_relu1_layer_call_fn_264166inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
хBт
A__inference_relu1_layer_call_and_return_conditional_losses_264215inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
пBм
*__inference_dropout_2_layer_call_fn_264220inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
пBм
*__inference_dropout_2_layer_call_fn_264225inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
КBЗ
E__inference_dropout_2_layer_call_and_return_conditional_losses_264230inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
КBЗ
E__inference_dropout_2_layer_call_and_return_conditional_losses_264242inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
џBЎ
'__inference_dense2_layer_call_fn_264249inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
цBу
B__inference_dense2_layer_call_and_return_conditional_losses_264290inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
№Bў
(__inference_outputs_layer_call_fn_264295inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
C__inference_outputs_layer_call_and_return_conditional_losses_264344inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
R
Ў	variables
ў	keras_api

Џtotal

џcount"
_tf_keras_metric
.
f0
g1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ыBш
6__inference_batch_normalization_1_layer_call_fn_264357inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ыBш
6__inference_batch_normalization_1_layer_call_fn_264370inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЦBУ
Q__inference_batch_normalization_1_layer_call_and_return_conditional_losses_264390inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЦBУ
Q__inference_batch_normalization_1_layer_call_and_return_conditional_losses_264424inputs"≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
0
Џ0
џ1"
trackable_list_wrapper
.
Ў	variables"
_generic_user_object
:  (2total
:  (2count
*:(2Adam/conv/kernel/m
%:#	ь2Adam/dense1/kernel/m
:2Adam/dense1/bias/m
$:"2Adam/dense2/kernel/m
5:32)Adam/dense1/batch_normalization_1/gamma/m
4:22(Adam/dense1/batch_normalization_1/beta/m
*:(2Adam/conv/kernel/v
%:#	ь2Adam/dense1/kernel/v
:2Adam/dense1/bias/v
$:"2Adam/dense2/kernel/v
5:32)Adam/dense1/batch_normalization_1/gamma/v
4:22(Adam/dense1/batch_normalization_1/beta/vЦ
!__inference__wrapped_model_261916q	#CDgdfeE\1Ґ.
'Ґ$
"К
inputs_€€€€€€€€€ь
™ "1™.
,
outputs!К
outputs€€€€€€€€€Ј
Q__inference_batch_normalization_1_layer_call_and_return_conditional_losses_264390bgdfe3Ґ0
)Ґ&
 К
inputs€€€€€€€€€
p 
™ "%Ґ"
К
0€€€€€€€€€
Ъ Ј
Q__inference_batch_normalization_1_layer_call_and_return_conditional_losses_264424bfgde3Ґ0
)Ґ&
 К
inputs€€€€€€€€€
p
™ "%Ґ"
К
0€€€€€€€€€
Ъ П
6__inference_batch_normalization_1_layer_call_fn_264357Ugdfe3Ґ0
)Ґ&
 К
inputs€€€€€€€€€
p 
™ "К€€€€€€€€€П
6__inference_batch_normalization_1_layer_call_fn_264370Ufgde3Ґ0
)Ґ&
 К
inputs€€€€€€€€€
p
™ "К€€€€€€€€€ґ
E__inference_cicada-v2_layer_call_and_return_conditional_losses_262857m	#CDgdfeE\9Ґ6
/Ґ,
"К
inputs_€€€€€€€€€ь
p 

 
™ "%Ґ"
К
0€€€€€€€€€
Ъ ґ
E__inference_cicada-v2_layer_call_and_return_conditional_losses_262889m	#CDfgdeE\9Ґ6
/Ґ,
"К
inputs_€€€€€€€€€ь
p

 
™ "%Ґ"
К
0€€€€€€€€€
Ъ µ
E__inference_cicada-v2_layer_call_and_return_conditional_losses_263311l	#CDgdfeE\8Ґ5
.Ґ+
!К
inputs€€€€€€€€€ь
p 

 
™ "%Ґ"
К
0€€€€€€€€€
Ъ µ
E__inference_cicada-v2_layer_call_and_return_conditional_losses_263695l	#CDfgdeE\8Ґ5
.Ґ+
!К
inputs€€€€€€€€€ь
p

 
™ "%Ґ"
К
0€€€€€€€€€
Ъ О
*__inference_cicada-v2_layer_call_fn_262446`	#CDgdfeE\9Ґ6
/Ґ,
"К
inputs_€€€€€€€€€ь
p 

 
™ "К€€€€€€€€€О
*__inference_cicada-v2_layer_call_fn_262825`	#CDfgdeE\9Ґ6
/Ґ,
"К
inputs_€€€€€€€€€ь
p

 
™ "К€€€€€€€€€Н
*__inference_cicada-v2_layer_call_fn_262943_	#CDgdfeE\8Ґ5
.Ґ+
!К
inputs€€€€€€€€€ь
p 

 
™ "К€€€€€€€€€Н
*__inference_cicada-v2_layer_call_fn_262966_	#CDfgdeE\8Ґ5
.Ґ+
!К
inputs€€€€€€€€€ь
p

 
™ "К€€€€€€€€€ѓ
@__inference_conv_layer_call_and_return_conditional_losses_263762k#7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€
™ "-Ґ*
#К 
0€€€€€€€€€	
Ъ З
%__inference_conv_layer_call_fn_263721^#7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€
™ " К€€€€€€€€€	ђ
B__inference_dense1_layer_call_and_return_conditional_losses_264014fCDgdfeE4Ґ1
*Ґ'
!К
inputs€€€€€€€€€ь
p 
™ "%Ґ"
К
0€€€€€€€€€
Ъ ђ
B__inference_dense1_layer_call_and_return_conditional_losses_264161fCDfgdeE4Ґ1
*Ґ'
!К
inputs€€€€€€€€€ь
p
™ "%Ґ"
К
0€€€€€€€€€
Ъ Д
'__inference_dense1_layer_call_fn_263873YCDgdfeE4Ґ1
*Ґ'
!К
inputs€€€€€€€€€ь
p 
™ "К€€€€€€€€€Д
'__inference_dense1_layer_call_fn_263892YCDfgdeE4Ґ1
*Ґ'
!К
inputs€€€€€€€€€ь
p
™ "К€€€€€€€€€°
B__inference_dense2_layer_call_and_return_conditional_losses_264290[\/Ґ,
%Ґ"
 К
inputs€€€€€€€€€
™ "%Ґ"
К
0€€€€€€€€€
Ъ y
'__inference_dense2_layer_call_fn_264249N\/Ґ,
%Ґ"
 К
inputs€€€€€€€€€
™ "К€€€€€€€€€І
E__inference_dropout_1_layer_call_and_return_conditional_losses_263842^4Ґ1
*Ґ'
!К
inputs€€€€€€€€€ь
p 
™ "&Ґ#
К
0€€€€€€€€€ь
Ъ І
E__inference_dropout_1_layer_call_and_return_conditional_losses_263854^4Ґ1
*Ґ'
!К
inputs€€€€€€€€€ь
p
™ "&Ґ#
К
0€€€€€€€€€ь
Ъ 
*__inference_dropout_1_layer_call_fn_263832Q4Ґ1
*Ґ'
!К
inputs€€€€€€€€€ь
p 
™ "К€€€€€€€€€ь
*__inference_dropout_1_layer_call_fn_263837Q4Ґ1
*Ґ'
!К
inputs€€€€€€€€€ь
p
™ "К€€€€€€€€€ь•
E__inference_dropout_2_layer_call_and_return_conditional_losses_264230\3Ґ0
)Ґ&
 К
inputs€€€€€€€€€
p 
™ "%Ґ"
К
0€€€€€€€€€
Ъ •
E__inference_dropout_2_layer_call_and_return_conditional_losses_264242\3Ґ0
)Ґ&
 К
inputs€€€€€€€€€
p
™ "%Ґ"
К
0€€€€€€€€€
Ъ }
*__inference_dropout_2_layer_call_fn_264220O3Ґ0
)Ґ&
 К
inputs€€€€€€€€€
p 
™ "К€€€€€€€€€}
*__inference_dropout_2_layer_call_fn_264225O3Ґ0
)Ґ&
 К
inputs€€€€€€€€€
p
™ "К€€€€€€€€€®
C__inference_flatten_layer_call_and_return_conditional_losses_263827a7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€	
™ "&Ґ#
К
0€€€€€€€€€ь
Ъ А
(__inference_flatten_layer_call_fn_263821T7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€	
™ "К€€€€€€€€€ьЯ
C__inference_outputs_layer_call_and_return_conditional_losses_264344X/Ґ,
%Ґ"
 К
inputs€€€€€€€€€
™ "%Ґ"
К
0€€€€€€€€€
Ъ w
(__inference_outputs_layer_call_fn_264295K/Ґ,
%Ґ"
 К
inputs€€€€€€€€€
™ "К€€€€€€€€€≠
A__inference_relu0_layer_call_and_return_conditional_losses_263816h7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€	
™ "-Ґ*
#К 
0€€€€€€€€€	
Ъ Е
&__inference_relu0_layer_call_fn_263767[7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€	
™ " К€€€€€€€€€	Э
A__inference_relu1_layer_call_and_return_conditional_losses_264215X/Ґ,
%Ґ"
 К
inputs€€€€€€€€€
™ "%Ґ"
К
0€€€€€€€€€
Ъ u
&__inference_relu1_layer_call_fn_264166K/Ґ,
%Ґ"
 К
inputs€€€€€€€€€
™ "К€€€€€€€€€®
C__inference_reshape_layer_call_and_return_conditional_losses_263714a0Ґ-
&Ґ#
!К
inputs€€€€€€€€€ь
™ "-Ґ*
#К 
0€€€€€€€€€
Ъ А
(__inference_reshape_layer_call_fn_263700T0Ґ-
&Ґ#
!К
inputs€€€€€€€€€ь
™ " К€€€€€€€€€§
$__inference_signature_wrapper_262920|	#CDgdfeE\<Ґ9
Ґ 
2™/
-
inputs_"К
inputs_€€€€€€€€€ь"1™.
,
outputs!К
outputs€€€€€€€€€