��
��
D
AddV2
x"T
y"T
z"T"
Ttype:
2	��
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( �
�
BiasAdd

value"T	
bias"T
output"T""
Ttype:
2	"-
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
$
DisableCopyOnRead
resource�
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
�
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
epsilonfloat%��8"&
exponential_avg_factorfloat%  �?";
data_formatstringNHWC:
NHWCNCHWNDHWCNCDHW"
is_trainingbool(
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
u
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
2	
>
Maximum
x"T
y"T
z"T"
Ttype:
2	
�
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( �
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
2	�
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
dtypetype�
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
list(type)(0�
2
Round
x"T
y"T"
Ttype:
2
	
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
A
SelectV2
	condition

t"T
e"T
output"T"	
Ttype
d
Shape

input"T&
output"out_type��out_type"	
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
2
StopGradient

input"T
output"T"	
Ttype
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
<
Sub
x"T
y"T
z"T"
Ttype:
2	
�
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 �"serve*2.12.02unknown8��
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
�
Adam/v/cicada_v1_dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*0
shared_name!Adam/v/cicada_v1_dense_2/kernel
�
3Adam/v/cicada_v1_dense_2/kernel/Read/ReadVariableOpReadVariableOpAdam/v/cicada_v1_dense_2/kernel*
_output_shapes

:*
dtype0
�
Adam/m/cicada_v1_dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*0
shared_name!Adam/m/cicada_v1_dense_2/kernel
�
3Adam/m/cicada_v1_dense_2/kernel/Read/ReadVariableOpReadVariableOpAdam/m/cicada_v1_dense_2/kernel*
_output_shapes

:*
dtype0
�
Adam/v/cicada_v1_dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_nameAdam/v/cicada_v1_dense_1/bias
�
1Adam/v/cicada_v1_dense_1/bias/Read/ReadVariableOpReadVariableOpAdam/v/cicada_v1_dense_1/bias*
_output_shapes
:*
dtype0
�
Adam/m/cicada_v1_dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_nameAdam/m/cicada_v1_dense_1/bias
�
1Adam/m/cicada_v1_dense_1/bias/Read/ReadVariableOpReadVariableOpAdam/m/cicada_v1_dense_1/bias*
_output_shapes
:*
dtype0
�
Adam/v/cicada_v1_dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*0
shared_name!Adam/v/cicada_v1_dense_1/kernel
�
3Adam/v/cicada_v1_dense_1/kernel/Read/ReadVariableOpReadVariableOpAdam/v/cicada_v1_dense_1/kernel*
_output_shapes
:	�*
dtype0
�
Adam/m/cicada_v1_dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*0
shared_name!Adam/m/cicada_v1_dense_1/kernel
�
3Adam/m/cicada_v1_dense_1/kernel/Read/ReadVariableOpReadVariableOpAdam/m/cicada_v1_dense_1/kernel*
_output_shapes
:	�*
dtype0
�
Adam/v/cicada_v1_layernorm/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*0
shared_name!Adam/v/cicada_v1_layernorm/beta
�
3Adam/v/cicada_v1_layernorm/beta/Read/ReadVariableOpReadVariableOpAdam/v/cicada_v1_layernorm/beta*
_output_shapes	
:�*
dtype0
�
Adam/m/cicada_v1_layernorm/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*0
shared_name!Adam/m/cicada_v1_layernorm/beta
�
3Adam/m/cicada_v1_layernorm/beta/Read/ReadVariableOpReadVariableOpAdam/m/cicada_v1_layernorm/beta*
_output_shapes	
:�*
dtype0
�
 Adam/v/cicada_v1_layernorm/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*1
shared_name" Adam/v/cicada_v1_layernorm/gamma
�
4Adam/v/cicada_v1_layernorm/gamma/Read/ReadVariableOpReadVariableOp Adam/v/cicada_v1_layernorm/gamma*
_output_shapes	
:�*
dtype0
�
 Adam/m/cicada_v1_layernorm/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*1
shared_name" Adam/m/cicada_v1_layernorm/gamma
�
4Adam/m/cicada_v1_layernorm/gamma/Read/ReadVariableOpReadVariableOp Adam/m/cicada_v1_layernorm/gamma*
_output_shapes	
:�*
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
�
cicada_v1_dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*)
shared_namecicada_v1_dense_2/kernel
�
,cicada_v1_dense_2/kernel/Read/ReadVariableOpReadVariableOpcicada_v1_dense_2/kernel*
_output_shapes

:*
dtype0
�
cicada_v1_dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*'
shared_namecicada_v1_dense_1/bias
}
*cicada_v1_dense_1/bias/Read/ReadVariableOpReadVariableOpcicada_v1_dense_1/bias*
_output_shapes
:*
dtype0
�
cicada_v1_dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*)
shared_namecicada_v1_dense_1/kernel
�
,cicada_v1_dense_1/kernel/Read/ReadVariableOpReadVariableOpcicada_v1_dense_1/kernel*
_output_shapes
:	�*
dtype0
�
cicada_v1_layernorm/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:�*)
shared_namecicada_v1_layernorm/beta
�
,cicada_v1_layernorm/beta/Read/ReadVariableOpReadVariableOpcicada_v1_layernorm/beta*
_output_shapes	
:�*
dtype0
�
cicada_v1_layernorm/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:�**
shared_namecicada_v1_layernorm/gamma
�
-cicada_v1_layernorm/gamma/Read/ReadVariableOpReadVariableOpcicada_v1_layernorm/gamma*
_output_shapes	
:�*
dtype0
�
serving_default_cicada_v1_inputPlaceholder*(
_output_shapes
:����������*
dtype0*
shape:����������
�
StatefulPartitionedCallStatefulPartitionedCallserving_default_cicada_v1_inputcicada_v1_layernorm/gammacicada_v1_layernorm/betacicada_v1_dense_1/kernelcicada_v1_dense_1/biascicada_v1_dense_2/kernel*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8� */
f*R(
&__inference_signature_wrapper_18953576

NoOpNoOp
�8
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*�8
value�8B�8 B�7
�
layer_with_weights-0
layer-0
layer_with_weights-1
layer-1
layer-2
layer-3
layer_with_weights-2
layer-4
layer-5
	variables
trainable_variables
	regularization_losses

	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures*
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
axis
	gamma
beta*
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
kernel_quantizer
 bias_quantizer
kernel_quantizer_internal
 bias_quantizer_internal
!
quantizers

"kernel
#bias*
�
$	variables
%trainable_variables
&regularization_losses
'	keras_api
(__call__
*)&call_and_return_all_conditional_losses
*	quantizer* 
�
+	variables
,trainable_variables
-regularization_losses
.	keras_api
/__call__
*0&call_and_return_all_conditional_losses
1_random_generator* 
�
2	variables
3trainable_variables
4regularization_losses
5	keras_api
6__call__
*7&call_and_return_all_conditional_losses
8kernel_quantizer
8kernel_quantizer_internal
9
quantizers

:kernel*
�
;	variables
<trainable_variables
=regularization_losses
>	keras_api
?__call__
*@&call_and_return_all_conditional_losses
A	quantizer* 
'
0
1
"2
#3
:4*
'
0
1
"2
#3
:4*
* 
�
Bnon_trainable_variables

Clayers
Dmetrics
Elayer_regularization_losses
Flayer_metrics
	variables
trainable_variables
	regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
6
Gtrace_0
Htrace_1
Itrace_2
Jtrace_3* 
6
Ktrace_0
Ltrace_1
Mtrace_2
Ntrace_3* 
* 
�
O
_variables
P_iterations
Q_learning_rate
R_index_dict
S
_momentums
T_velocities
U_update_step_xla*

Vserving_default* 

0
1*

0
1*
* 
�
Wnon_trainable_variables

Xlayers
Ymetrics
Zlayer_regularization_losses
[layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

\trace_0* 

]trace_0* 
* 
hb
VARIABLE_VALUEcicada_v1_layernorm/gamma5layer_with_weights-0/gamma/.ATTRIBUTES/VARIABLE_VALUE*
f`
VARIABLE_VALUEcicada_v1_layernorm/beta4layer_with_weights-0/beta/.ATTRIBUTES/VARIABLE_VALUE*

"0
#1*

"0
#1*
* 
�
^non_trainable_variables

_layers
`metrics
alayer_regularization_losses
blayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

ctrace_0* 

dtrace_0* 
* 
* 

0
 1* 
hb
VARIABLE_VALUEcicada_v1_dense_1/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE*
d^
VARIABLE_VALUEcicada_v1_dense_1/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
�
enon_trainable_variables

flayers
gmetrics
hlayer_regularization_losses
ilayer_metrics
$	variables
%trainable_variables
&regularization_losses
(__call__
*)&call_and_return_all_conditional_losses
&)"call_and_return_conditional_losses* 

jtrace_0* 

ktrace_0* 
* 
* 
* 
* 
�
lnon_trainable_variables

mlayers
nmetrics
olayer_regularization_losses
player_metrics
+	variables
,trainable_variables
-regularization_losses
/__call__
*0&call_and_return_all_conditional_losses
&0"call_and_return_conditional_losses* 

qtrace_0
rtrace_1* 

strace_0
ttrace_1* 
* 

:0*

:0*
* 
�
unon_trainable_variables

vlayers
wmetrics
xlayer_regularization_losses
ylayer_metrics
2	variables
3trainable_variables
4regularization_losses
6__call__
*7&call_and_return_all_conditional_losses
&7"call_and_return_conditional_losses*

ztrace_0* 

{trace_0* 
* 
	
80* 
hb
VARIABLE_VALUEcicada_v1_dense_2/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
�
|non_trainable_variables

}layers
~metrics
layer_regularization_losses
�layer_metrics
;	variables
<trainable_variables
=regularization_losses
?__call__
*@&call_and_return_all_conditional_losses
&@"call_and_return_conditional_losses* 

�trace_0* 

�trace_0* 
* 
* 
.
0
1
2
3
4
5*

�0
�1*
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
\
P0
�1
�2
�3
�4
�5
�6
�7
�8
�9
�10*
SM
VARIABLE_VALUE	iteration0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUElearning_rate3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
* 
,
�0
�1
�2
�3
�4*
,
�0
�1
�2
�3
�4*
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
�	variables
�	keras_api

�total

�count*
M
�	variables
�	keras_api

�total

�count
�
_fn_kwargs*
ke
VARIABLE_VALUE Adam/m/cicada_v1_layernorm/gamma1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUE*
ke
VARIABLE_VALUE Adam/v/cicada_v1_layernorm/gamma1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUE*
jd
VARIABLE_VALUEAdam/m/cicada_v1_layernorm/beta1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUE*
jd
VARIABLE_VALUEAdam/v/cicada_v1_layernorm/beta1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUE*
jd
VARIABLE_VALUEAdam/m/cicada_v1_dense_1/kernel1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUE*
jd
VARIABLE_VALUEAdam/v/cicada_v1_dense_1/kernel1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUE*
hb
VARIABLE_VALUEAdam/m/cicada_v1_dense_1/bias1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUE*
hb
VARIABLE_VALUEAdam/v/cicada_v1_dense_1/bias1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUE*
jd
VARIABLE_VALUEAdam/m/cicada_v1_dense_2/kernel1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUE*
ke
VARIABLE_VALUEAdam/v/cicada_v1_dense_2/kernel2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUE*

�0
�1*

�	variables*
UO
VARIABLE_VALUEtotal_14keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
UO
VARIABLE_VALUEcount_14keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*

�0
�1*

�	variables*
SM
VARIABLE_VALUEtotal4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE*
* 
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
�
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filenamecicada_v1_layernorm/gammacicada_v1_layernorm/betacicada_v1_dense_1/kernelcicada_v1_dense_1/biascicada_v1_dense_2/kernel	iterationlearning_rate Adam/m/cicada_v1_layernorm/gamma Adam/v/cicada_v1_layernorm/gammaAdam/m/cicada_v1_layernorm/betaAdam/v/cicada_v1_layernorm/betaAdam/m/cicada_v1_dense_1/kernelAdam/v/cicada_v1_dense_1/kernelAdam/m/cicada_v1_dense_1/biasAdam/v/cicada_v1_dense_1/biasAdam/m/cicada_v1_dense_2/kernelAdam/v/cicada_v1_dense_2/kerneltotal_1count_1totalcountConst*"
Tin
2*
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
GPU 2J 8� **
f%R#
!__inference__traced_save_18954526
�
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamecicada_v1_layernorm/gammacicada_v1_layernorm/betacicada_v1_dense_1/kernelcicada_v1_dense_1/biascicada_v1_dense_2/kernel	iterationlearning_rate Adam/m/cicada_v1_layernorm/gamma Adam/v/cicada_v1_layernorm/gammaAdam/m/cicada_v1_layernorm/betaAdam/v/cicada_v1_layernorm/betaAdam/m/cicada_v1_dense_1/kernelAdam/v/cicada_v1_dense_1/kernelAdam/m/cicada_v1_dense_1/biasAdam/v/cicada_v1_dense_1/biasAdam/m/cicada_v1_dense_2/kernelAdam/v/cicada_v1_dense_2/kerneltotal_1count_1totalcount*!
Tin
2*
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
GPU 2J 8� *-
f(R&
$__inference__traced_restore_18954599��
��
�
H__inference_sequential_layer_call_and_return_conditional_losses_18953835

inputs@
1cicada_v1_layernorm_mul_2_readvariableop_resource:	�>
/cicada_v1_layernorm_add_readvariableop_resource:	�<
)cicada_v1_dense_1_readvariableop_resource:	�9
+cicada_v1_dense_1_readvariableop_3_resource:;
)cicada_v1_dense_2_readvariableop_resource:
identity�� cicada_v1_dense_1/ReadVariableOp�"cicada_v1_dense_1/ReadVariableOp_1�"cicada_v1_dense_1/ReadVariableOp_2�"cicada_v1_dense_1/ReadVariableOp_3�"cicada_v1_dense_1/ReadVariableOp_4�"cicada_v1_dense_1/ReadVariableOp_5� cicada_v1_dense_2/ReadVariableOp�"cicada_v1_dense_2/ReadVariableOp_1�"cicada_v1_dense_2/ReadVariableOp_2�&cicada_v1_layernorm/add/ReadVariableOp�(cicada_v1_layernorm/mul_2/ReadVariableOp]
cicada_v1_layernorm/ShapeShapeinputs*
T0*
_output_shapes
::��q
'cicada_v1_layernorm/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: s
)cicada_v1_layernorm/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:s
)cicada_v1_layernorm/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
!cicada_v1_layernorm/strided_sliceStridedSlice"cicada_v1_layernorm/Shape:output:00cicada_v1_layernorm/strided_slice/stack:output:02cicada_v1_layernorm/strided_slice/stack_1:output:02cicada_v1_layernorm/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask[
cicada_v1_layernorm/mul/xConst*
_output_shapes
: *
dtype0*
value	B :�
cicada_v1_layernorm/mulMul"cicada_v1_layernorm/mul/x:output:0*cicada_v1_layernorm/strided_slice:output:0*
T0*
_output_shapes
: s
)cicada_v1_layernorm/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:u
+cicada_v1_layernorm/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:u
+cicada_v1_layernorm/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
#cicada_v1_layernorm/strided_slice_1StridedSlice"cicada_v1_layernorm/Shape:output:02cicada_v1_layernorm/strided_slice_1/stack:output:04cicada_v1_layernorm/strided_slice_1/stack_1:output:04cicada_v1_layernorm/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask]
cicada_v1_layernorm/mul_1/xConst*
_output_shapes
: *
dtype0*
value	B :�
cicada_v1_layernorm/mul_1Mul$cicada_v1_layernorm/mul_1/x:output:0,cicada_v1_layernorm/strided_slice_1:output:0*
T0*
_output_shapes
: e
#cicada_v1_layernorm/Reshape/shape/0Const*
_output_shapes
: *
dtype0*
value	B :e
#cicada_v1_layernorm/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :�
!cicada_v1_layernorm/Reshape/shapePack,cicada_v1_layernorm/Reshape/shape/0:output:0cicada_v1_layernorm/mul:z:0cicada_v1_layernorm/mul_1:z:0,cicada_v1_layernorm/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:�
cicada_v1_layernorm/ReshapeReshapeinputs*cicada_v1_layernorm/Reshape/shape:output:0*
T0*0
_output_shapes
:����������r
cicada_v1_layernorm/ones/packedPackcicada_v1_layernorm/mul:z:0*
N*
T0*
_output_shapes
:c
cicada_v1_layernorm/ones/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_layernorm/onesFill(cicada_v1_layernorm/ones/packed:output:0'cicada_v1_layernorm/ones/Const:output:0*
T0*#
_output_shapes
:���������s
 cicada_v1_layernorm/zeros/packedPackcicada_v1_layernorm/mul:z:0*
N*
T0*
_output_shapes
:d
cicada_v1_layernorm/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    �
cicada_v1_layernorm/zerosFill)cicada_v1_layernorm/zeros/packed:output:0(cicada_v1_layernorm/zeros/Const:output:0*
T0*#
_output_shapes
:���������\
cicada_v1_layernorm/ConstConst*
_output_shapes
: *
dtype0*
valueB ^
cicada_v1_layernorm/Const_1Const*
_output_shapes
: *
dtype0*
valueB �
$cicada_v1_layernorm/FusedBatchNormV3FusedBatchNormV3$cicada_v1_layernorm/Reshape:output:0!cicada_v1_layernorm/ones:output:0"cicada_v1_layernorm/zeros:output:0"cicada_v1_layernorm/Const:output:0$cicada_v1_layernorm/Const_1:output:0*
T0*
U0*p
_output_shapes^
\:����������:���������:���������:���������:���������:*
data_formatNCHW*
epsilon%o�:�
cicada_v1_layernorm/Reshape_1Reshape(cicada_v1_layernorm/FusedBatchNormV3:y:0"cicada_v1_layernorm/Shape:output:0*
T0*(
_output_shapes
:�����������
(cicada_v1_layernorm/mul_2/ReadVariableOpReadVariableOp1cicada_v1_layernorm_mul_2_readvariableop_resource*
_output_shapes	
:�*
dtype0�
cicada_v1_layernorm/mul_2Mul&cicada_v1_layernorm/Reshape_1:output:00cicada_v1_layernorm/mul_2/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
&cicada_v1_layernorm/add/ReadVariableOpReadVariableOp/cicada_v1_layernorm_add_readvariableop_resource*
_output_shapes	
:�*
dtype0�
cicada_v1_layernorm/addAddV2cicada_v1_layernorm/mul_2:z:0.cicada_v1_layernorm/add/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������Y
cicada_v1_dense_1/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :Y
cicada_v1_dense_1/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :�
cicada_v1_dense_1/PowPow cicada_v1_dense_1/Pow/x:output:0 cicada_v1_dense_1/Pow/y:output:0*
T0*
_output_shapes
: i
cicada_v1_dense_1/CastCastcicada_v1_dense_1/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: �
 cicada_v1_dense_1/ReadVariableOpReadVariableOp)cicada_v1_dense_1_readvariableop_resource*
_output_shapes
:	�*
dtype0\
cicada_v1_dense_1/mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   C�
cicada_v1_dense_1/mulMul(cicada_v1_dense_1/ReadVariableOp:value:0 cicada_v1_dense_1/mul/y:output:0*
T0*
_output_shapes
:	��
cicada_v1_dense_1/truedivRealDivcicada_v1_dense_1/mul:z:0cicada_v1_dense_1/Cast:y:0*
T0*
_output_shapes
:	�e
cicada_v1_dense_1/NegNegcicada_v1_dense_1/truediv:z:0*
T0*
_output_shapes
:	�i
cicada_v1_dense_1/RoundRoundcicada_v1_dense_1/truediv:z:0*
T0*
_output_shapes
:	��
cicada_v1_dense_1/addAddV2cicada_v1_dense_1/Neg:y:0cicada_v1_dense_1/Round:y:0*
T0*
_output_shapes
:	�s
cicada_v1_dense_1/StopGradientStopGradientcicada_v1_dense_1/add:z:0*
T0*
_output_shapes
:	��
cicada_v1_dense_1/add_1AddV2cicada_v1_dense_1/truediv:z:0'cicada_v1_dense_1/StopGradient:output:0*
T0*
_output_shapes
:	�n
)cicada_v1_dense_1/clip_by_value/Minimum/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �B�
'cicada_v1_dense_1/clip_by_value/MinimumMinimumcicada_v1_dense_1/add_1:z:02cicada_v1_dense_1/clip_by_value/Minimum/y:output:0*
T0*
_output_shapes
:	�f
!cicada_v1_dense_1/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ���
cicada_v1_dense_1/clip_by_valueMaximum+cicada_v1_dense_1/clip_by_value/Minimum:z:0*cicada_v1_dense_1/clip_by_value/y:output:0*
T0*
_output_shapes
:	��
cicada_v1_dense_1/mul_1Mulcicada_v1_dense_1/Cast:y:0#cicada_v1_dense_1/clip_by_value:z:0*
T0*
_output_shapes
:	�b
cicada_v1_dense_1/truediv_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   C�
cicada_v1_dense_1/truediv_1RealDivcicada_v1_dense_1/mul_1:z:0&cicada_v1_dense_1/truediv_1/y:output:0*
T0*
_output_shapes
:	�^
cicada_v1_dense_1/mul_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_dense_1/mul_2Mul"cicada_v1_dense_1/mul_2/x:output:0cicada_v1_dense_1/truediv_1:z:0*
T0*
_output_shapes
:	��
"cicada_v1_dense_1/ReadVariableOp_1ReadVariableOp)cicada_v1_dense_1_readvariableop_resource*
_output_shapes
:	�*
dtype0t
cicada_v1_dense_1/Neg_1Neg*cicada_v1_dense_1/ReadVariableOp_1:value:0*
T0*
_output_shapes
:	��
cicada_v1_dense_1/add_2AddV2cicada_v1_dense_1/Neg_1:y:0cicada_v1_dense_1/mul_2:z:0*
T0*
_output_shapes
:	�^
cicada_v1_dense_1/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_dense_1/mul_3Mul"cicada_v1_dense_1/mul_3/x:output:0cicada_v1_dense_1/add_2:z:0*
T0*
_output_shapes
:	�w
 cicada_v1_dense_1/StopGradient_1StopGradientcicada_v1_dense_1/mul_3:z:0*
T0*
_output_shapes
:	��
"cicada_v1_dense_1/ReadVariableOp_2ReadVariableOp)cicada_v1_dense_1_readvariableop_resource*
_output_shapes
:	�*
dtype0�
cicada_v1_dense_1/add_3AddV2*cicada_v1_dense_1/ReadVariableOp_2:value:0)cicada_v1_dense_1/StopGradient_1:output:0*
T0*
_output_shapes
:	��
cicada_v1_dense_1/MatMulMatMulcicada_v1_layernorm/add:z:0cicada_v1_dense_1/add_3:z:0*
T0*'
_output_shapes
:���������[
cicada_v1_dense_1/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :[
cicada_v1_dense_1/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :�
cicada_v1_dense_1/Pow_1Pow"cicada_v1_dense_1/Pow_1/x:output:0"cicada_v1_dense_1/Pow_1/y:output:0*
T0*
_output_shapes
: m
cicada_v1_dense_1/Cast_1Castcicada_v1_dense_1/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: �
"cicada_v1_dense_1/ReadVariableOp_3ReadVariableOp+cicada_v1_dense_1_readvariableop_3_resource*
_output_shapes
:*
dtype0^
cicada_v1_dense_1/mul_4/yConst*
_output_shapes
: *
dtype0*
valueB
 *   C�
cicada_v1_dense_1/mul_4Mul*cicada_v1_dense_1/ReadVariableOp_3:value:0"cicada_v1_dense_1/mul_4/y:output:0*
T0*
_output_shapes
:�
cicada_v1_dense_1/truediv_2RealDivcicada_v1_dense_1/mul_4:z:0cicada_v1_dense_1/Cast_1:y:0*
T0*
_output_shapes
:d
cicada_v1_dense_1/Neg_2Negcicada_v1_dense_1/truediv_2:z:0*
T0*
_output_shapes
:h
cicada_v1_dense_1/Round_1Roundcicada_v1_dense_1/truediv_2:z:0*
T0*
_output_shapes
:�
cicada_v1_dense_1/add_4AddV2cicada_v1_dense_1/Neg_2:y:0cicada_v1_dense_1/Round_1:y:0*
T0*
_output_shapes
:r
 cicada_v1_dense_1/StopGradient_2StopGradientcicada_v1_dense_1/add_4:z:0*
T0*
_output_shapes
:�
cicada_v1_dense_1/add_5AddV2cicada_v1_dense_1/truediv_2:z:0)cicada_v1_dense_1/StopGradient_2:output:0*
T0*
_output_shapes
:p
+cicada_v1_dense_1/clip_by_value_1/Minimum/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �B�
)cicada_v1_dense_1/clip_by_value_1/MinimumMinimumcicada_v1_dense_1/add_5:z:04cicada_v1_dense_1/clip_by_value_1/Minimum/y:output:0*
T0*
_output_shapes
:h
#cicada_v1_dense_1/clip_by_value_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ���
!cicada_v1_dense_1/clip_by_value_1Maximum-cicada_v1_dense_1/clip_by_value_1/Minimum:z:0,cicada_v1_dense_1/clip_by_value_1/y:output:0*
T0*
_output_shapes
:�
cicada_v1_dense_1/mul_5Mulcicada_v1_dense_1/Cast_1:y:0%cicada_v1_dense_1/clip_by_value_1:z:0*
T0*
_output_shapes
:b
cicada_v1_dense_1/truediv_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *   C�
cicada_v1_dense_1/truediv_3RealDivcicada_v1_dense_1/mul_5:z:0&cicada_v1_dense_1/truediv_3/y:output:0*
T0*
_output_shapes
:^
cicada_v1_dense_1/mul_6/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_dense_1/mul_6Mul"cicada_v1_dense_1/mul_6/x:output:0cicada_v1_dense_1/truediv_3:z:0*
T0*
_output_shapes
:�
"cicada_v1_dense_1/ReadVariableOp_4ReadVariableOp+cicada_v1_dense_1_readvariableop_3_resource*
_output_shapes
:*
dtype0o
cicada_v1_dense_1/Neg_3Neg*cicada_v1_dense_1/ReadVariableOp_4:value:0*
T0*
_output_shapes
:
cicada_v1_dense_1/add_6AddV2cicada_v1_dense_1/Neg_3:y:0cicada_v1_dense_1/mul_6:z:0*
T0*
_output_shapes
:^
cicada_v1_dense_1/mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_dense_1/mul_7Mul"cicada_v1_dense_1/mul_7/x:output:0cicada_v1_dense_1/add_6:z:0*
T0*
_output_shapes
:r
 cicada_v1_dense_1/StopGradient_3StopGradientcicada_v1_dense_1/mul_7:z:0*
T0*
_output_shapes
:�
"cicada_v1_dense_1/ReadVariableOp_5ReadVariableOp+cicada_v1_dense_1_readvariableop_3_resource*
_output_shapes
:*
dtype0�
cicada_v1_dense_1/add_7AddV2*cicada_v1_dense_1/ReadVariableOp_5:value:0)cicada_v1_dense_1/StopGradient_3:output:0*
T0*
_output_shapes
:�
cicada_v1_dense_1/BiasAddBiasAdd"cicada_v1_dense_1/MatMul:product:0cicada_v1_dense_1/add_7:z:0*
T0*'
_output_shapes
:���������^
cicada_v1_activation_1/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :^
cicada_v1_activation_1/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
�
cicada_v1_activation_1/PowPow%cicada_v1_activation_1/Pow/x:output:0%cicada_v1_activation_1/Pow/y:output:0*
T0*
_output_shapes
: s
cicada_v1_activation_1/CastCastcicada_v1_activation_1/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: `
cicada_v1_activation_1/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :`
cicada_v1_activation_1/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :�
cicada_v1_activation_1/Pow_1Pow'cicada_v1_activation_1/Pow_1/x:output:0'cicada_v1_activation_1/Pow_1/y:output:0*
T0*
_output_shapes
: w
cicada_v1_activation_1/Cast_1Cast cicada_v1_activation_1/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: a
cicada_v1_activation_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @a
cicada_v1_activation_1/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :
cicada_v1_activation_1/Cast_2Cast(cicada_v1_activation_1/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: a
cicada_v1_activation_1/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   A�
cicada_v1_activation_1/subSub!cicada_v1_activation_1/Cast_2:y:0%cicada_v1_activation_1/sub/y:output:0*
T0*
_output_shapes
: �
cicada_v1_activation_1/Pow_2Pow%cicada_v1_activation_1/Const:output:0cicada_v1_activation_1/sub:z:0*
T0*
_output_shapes
: �
cicada_v1_activation_1/sub_1Sub!cicada_v1_activation_1/Cast_1:y:0 cicada_v1_activation_1/Pow_2:z:0*
T0*
_output_shapes
: �
 cicada_v1_activation_1/LessEqual	LessEqual"cicada_v1_dense_1/BiasAdd:output:0 cicada_v1_activation_1/sub_1:z:0*
T0*'
_output_shapes
:���������y
cicada_v1_activation_1/ReluRelu"cicada_v1_dense_1/BiasAdd:output:0*
T0*'
_output_shapes
:����������
&cicada_v1_activation_1/ones_like/ShapeShape"cicada_v1_dense_1/BiasAdd:output:0*
T0*
_output_shapes
::��k
&cicada_v1_activation_1/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
 cicada_v1_activation_1/ones_likeFill/cicada_v1_activation_1/ones_like/Shape:output:0/cicada_v1_activation_1/ones_like/Const:output:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_1/sub_2Sub!cicada_v1_activation_1/Cast_1:y:0 cicada_v1_activation_1/Pow_2:z:0*
T0*
_output_shapes
: �
cicada_v1_activation_1/mulMul)cicada_v1_activation_1/ones_like:output:0 cicada_v1_activation_1/sub_2:z:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_1/SelectV2SelectV2$cicada_v1_activation_1/LessEqual:z:0)cicada_v1_activation_1/Relu:activations:0cicada_v1_activation_1/mul:z:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_1/mul_1Mul"cicada_v1_dense_1/BiasAdd:output:0cicada_v1_activation_1/Cast:y:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_1/truedivRealDiv cicada_v1_activation_1/mul_1:z:0!cicada_v1_activation_1/Cast_1:y:0*
T0*'
_output_shapes
:���������w
cicada_v1_activation_1/NegNeg"cicada_v1_activation_1/truediv:z:0*
T0*'
_output_shapes
:���������{
cicada_v1_activation_1/RoundRound"cicada_v1_activation_1/truediv:z:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_1/addAddV2cicada_v1_activation_1/Neg:y:0 cicada_v1_activation_1/Round:y:0*
T0*'
_output_shapes
:����������
#cicada_v1_activation_1/StopGradientStopGradientcicada_v1_activation_1/add:z:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_1/add_1AddV2"cicada_v1_activation_1/truediv:z:0,cicada_v1_activation_1/StopGradient:output:0*
T0*'
_output_shapes
:����������
 cicada_v1_activation_1/truediv_1RealDiv cicada_v1_activation_1/add_1:z:0cicada_v1_activation_1/Cast:y:0*
T0*'
_output_shapes
:���������g
"cicada_v1_activation_1/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
 cicada_v1_activation_1/truediv_2RealDiv+cicada_v1_activation_1/truediv_2/x:output:0cicada_v1_activation_1/Cast:y:0*
T0*
_output_shapes
: c
cicada_v1_activation_1/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_activation_1/sub_3Sub'cicada_v1_activation_1/sub_3/x:output:0$cicada_v1_activation_1/truediv_2:z:0*
T0*
_output_shapes
: �
,cicada_v1_activation_1/clip_by_value/MinimumMinimum$cicada_v1_activation_1/truediv_1:z:0 cicada_v1_activation_1/sub_3:z:0*
T0*'
_output_shapes
:���������k
&cicada_v1_activation_1/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    �
$cicada_v1_activation_1/clip_by_valueMaximum0cicada_v1_activation_1/clip_by_value/Minimum:z:0/cicada_v1_activation_1/clip_by_value/y:output:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_1/mul_2Mul!cicada_v1_activation_1/Cast_1:y:0(cicada_v1_activation_1/clip_by_value:z:0*
T0*'
_output_shapes
:���������
cicada_v1_activation_1/Neg_1Neg(cicada_v1_activation_1/SelectV2:output:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_1/add_2AddV2 cicada_v1_activation_1/Neg_1:y:0 cicada_v1_activation_1/mul_2:z:0*
T0*'
_output_shapes
:���������c
cicada_v1_activation_1/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_activation_1/mul_3Mul'cicada_v1_activation_1/mul_3/x:output:0 cicada_v1_activation_1/add_2:z:0*
T0*'
_output_shapes
:����������
%cicada_v1_activation_1/StopGradient_1StopGradient cicada_v1_activation_1/mul_3:z:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_1/add_3AddV2(cicada_v1_activation_1/SelectV2:output:0.cicada_v1_activation_1/StopGradient_1:output:0*
T0*'
_output_shapes
:���������y
cicada_v1_drop_1/IdentityIdentity cicada_v1_activation_1/add_3:z:0*
T0*'
_output_shapes
:���������Y
cicada_v1_dense_2/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :Y
cicada_v1_dense_2/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :�
cicada_v1_dense_2/PowPow cicada_v1_dense_2/Pow/x:output:0 cicada_v1_dense_2/Pow/y:output:0*
T0*
_output_shapes
: i
cicada_v1_dense_2/CastCastcicada_v1_dense_2/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: �
 cicada_v1_dense_2/ReadVariableOpReadVariableOp)cicada_v1_dense_2_readvariableop_resource*
_output_shapes

:*
dtype0\
cicada_v1_dense_2/mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   E�
cicada_v1_dense_2/mulMul(cicada_v1_dense_2/ReadVariableOp:value:0 cicada_v1_dense_2/mul/y:output:0*
T0*
_output_shapes

:�
cicada_v1_dense_2/truedivRealDivcicada_v1_dense_2/mul:z:0cicada_v1_dense_2/Cast:y:0*
T0*
_output_shapes

:d
cicada_v1_dense_2/NegNegcicada_v1_dense_2/truediv:z:0*
T0*
_output_shapes

:h
cicada_v1_dense_2/RoundRoundcicada_v1_dense_2/truediv:z:0*
T0*
_output_shapes

:
cicada_v1_dense_2/addAddV2cicada_v1_dense_2/Neg:y:0cicada_v1_dense_2/Round:y:0*
T0*
_output_shapes

:r
cicada_v1_dense_2/StopGradientStopGradientcicada_v1_dense_2/add:z:0*
T0*
_output_shapes

:�
cicada_v1_dense_2/add_1AddV2cicada_v1_dense_2/truediv:z:0'cicada_v1_dense_2/StopGradient:output:0*
T0*
_output_shapes

:n
)cicada_v1_dense_2/clip_by_value/Minimum/yConst*
_output_shapes
: *
dtype0*
valueB
 * ��D�
'cicada_v1_dense_2/clip_by_value/MinimumMinimumcicada_v1_dense_2/add_1:z:02cicada_v1_dense_2/clip_by_value/Minimum/y:output:0*
T0*
_output_shapes

:f
!cicada_v1_dense_2/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 * ����
cicada_v1_dense_2/clip_by_valueMaximum+cicada_v1_dense_2/clip_by_value/Minimum:z:0*cicada_v1_dense_2/clip_by_value/y:output:0*
T0*
_output_shapes

:�
cicada_v1_dense_2/mul_1Mulcicada_v1_dense_2/Cast:y:0#cicada_v1_dense_2/clip_by_value:z:0*
T0*
_output_shapes

:b
cicada_v1_dense_2/truediv_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   E�
cicada_v1_dense_2/truediv_1RealDivcicada_v1_dense_2/mul_1:z:0&cicada_v1_dense_2/truediv_1/y:output:0*
T0*
_output_shapes

:^
cicada_v1_dense_2/mul_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_dense_2/mul_2Mul"cicada_v1_dense_2/mul_2/x:output:0cicada_v1_dense_2/truediv_1:z:0*
T0*
_output_shapes

:�
"cicada_v1_dense_2/ReadVariableOp_1ReadVariableOp)cicada_v1_dense_2_readvariableop_resource*
_output_shapes

:*
dtype0s
cicada_v1_dense_2/Neg_1Neg*cicada_v1_dense_2/ReadVariableOp_1:value:0*
T0*
_output_shapes

:�
cicada_v1_dense_2/add_2AddV2cicada_v1_dense_2/Neg_1:y:0cicada_v1_dense_2/mul_2:z:0*
T0*
_output_shapes

:^
cicada_v1_dense_2/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_dense_2/mul_3Mul"cicada_v1_dense_2/mul_3/x:output:0cicada_v1_dense_2/add_2:z:0*
T0*
_output_shapes

:v
 cicada_v1_dense_2/StopGradient_1StopGradientcicada_v1_dense_2/mul_3:z:0*
T0*
_output_shapes

:�
"cicada_v1_dense_2/ReadVariableOp_2ReadVariableOp)cicada_v1_dense_2_readvariableop_resource*
_output_shapes

:*
dtype0�
cicada_v1_dense_2/add_3AddV2*cicada_v1_dense_2/ReadVariableOp_2:value:0)cicada_v1_dense_2/StopGradient_1:output:0*
T0*
_output_shapes

:�
cicada_v1_dense_2/MatMulMatMul"cicada_v1_drop_1/Identity:output:0cicada_v1_dense_2/add_3:z:0*
T0*'
_output_shapes
:���������^
cicada_v1_activation_2/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :^
cicada_v1_activation_2/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :�
cicada_v1_activation_2/PowPow%cicada_v1_activation_2/Pow/x:output:0%cicada_v1_activation_2/Pow/y:output:0*
T0*
_output_shapes
: s
cicada_v1_activation_2/CastCastcicada_v1_activation_2/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: `
cicada_v1_activation_2/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :`
cicada_v1_activation_2/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :�
cicada_v1_activation_2/Pow_1Pow'cicada_v1_activation_2/Pow_1/x:output:0'cicada_v1_activation_2/Pow_1/y:output:0*
T0*
_output_shapes
: w
cicada_v1_activation_2/Cast_1Cast cicada_v1_activation_2/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: a
cicada_v1_activation_2/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @a
cicada_v1_activation_2/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :
cicada_v1_activation_2/Cast_2Cast(cicada_v1_activation_2/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: a
cicada_v1_activation_2/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �A�
cicada_v1_activation_2/subSub!cicada_v1_activation_2/Cast_2:y:0%cicada_v1_activation_2/sub/y:output:0*
T0*
_output_shapes
: �
cicada_v1_activation_2/Pow_2Pow%cicada_v1_activation_2/Const:output:0cicada_v1_activation_2/sub:z:0*
T0*
_output_shapes
: �
cicada_v1_activation_2/sub_1Sub!cicada_v1_activation_2/Cast_1:y:0 cicada_v1_activation_2/Pow_2:z:0*
T0*
_output_shapes
: �
 cicada_v1_activation_2/LessEqual	LessEqual"cicada_v1_dense_2/MatMul:product:0 cicada_v1_activation_2/sub_1:z:0*
T0*'
_output_shapes
:���������y
cicada_v1_activation_2/ReluRelu"cicada_v1_dense_2/MatMul:product:0*
T0*'
_output_shapes
:����������
&cicada_v1_activation_2/ones_like/ShapeShape"cicada_v1_dense_2/MatMul:product:0*
T0*
_output_shapes
::��k
&cicada_v1_activation_2/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
 cicada_v1_activation_2/ones_likeFill/cicada_v1_activation_2/ones_like/Shape:output:0/cicada_v1_activation_2/ones_like/Const:output:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_2/sub_2Sub!cicada_v1_activation_2/Cast_1:y:0 cicada_v1_activation_2/Pow_2:z:0*
T0*
_output_shapes
: �
cicada_v1_activation_2/mulMul)cicada_v1_activation_2/ones_like:output:0 cicada_v1_activation_2/sub_2:z:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_2/SelectV2SelectV2$cicada_v1_activation_2/LessEqual:z:0)cicada_v1_activation_2/Relu:activations:0cicada_v1_activation_2/mul:z:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_2/mul_1Mul"cicada_v1_dense_2/MatMul:product:0cicada_v1_activation_2/Cast:y:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_2/truedivRealDiv cicada_v1_activation_2/mul_1:z:0!cicada_v1_activation_2/Cast_1:y:0*
T0*'
_output_shapes
:���������w
cicada_v1_activation_2/NegNeg"cicada_v1_activation_2/truediv:z:0*
T0*'
_output_shapes
:���������{
cicada_v1_activation_2/RoundRound"cicada_v1_activation_2/truediv:z:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_2/addAddV2cicada_v1_activation_2/Neg:y:0 cicada_v1_activation_2/Round:y:0*
T0*'
_output_shapes
:����������
#cicada_v1_activation_2/StopGradientStopGradientcicada_v1_activation_2/add:z:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_2/add_1AddV2"cicada_v1_activation_2/truediv:z:0,cicada_v1_activation_2/StopGradient:output:0*
T0*'
_output_shapes
:����������
 cicada_v1_activation_2/truediv_1RealDiv cicada_v1_activation_2/add_1:z:0cicada_v1_activation_2/Cast:y:0*
T0*'
_output_shapes
:���������g
"cicada_v1_activation_2/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
 cicada_v1_activation_2/truediv_2RealDiv+cicada_v1_activation_2/truediv_2/x:output:0cicada_v1_activation_2/Cast:y:0*
T0*
_output_shapes
: c
cicada_v1_activation_2/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_activation_2/sub_3Sub'cicada_v1_activation_2/sub_3/x:output:0$cicada_v1_activation_2/truediv_2:z:0*
T0*
_output_shapes
: �
,cicada_v1_activation_2/clip_by_value/MinimumMinimum$cicada_v1_activation_2/truediv_1:z:0 cicada_v1_activation_2/sub_3:z:0*
T0*'
_output_shapes
:���������k
&cicada_v1_activation_2/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    �
$cicada_v1_activation_2/clip_by_valueMaximum0cicada_v1_activation_2/clip_by_value/Minimum:z:0/cicada_v1_activation_2/clip_by_value/y:output:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_2/mul_2Mul!cicada_v1_activation_2/Cast_1:y:0(cicada_v1_activation_2/clip_by_value:z:0*
T0*'
_output_shapes
:���������
cicada_v1_activation_2/Neg_1Neg(cicada_v1_activation_2/SelectV2:output:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_2/add_2AddV2 cicada_v1_activation_2/Neg_1:y:0 cicada_v1_activation_2/mul_2:z:0*
T0*'
_output_shapes
:���������c
cicada_v1_activation_2/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_activation_2/mul_3Mul'cicada_v1_activation_2/mul_3/x:output:0 cicada_v1_activation_2/add_2:z:0*
T0*'
_output_shapes
:����������
%cicada_v1_activation_2/StopGradient_1StopGradient cicada_v1_activation_2/mul_3:z:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_2/add_3AddV2(cicada_v1_activation_2/SelectV2:output:0.cicada_v1_activation_2/StopGradient_1:output:0*
T0*'
_output_shapes
:���������o
IdentityIdentity cicada_v1_activation_2/add_3:z:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp!^cicada_v1_dense_1/ReadVariableOp#^cicada_v1_dense_1/ReadVariableOp_1#^cicada_v1_dense_1/ReadVariableOp_2#^cicada_v1_dense_1/ReadVariableOp_3#^cicada_v1_dense_1/ReadVariableOp_4#^cicada_v1_dense_1/ReadVariableOp_5!^cicada_v1_dense_2/ReadVariableOp#^cicada_v1_dense_2/ReadVariableOp_1#^cicada_v1_dense_2/ReadVariableOp_2'^cicada_v1_layernorm/add/ReadVariableOp)^cicada_v1_layernorm/mul_2/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:����������: : : : : 2D
 cicada_v1_dense_1/ReadVariableOp cicada_v1_dense_1/ReadVariableOp2H
"cicada_v1_dense_1/ReadVariableOp_1"cicada_v1_dense_1/ReadVariableOp_12H
"cicada_v1_dense_1/ReadVariableOp_2"cicada_v1_dense_1/ReadVariableOp_22H
"cicada_v1_dense_1/ReadVariableOp_3"cicada_v1_dense_1/ReadVariableOp_32H
"cicada_v1_dense_1/ReadVariableOp_4"cicada_v1_dense_1/ReadVariableOp_42H
"cicada_v1_dense_1/ReadVariableOp_5"cicada_v1_dense_1/ReadVariableOp_52D
 cicada_v1_dense_2/ReadVariableOp cicada_v1_dense_2/ReadVariableOp2H
"cicada_v1_dense_2/ReadVariableOp_1"cicada_v1_dense_2/ReadVariableOp_12H
"cicada_v1_dense_2/ReadVariableOp_2"cicada_v1_dense_2/ReadVariableOp_22P
&cicada_v1_layernorm/add/ReadVariableOp&cicada_v1_layernorm/add/ReadVariableOp2T
(cicada_v1_layernorm/mul_2/ReadVariableOp(cicada_v1_layernorm/mul_2/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
&__inference_signature_wrapper_18953576
cicada_v1_input
unknown:	�
	unknown_0:	�
	unknown_1:	�
	unknown_2:
	unknown_3:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallcicada_v1_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8� *,
f'R%
#__inference__wrapped_model_18953097o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:����������: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Y U
(
_output_shapes
:����������
)
_user_specified_namecicada_v1_input
Ƥ
�
#__inference__wrapped_model_18953097
cicada_v1_inputK
<sequential_cicada_v1_layernorm_mul_2_readvariableop_resource:	�I
:sequential_cicada_v1_layernorm_add_readvariableop_resource:	�G
4sequential_cicada_v1_dense_1_readvariableop_resource:	�D
6sequential_cicada_v1_dense_1_readvariableop_3_resource:F
4sequential_cicada_v1_dense_2_readvariableop_resource:
identity��+sequential/cicada_v1_dense_1/ReadVariableOp�-sequential/cicada_v1_dense_1/ReadVariableOp_1�-sequential/cicada_v1_dense_1/ReadVariableOp_2�-sequential/cicada_v1_dense_1/ReadVariableOp_3�-sequential/cicada_v1_dense_1/ReadVariableOp_4�-sequential/cicada_v1_dense_1/ReadVariableOp_5�+sequential/cicada_v1_dense_2/ReadVariableOp�-sequential/cicada_v1_dense_2/ReadVariableOp_1�-sequential/cicada_v1_dense_2/ReadVariableOp_2�1sequential/cicada_v1_layernorm/add/ReadVariableOp�3sequential/cicada_v1_layernorm/mul_2/ReadVariableOpq
$sequential/cicada_v1_layernorm/ShapeShapecicada_v1_input*
T0*
_output_shapes
::��|
2sequential/cicada_v1_layernorm/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: ~
4sequential/cicada_v1_layernorm/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:~
4sequential/cicada_v1_layernorm/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
,sequential/cicada_v1_layernorm/strided_sliceStridedSlice-sequential/cicada_v1_layernorm/Shape:output:0;sequential/cicada_v1_layernorm/strided_slice/stack:output:0=sequential/cicada_v1_layernorm/strided_slice/stack_1:output:0=sequential/cicada_v1_layernorm/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
$sequential/cicada_v1_layernorm/mul/xConst*
_output_shapes
: *
dtype0*
value	B :�
"sequential/cicada_v1_layernorm/mulMul-sequential/cicada_v1_layernorm/mul/x:output:05sequential/cicada_v1_layernorm/strided_slice:output:0*
T0*
_output_shapes
: ~
4sequential/cicada_v1_layernorm/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:�
6sequential/cicada_v1_layernorm/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:�
6sequential/cicada_v1_layernorm/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
.sequential/cicada_v1_layernorm/strided_slice_1StridedSlice-sequential/cicada_v1_layernorm/Shape:output:0=sequential/cicada_v1_layernorm/strided_slice_1/stack:output:0?sequential/cicada_v1_layernorm/strided_slice_1/stack_1:output:0?sequential/cicada_v1_layernorm/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskh
&sequential/cicada_v1_layernorm/mul_1/xConst*
_output_shapes
: *
dtype0*
value	B :�
$sequential/cicada_v1_layernorm/mul_1Mul/sequential/cicada_v1_layernorm/mul_1/x:output:07sequential/cicada_v1_layernorm/strided_slice_1:output:0*
T0*
_output_shapes
: p
.sequential/cicada_v1_layernorm/Reshape/shape/0Const*
_output_shapes
: *
dtype0*
value	B :p
.sequential/cicada_v1_layernorm/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :�
,sequential/cicada_v1_layernorm/Reshape/shapePack7sequential/cicada_v1_layernorm/Reshape/shape/0:output:0&sequential/cicada_v1_layernorm/mul:z:0(sequential/cicada_v1_layernorm/mul_1:z:07sequential/cicada_v1_layernorm/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:�
&sequential/cicada_v1_layernorm/ReshapeReshapecicada_v1_input5sequential/cicada_v1_layernorm/Reshape/shape:output:0*
T0*0
_output_shapes
:�����������
*sequential/cicada_v1_layernorm/ones/packedPack&sequential/cicada_v1_layernorm/mul:z:0*
N*
T0*
_output_shapes
:n
)sequential/cicada_v1_layernorm/ones/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
#sequential/cicada_v1_layernorm/onesFill3sequential/cicada_v1_layernorm/ones/packed:output:02sequential/cicada_v1_layernorm/ones/Const:output:0*
T0*#
_output_shapes
:����������
+sequential/cicada_v1_layernorm/zeros/packedPack&sequential/cicada_v1_layernorm/mul:z:0*
N*
T0*
_output_shapes
:o
*sequential/cicada_v1_layernorm/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    �
$sequential/cicada_v1_layernorm/zerosFill4sequential/cicada_v1_layernorm/zeros/packed:output:03sequential/cicada_v1_layernorm/zeros/Const:output:0*
T0*#
_output_shapes
:���������g
$sequential/cicada_v1_layernorm/ConstConst*
_output_shapes
: *
dtype0*
valueB i
&sequential/cicada_v1_layernorm/Const_1Const*
_output_shapes
: *
dtype0*
valueB �
/sequential/cicada_v1_layernorm/FusedBatchNormV3FusedBatchNormV3/sequential/cicada_v1_layernorm/Reshape:output:0,sequential/cicada_v1_layernorm/ones:output:0-sequential/cicada_v1_layernorm/zeros:output:0-sequential/cicada_v1_layernorm/Const:output:0/sequential/cicada_v1_layernorm/Const_1:output:0*
T0*
U0*p
_output_shapes^
\:����������:���������:���������:���������:���������:*
data_formatNCHW*
epsilon%o�:�
(sequential/cicada_v1_layernorm/Reshape_1Reshape3sequential/cicada_v1_layernorm/FusedBatchNormV3:y:0-sequential/cicada_v1_layernorm/Shape:output:0*
T0*(
_output_shapes
:�����������
3sequential/cicada_v1_layernorm/mul_2/ReadVariableOpReadVariableOp<sequential_cicada_v1_layernorm_mul_2_readvariableop_resource*
_output_shapes	
:�*
dtype0�
$sequential/cicada_v1_layernorm/mul_2Mul1sequential/cicada_v1_layernorm/Reshape_1:output:0;sequential/cicada_v1_layernorm/mul_2/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
1sequential/cicada_v1_layernorm/add/ReadVariableOpReadVariableOp:sequential_cicada_v1_layernorm_add_readvariableop_resource*
_output_shapes	
:�*
dtype0�
"sequential/cicada_v1_layernorm/addAddV2(sequential/cicada_v1_layernorm/mul_2:z:09sequential/cicada_v1_layernorm/add/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������d
"sequential/cicada_v1_dense_1/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :d
"sequential/cicada_v1_dense_1/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :�
 sequential/cicada_v1_dense_1/PowPow+sequential/cicada_v1_dense_1/Pow/x:output:0+sequential/cicada_v1_dense_1/Pow/y:output:0*
T0*
_output_shapes
: 
!sequential/cicada_v1_dense_1/CastCast$sequential/cicada_v1_dense_1/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: �
+sequential/cicada_v1_dense_1/ReadVariableOpReadVariableOp4sequential_cicada_v1_dense_1_readvariableop_resource*
_output_shapes
:	�*
dtype0g
"sequential/cicada_v1_dense_1/mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   C�
 sequential/cicada_v1_dense_1/mulMul3sequential/cicada_v1_dense_1/ReadVariableOp:value:0+sequential/cicada_v1_dense_1/mul/y:output:0*
T0*
_output_shapes
:	��
$sequential/cicada_v1_dense_1/truedivRealDiv$sequential/cicada_v1_dense_1/mul:z:0%sequential/cicada_v1_dense_1/Cast:y:0*
T0*
_output_shapes
:	�{
 sequential/cicada_v1_dense_1/NegNeg(sequential/cicada_v1_dense_1/truediv:z:0*
T0*
_output_shapes
:	�
"sequential/cicada_v1_dense_1/RoundRound(sequential/cicada_v1_dense_1/truediv:z:0*
T0*
_output_shapes
:	��
 sequential/cicada_v1_dense_1/addAddV2$sequential/cicada_v1_dense_1/Neg:y:0&sequential/cicada_v1_dense_1/Round:y:0*
T0*
_output_shapes
:	��
)sequential/cicada_v1_dense_1/StopGradientStopGradient$sequential/cicada_v1_dense_1/add:z:0*
T0*
_output_shapes
:	��
"sequential/cicada_v1_dense_1/add_1AddV2(sequential/cicada_v1_dense_1/truediv:z:02sequential/cicada_v1_dense_1/StopGradient:output:0*
T0*
_output_shapes
:	�y
4sequential/cicada_v1_dense_1/clip_by_value/Minimum/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �B�
2sequential/cicada_v1_dense_1/clip_by_value/MinimumMinimum&sequential/cicada_v1_dense_1/add_1:z:0=sequential/cicada_v1_dense_1/clip_by_value/Minimum/y:output:0*
T0*
_output_shapes
:	�q
,sequential/cicada_v1_dense_1/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ���
*sequential/cicada_v1_dense_1/clip_by_valueMaximum6sequential/cicada_v1_dense_1/clip_by_value/Minimum:z:05sequential/cicada_v1_dense_1/clip_by_value/y:output:0*
T0*
_output_shapes
:	��
"sequential/cicada_v1_dense_1/mul_1Mul%sequential/cicada_v1_dense_1/Cast:y:0.sequential/cicada_v1_dense_1/clip_by_value:z:0*
T0*
_output_shapes
:	�m
(sequential/cicada_v1_dense_1/truediv_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   C�
&sequential/cicada_v1_dense_1/truediv_1RealDiv&sequential/cicada_v1_dense_1/mul_1:z:01sequential/cicada_v1_dense_1/truediv_1/y:output:0*
T0*
_output_shapes
:	�i
$sequential/cicada_v1_dense_1/mul_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
"sequential/cicada_v1_dense_1/mul_2Mul-sequential/cicada_v1_dense_1/mul_2/x:output:0*sequential/cicada_v1_dense_1/truediv_1:z:0*
T0*
_output_shapes
:	��
-sequential/cicada_v1_dense_1/ReadVariableOp_1ReadVariableOp4sequential_cicada_v1_dense_1_readvariableop_resource*
_output_shapes
:	�*
dtype0�
"sequential/cicada_v1_dense_1/Neg_1Neg5sequential/cicada_v1_dense_1/ReadVariableOp_1:value:0*
T0*
_output_shapes
:	��
"sequential/cicada_v1_dense_1/add_2AddV2&sequential/cicada_v1_dense_1/Neg_1:y:0&sequential/cicada_v1_dense_1/mul_2:z:0*
T0*
_output_shapes
:	�i
$sequential/cicada_v1_dense_1/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
"sequential/cicada_v1_dense_1/mul_3Mul-sequential/cicada_v1_dense_1/mul_3/x:output:0&sequential/cicada_v1_dense_1/add_2:z:0*
T0*
_output_shapes
:	��
+sequential/cicada_v1_dense_1/StopGradient_1StopGradient&sequential/cicada_v1_dense_1/mul_3:z:0*
T0*
_output_shapes
:	��
-sequential/cicada_v1_dense_1/ReadVariableOp_2ReadVariableOp4sequential_cicada_v1_dense_1_readvariableop_resource*
_output_shapes
:	�*
dtype0�
"sequential/cicada_v1_dense_1/add_3AddV25sequential/cicada_v1_dense_1/ReadVariableOp_2:value:04sequential/cicada_v1_dense_1/StopGradient_1:output:0*
T0*
_output_shapes
:	��
#sequential/cicada_v1_dense_1/MatMulMatMul&sequential/cicada_v1_layernorm/add:z:0&sequential/cicada_v1_dense_1/add_3:z:0*
T0*'
_output_shapes
:���������f
$sequential/cicada_v1_dense_1/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :f
$sequential/cicada_v1_dense_1/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :�
"sequential/cicada_v1_dense_1/Pow_1Pow-sequential/cicada_v1_dense_1/Pow_1/x:output:0-sequential/cicada_v1_dense_1/Pow_1/y:output:0*
T0*
_output_shapes
: �
#sequential/cicada_v1_dense_1/Cast_1Cast&sequential/cicada_v1_dense_1/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: �
-sequential/cicada_v1_dense_1/ReadVariableOp_3ReadVariableOp6sequential_cicada_v1_dense_1_readvariableop_3_resource*
_output_shapes
:*
dtype0i
$sequential/cicada_v1_dense_1/mul_4/yConst*
_output_shapes
: *
dtype0*
valueB
 *   C�
"sequential/cicada_v1_dense_1/mul_4Mul5sequential/cicada_v1_dense_1/ReadVariableOp_3:value:0-sequential/cicada_v1_dense_1/mul_4/y:output:0*
T0*
_output_shapes
:�
&sequential/cicada_v1_dense_1/truediv_2RealDiv&sequential/cicada_v1_dense_1/mul_4:z:0'sequential/cicada_v1_dense_1/Cast_1:y:0*
T0*
_output_shapes
:z
"sequential/cicada_v1_dense_1/Neg_2Neg*sequential/cicada_v1_dense_1/truediv_2:z:0*
T0*
_output_shapes
:~
$sequential/cicada_v1_dense_1/Round_1Round*sequential/cicada_v1_dense_1/truediv_2:z:0*
T0*
_output_shapes
:�
"sequential/cicada_v1_dense_1/add_4AddV2&sequential/cicada_v1_dense_1/Neg_2:y:0(sequential/cicada_v1_dense_1/Round_1:y:0*
T0*
_output_shapes
:�
+sequential/cicada_v1_dense_1/StopGradient_2StopGradient&sequential/cicada_v1_dense_1/add_4:z:0*
T0*
_output_shapes
:�
"sequential/cicada_v1_dense_1/add_5AddV2*sequential/cicada_v1_dense_1/truediv_2:z:04sequential/cicada_v1_dense_1/StopGradient_2:output:0*
T0*
_output_shapes
:{
6sequential/cicada_v1_dense_1/clip_by_value_1/Minimum/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �B�
4sequential/cicada_v1_dense_1/clip_by_value_1/MinimumMinimum&sequential/cicada_v1_dense_1/add_5:z:0?sequential/cicada_v1_dense_1/clip_by_value_1/Minimum/y:output:0*
T0*
_output_shapes
:s
.sequential/cicada_v1_dense_1/clip_by_value_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ���
,sequential/cicada_v1_dense_1/clip_by_value_1Maximum8sequential/cicada_v1_dense_1/clip_by_value_1/Minimum:z:07sequential/cicada_v1_dense_1/clip_by_value_1/y:output:0*
T0*
_output_shapes
:�
"sequential/cicada_v1_dense_1/mul_5Mul'sequential/cicada_v1_dense_1/Cast_1:y:00sequential/cicada_v1_dense_1/clip_by_value_1:z:0*
T0*
_output_shapes
:m
(sequential/cicada_v1_dense_1/truediv_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *   C�
&sequential/cicada_v1_dense_1/truediv_3RealDiv&sequential/cicada_v1_dense_1/mul_5:z:01sequential/cicada_v1_dense_1/truediv_3/y:output:0*
T0*
_output_shapes
:i
$sequential/cicada_v1_dense_1/mul_6/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
"sequential/cicada_v1_dense_1/mul_6Mul-sequential/cicada_v1_dense_1/mul_6/x:output:0*sequential/cicada_v1_dense_1/truediv_3:z:0*
T0*
_output_shapes
:�
-sequential/cicada_v1_dense_1/ReadVariableOp_4ReadVariableOp6sequential_cicada_v1_dense_1_readvariableop_3_resource*
_output_shapes
:*
dtype0�
"sequential/cicada_v1_dense_1/Neg_3Neg5sequential/cicada_v1_dense_1/ReadVariableOp_4:value:0*
T0*
_output_shapes
:�
"sequential/cicada_v1_dense_1/add_6AddV2&sequential/cicada_v1_dense_1/Neg_3:y:0&sequential/cicada_v1_dense_1/mul_6:z:0*
T0*
_output_shapes
:i
$sequential/cicada_v1_dense_1/mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
"sequential/cicada_v1_dense_1/mul_7Mul-sequential/cicada_v1_dense_1/mul_7/x:output:0&sequential/cicada_v1_dense_1/add_6:z:0*
T0*
_output_shapes
:�
+sequential/cicada_v1_dense_1/StopGradient_3StopGradient&sequential/cicada_v1_dense_1/mul_7:z:0*
T0*
_output_shapes
:�
-sequential/cicada_v1_dense_1/ReadVariableOp_5ReadVariableOp6sequential_cicada_v1_dense_1_readvariableop_3_resource*
_output_shapes
:*
dtype0�
"sequential/cicada_v1_dense_1/add_7AddV25sequential/cicada_v1_dense_1/ReadVariableOp_5:value:04sequential/cicada_v1_dense_1/StopGradient_3:output:0*
T0*
_output_shapes
:�
$sequential/cicada_v1_dense_1/BiasAddBiasAdd-sequential/cicada_v1_dense_1/MatMul:product:0&sequential/cicada_v1_dense_1/add_7:z:0*
T0*'
_output_shapes
:���������i
'sequential/cicada_v1_activation_1/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :i
'sequential/cicada_v1_activation_1/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
�
%sequential/cicada_v1_activation_1/PowPow0sequential/cicada_v1_activation_1/Pow/x:output:00sequential/cicada_v1_activation_1/Pow/y:output:0*
T0*
_output_shapes
: �
&sequential/cicada_v1_activation_1/CastCast)sequential/cicada_v1_activation_1/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: k
)sequential/cicada_v1_activation_1/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :k
)sequential/cicada_v1_activation_1/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :�
'sequential/cicada_v1_activation_1/Pow_1Pow2sequential/cicada_v1_activation_1/Pow_1/x:output:02sequential/cicada_v1_activation_1/Pow_1/y:output:0*
T0*
_output_shapes
: �
(sequential/cicada_v1_activation_1/Cast_1Cast+sequential/cicada_v1_activation_1/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: l
'sequential/cicada_v1_activation_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @l
*sequential/cicada_v1_activation_1/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :�
(sequential/cicada_v1_activation_1/Cast_2Cast3sequential/cicada_v1_activation_1/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: l
'sequential/cicada_v1_activation_1/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   A�
%sequential/cicada_v1_activation_1/subSub,sequential/cicada_v1_activation_1/Cast_2:y:00sequential/cicada_v1_activation_1/sub/y:output:0*
T0*
_output_shapes
: �
'sequential/cicada_v1_activation_1/Pow_2Pow0sequential/cicada_v1_activation_1/Const:output:0)sequential/cicada_v1_activation_1/sub:z:0*
T0*
_output_shapes
: �
'sequential/cicada_v1_activation_1/sub_1Sub,sequential/cicada_v1_activation_1/Cast_1:y:0+sequential/cicada_v1_activation_1/Pow_2:z:0*
T0*
_output_shapes
: �
+sequential/cicada_v1_activation_1/LessEqual	LessEqual-sequential/cicada_v1_dense_1/BiasAdd:output:0+sequential/cicada_v1_activation_1/sub_1:z:0*
T0*'
_output_shapes
:����������
&sequential/cicada_v1_activation_1/ReluRelu-sequential/cicada_v1_dense_1/BiasAdd:output:0*
T0*'
_output_shapes
:����������
1sequential/cicada_v1_activation_1/ones_like/ShapeShape-sequential/cicada_v1_dense_1/BiasAdd:output:0*
T0*
_output_shapes
::��v
1sequential/cicada_v1_activation_1/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
+sequential/cicada_v1_activation_1/ones_likeFill:sequential/cicada_v1_activation_1/ones_like/Shape:output:0:sequential/cicada_v1_activation_1/ones_like/Const:output:0*
T0*'
_output_shapes
:����������
'sequential/cicada_v1_activation_1/sub_2Sub,sequential/cicada_v1_activation_1/Cast_1:y:0+sequential/cicada_v1_activation_1/Pow_2:z:0*
T0*
_output_shapes
: �
%sequential/cicada_v1_activation_1/mulMul4sequential/cicada_v1_activation_1/ones_like:output:0+sequential/cicada_v1_activation_1/sub_2:z:0*
T0*'
_output_shapes
:����������
*sequential/cicada_v1_activation_1/SelectV2SelectV2/sequential/cicada_v1_activation_1/LessEqual:z:04sequential/cicada_v1_activation_1/Relu:activations:0)sequential/cicada_v1_activation_1/mul:z:0*
T0*'
_output_shapes
:����������
'sequential/cicada_v1_activation_1/mul_1Mul-sequential/cicada_v1_dense_1/BiasAdd:output:0*sequential/cicada_v1_activation_1/Cast:y:0*
T0*'
_output_shapes
:����������
)sequential/cicada_v1_activation_1/truedivRealDiv+sequential/cicada_v1_activation_1/mul_1:z:0,sequential/cicada_v1_activation_1/Cast_1:y:0*
T0*'
_output_shapes
:����������
%sequential/cicada_v1_activation_1/NegNeg-sequential/cicada_v1_activation_1/truediv:z:0*
T0*'
_output_shapes
:����������
'sequential/cicada_v1_activation_1/RoundRound-sequential/cicada_v1_activation_1/truediv:z:0*
T0*'
_output_shapes
:����������
%sequential/cicada_v1_activation_1/addAddV2)sequential/cicada_v1_activation_1/Neg:y:0+sequential/cicada_v1_activation_1/Round:y:0*
T0*'
_output_shapes
:����������
.sequential/cicada_v1_activation_1/StopGradientStopGradient)sequential/cicada_v1_activation_1/add:z:0*
T0*'
_output_shapes
:����������
'sequential/cicada_v1_activation_1/add_1AddV2-sequential/cicada_v1_activation_1/truediv:z:07sequential/cicada_v1_activation_1/StopGradient:output:0*
T0*'
_output_shapes
:����������
+sequential/cicada_v1_activation_1/truediv_1RealDiv+sequential/cicada_v1_activation_1/add_1:z:0*sequential/cicada_v1_activation_1/Cast:y:0*
T0*'
_output_shapes
:���������r
-sequential/cicada_v1_activation_1/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
+sequential/cicada_v1_activation_1/truediv_2RealDiv6sequential/cicada_v1_activation_1/truediv_2/x:output:0*sequential/cicada_v1_activation_1/Cast:y:0*
T0*
_output_shapes
: n
)sequential/cicada_v1_activation_1/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
'sequential/cicada_v1_activation_1/sub_3Sub2sequential/cicada_v1_activation_1/sub_3/x:output:0/sequential/cicada_v1_activation_1/truediv_2:z:0*
T0*
_output_shapes
: �
7sequential/cicada_v1_activation_1/clip_by_value/MinimumMinimum/sequential/cicada_v1_activation_1/truediv_1:z:0+sequential/cicada_v1_activation_1/sub_3:z:0*
T0*'
_output_shapes
:���������v
1sequential/cicada_v1_activation_1/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    �
/sequential/cicada_v1_activation_1/clip_by_valueMaximum;sequential/cicada_v1_activation_1/clip_by_value/Minimum:z:0:sequential/cicada_v1_activation_1/clip_by_value/y:output:0*
T0*'
_output_shapes
:����������
'sequential/cicada_v1_activation_1/mul_2Mul,sequential/cicada_v1_activation_1/Cast_1:y:03sequential/cicada_v1_activation_1/clip_by_value:z:0*
T0*'
_output_shapes
:����������
'sequential/cicada_v1_activation_1/Neg_1Neg3sequential/cicada_v1_activation_1/SelectV2:output:0*
T0*'
_output_shapes
:����������
'sequential/cicada_v1_activation_1/add_2AddV2+sequential/cicada_v1_activation_1/Neg_1:y:0+sequential/cicada_v1_activation_1/mul_2:z:0*
T0*'
_output_shapes
:���������n
)sequential/cicada_v1_activation_1/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
'sequential/cicada_v1_activation_1/mul_3Mul2sequential/cicada_v1_activation_1/mul_3/x:output:0+sequential/cicada_v1_activation_1/add_2:z:0*
T0*'
_output_shapes
:����������
0sequential/cicada_v1_activation_1/StopGradient_1StopGradient+sequential/cicada_v1_activation_1/mul_3:z:0*
T0*'
_output_shapes
:����������
'sequential/cicada_v1_activation_1/add_3AddV23sequential/cicada_v1_activation_1/SelectV2:output:09sequential/cicada_v1_activation_1/StopGradient_1:output:0*
T0*'
_output_shapes
:����������
$sequential/cicada_v1_drop_1/IdentityIdentity+sequential/cicada_v1_activation_1/add_3:z:0*
T0*'
_output_shapes
:���������d
"sequential/cicada_v1_dense_2/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :d
"sequential/cicada_v1_dense_2/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :�
 sequential/cicada_v1_dense_2/PowPow+sequential/cicada_v1_dense_2/Pow/x:output:0+sequential/cicada_v1_dense_2/Pow/y:output:0*
T0*
_output_shapes
: 
!sequential/cicada_v1_dense_2/CastCast$sequential/cicada_v1_dense_2/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: �
+sequential/cicada_v1_dense_2/ReadVariableOpReadVariableOp4sequential_cicada_v1_dense_2_readvariableop_resource*
_output_shapes

:*
dtype0g
"sequential/cicada_v1_dense_2/mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   E�
 sequential/cicada_v1_dense_2/mulMul3sequential/cicada_v1_dense_2/ReadVariableOp:value:0+sequential/cicada_v1_dense_2/mul/y:output:0*
T0*
_output_shapes

:�
$sequential/cicada_v1_dense_2/truedivRealDiv$sequential/cicada_v1_dense_2/mul:z:0%sequential/cicada_v1_dense_2/Cast:y:0*
T0*
_output_shapes

:z
 sequential/cicada_v1_dense_2/NegNeg(sequential/cicada_v1_dense_2/truediv:z:0*
T0*
_output_shapes

:~
"sequential/cicada_v1_dense_2/RoundRound(sequential/cicada_v1_dense_2/truediv:z:0*
T0*
_output_shapes

:�
 sequential/cicada_v1_dense_2/addAddV2$sequential/cicada_v1_dense_2/Neg:y:0&sequential/cicada_v1_dense_2/Round:y:0*
T0*
_output_shapes

:�
)sequential/cicada_v1_dense_2/StopGradientStopGradient$sequential/cicada_v1_dense_2/add:z:0*
T0*
_output_shapes

:�
"sequential/cicada_v1_dense_2/add_1AddV2(sequential/cicada_v1_dense_2/truediv:z:02sequential/cicada_v1_dense_2/StopGradient:output:0*
T0*
_output_shapes

:y
4sequential/cicada_v1_dense_2/clip_by_value/Minimum/yConst*
_output_shapes
: *
dtype0*
valueB
 * ��D�
2sequential/cicada_v1_dense_2/clip_by_value/MinimumMinimum&sequential/cicada_v1_dense_2/add_1:z:0=sequential/cicada_v1_dense_2/clip_by_value/Minimum/y:output:0*
T0*
_output_shapes

:q
,sequential/cicada_v1_dense_2/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 * ����
*sequential/cicada_v1_dense_2/clip_by_valueMaximum6sequential/cicada_v1_dense_2/clip_by_value/Minimum:z:05sequential/cicada_v1_dense_2/clip_by_value/y:output:0*
T0*
_output_shapes

:�
"sequential/cicada_v1_dense_2/mul_1Mul%sequential/cicada_v1_dense_2/Cast:y:0.sequential/cicada_v1_dense_2/clip_by_value:z:0*
T0*
_output_shapes

:m
(sequential/cicada_v1_dense_2/truediv_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   E�
&sequential/cicada_v1_dense_2/truediv_1RealDiv&sequential/cicada_v1_dense_2/mul_1:z:01sequential/cicada_v1_dense_2/truediv_1/y:output:0*
T0*
_output_shapes

:i
$sequential/cicada_v1_dense_2/mul_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
"sequential/cicada_v1_dense_2/mul_2Mul-sequential/cicada_v1_dense_2/mul_2/x:output:0*sequential/cicada_v1_dense_2/truediv_1:z:0*
T0*
_output_shapes

:�
-sequential/cicada_v1_dense_2/ReadVariableOp_1ReadVariableOp4sequential_cicada_v1_dense_2_readvariableop_resource*
_output_shapes

:*
dtype0�
"sequential/cicada_v1_dense_2/Neg_1Neg5sequential/cicada_v1_dense_2/ReadVariableOp_1:value:0*
T0*
_output_shapes

:�
"sequential/cicada_v1_dense_2/add_2AddV2&sequential/cicada_v1_dense_2/Neg_1:y:0&sequential/cicada_v1_dense_2/mul_2:z:0*
T0*
_output_shapes

:i
$sequential/cicada_v1_dense_2/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
"sequential/cicada_v1_dense_2/mul_3Mul-sequential/cicada_v1_dense_2/mul_3/x:output:0&sequential/cicada_v1_dense_2/add_2:z:0*
T0*
_output_shapes

:�
+sequential/cicada_v1_dense_2/StopGradient_1StopGradient&sequential/cicada_v1_dense_2/mul_3:z:0*
T0*
_output_shapes

:�
-sequential/cicada_v1_dense_2/ReadVariableOp_2ReadVariableOp4sequential_cicada_v1_dense_2_readvariableop_resource*
_output_shapes

:*
dtype0�
"sequential/cicada_v1_dense_2/add_3AddV25sequential/cicada_v1_dense_2/ReadVariableOp_2:value:04sequential/cicada_v1_dense_2/StopGradient_1:output:0*
T0*
_output_shapes

:�
#sequential/cicada_v1_dense_2/MatMulMatMul-sequential/cicada_v1_drop_1/Identity:output:0&sequential/cicada_v1_dense_2/add_3:z:0*
T0*'
_output_shapes
:���������i
'sequential/cicada_v1_activation_2/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :i
'sequential/cicada_v1_activation_2/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :�
%sequential/cicada_v1_activation_2/PowPow0sequential/cicada_v1_activation_2/Pow/x:output:00sequential/cicada_v1_activation_2/Pow/y:output:0*
T0*
_output_shapes
: �
&sequential/cicada_v1_activation_2/CastCast)sequential/cicada_v1_activation_2/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: k
)sequential/cicada_v1_activation_2/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :k
)sequential/cicada_v1_activation_2/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :�
'sequential/cicada_v1_activation_2/Pow_1Pow2sequential/cicada_v1_activation_2/Pow_1/x:output:02sequential/cicada_v1_activation_2/Pow_1/y:output:0*
T0*
_output_shapes
: �
(sequential/cicada_v1_activation_2/Cast_1Cast+sequential/cicada_v1_activation_2/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: l
'sequential/cicada_v1_activation_2/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @l
*sequential/cicada_v1_activation_2/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :�
(sequential/cicada_v1_activation_2/Cast_2Cast3sequential/cicada_v1_activation_2/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: l
'sequential/cicada_v1_activation_2/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �A�
%sequential/cicada_v1_activation_2/subSub,sequential/cicada_v1_activation_2/Cast_2:y:00sequential/cicada_v1_activation_2/sub/y:output:0*
T0*
_output_shapes
: �
'sequential/cicada_v1_activation_2/Pow_2Pow0sequential/cicada_v1_activation_2/Const:output:0)sequential/cicada_v1_activation_2/sub:z:0*
T0*
_output_shapes
: �
'sequential/cicada_v1_activation_2/sub_1Sub,sequential/cicada_v1_activation_2/Cast_1:y:0+sequential/cicada_v1_activation_2/Pow_2:z:0*
T0*
_output_shapes
: �
+sequential/cicada_v1_activation_2/LessEqual	LessEqual-sequential/cicada_v1_dense_2/MatMul:product:0+sequential/cicada_v1_activation_2/sub_1:z:0*
T0*'
_output_shapes
:����������
&sequential/cicada_v1_activation_2/ReluRelu-sequential/cicada_v1_dense_2/MatMul:product:0*
T0*'
_output_shapes
:����������
1sequential/cicada_v1_activation_2/ones_like/ShapeShape-sequential/cicada_v1_dense_2/MatMul:product:0*
T0*
_output_shapes
::��v
1sequential/cicada_v1_activation_2/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
+sequential/cicada_v1_activation_2/ones_likeFill:sequential/cicada_v1_activation_2/ones_like/Shape:output:0:sequential/cicada_v1_activation_2/ones_like/Const:output:0*
T0*'
_output_shapes
:����������
'sequential/cicada_v1_activation_2/sub_2Sub,sequential/cicada_v1_activation_2/Cast_1:y:0+sequential/cicada_v1_activation_2/Pow_2:z:0*
T0*
_output_shapes
: �
%sequential/cicada_v1_activation_2/mulMul4sequential/cicada_v1_activation_2/ones_like:output:0+sequential/cicada_v1_activation_2/sub_2:z:0*
T0*'
_output_shapes
:����������
*sequential/cicada_v1_activation_2/SelectV2SelectV2/sequential/cicada_v1_activation_2/LessEqual:z:04sequential/cicada_v1_activation_2/Relu:activations:0)sequential/cicada_v1_activation_2/mul:z:0*
T0*'
_output_shapes
:����������
'sequential/cicada_v1_activation_2/mul_1Mul-sequential/cicada_v1_dense_2/MatMul:product:0*sequential/cicada_v1_activation_2/Cast:y:0*
T0*'
_output_shapes
:����������
)sequential/cicada_v1_activation_2/truedivRealDiv+sequential/cicada_v1_activation_2/mul_1:z:0,sequential/cicada_v1_activation_2/Cast_1:y:0*
T0*'
_output_shapes
:����������
%sequential/cicada_v1_activation_2/NegNeg-sequential/cicada_v1_activation_2/truediv:z:0*
T0*'
_output_shapes
:����������
'sequential/cicada_v1_activation_2/RoundRound-sequential/cicada_v1_activation_2/truediv:z:0*
T0*'
_output_shapes
:����������
%sequential/cicada_v1_activation_2/addAddV2)sequential/cicada_v1_activation_2/Neg:y:0+sequential/cicada_v1_activation_2/Round:y:0*
T0*'
_output_shapes
:����������
.sequential/cicada_v1_activation_2/StopGradientStopGradient)sequential/cicada_v1_activation_2/add:z:0*
T0*'
_output_shapes
:����������
'sequential/cicada_v1_activation_2/add_1AddV2-sequential/cicada_v1_activation_2/truediv:z:07sequential/cicada_v1_activation_2/StopGradient:output:0*
T0*'
_output_shapes
:����������
+sequential/cicada_v1_activation_2/truediv_1RealDiv+sequential/cicada_v1_activation_2/add_1:z:0*sequential/cicada_v1_activation_2/Cast:y:0*
T0*'
_output_shapes
:���������r
-sequential/cicada_v1_activation_2/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
+sequential/cicada_v1_activation_2/truediv_2RealDiv6sequential/cicada_v1_activation_2/truediv_2/x:output:0*sequential/cicada_v1_activation_2/Cast:y:0*
T0*
_output_shapes
: n
)sequential/cicada_v1_activation_2/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
'sequential/cicada_v1_activation_2/sub_3Sub2sequential/cicada_v1_activation_2/sub_3/x:output:0/sequential/cicada_v1_activation_2/truediv_2:z:0*
T0*
_output_shapes
: �
7sequential/cicada_v1_activation_2/clip_by_value/MinimumMinimum/sequential/cicada_v1_activation_2/truediv_1:z:0+sequential/cicada_v1_activation_2/sub_3:z:0*
T0*'
_output_shapes
:���������v
1sequential/cicada_v1_activation_2/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    �
/sequential/cicada_v1_activation_2/clip_by_valueMaximum;sequential/cicada_v1_activation_2/clip_by_value/Minimum:z:0:sequential/cicada_v1_activation_2/clip_by_value/y:output:0*
T0*'
_output_shapes
:����������
'sequential/cicada_v1_activation_2/mul_2Mul,sequential/cicada_v1_activation_2/Cast_1:y:03sequential/cicada_v1_activation_2/clip_by_value:z:0*
T0*'
_output_shapes
:����������
'sequential/cicada_v1_activation_2/Neg_1Neg3sequential/cicada_v1_activation_2/SelectV2:output:0*
T0*'
_output_shapes
:����������
'sequential/cicada_v1_activation_2/add_2AddV2+sequential/cicada_v1_activation_2/Neg_1:y:0+sequential/cicada_v1_activation_2/mul_2:z:0*
T0*'
_output_shapes
:���������n
)sequential/cicada_v1_activation_2/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
'sequential/cicada_v1_activation_2/mul_3Mul2sequential/cicada_v1_activation_2/mul_3/x:output:0+sequential/cicada_v1_activation_2/add_2:z:0*
T0*'
_output_shapes
:����������
0sequential/cicada_v1_activation_2/StopGradient_1StopGradient+sequential/cicada_v1_activation_2/mul_3:z:0*
T0*'
_output_shapes
:����������
'sequential/cicada_v1_activation_2/add_3AddV23sequential/cicada_v1_activation_2/SelectV2:output:09sequential/cicada_v1_activation_2/StopGradient_1:output:0*
T0*'
_output_shapes
:���������z
IdentityIdentity+sequential/cicada_v1_activation_2/add_3:z:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp,^sequential/cicada_v1_dense_1/ReadVariableOp.^sequential/cicada_v1_dense_1/ReadVariableOp_1.^sequential/cicada_v1_dense_1/ReadVariableOp_2.^sequential/cicada_v1_dense_1/ReadVariableOp_3.^sequential/cicada_v1_dense_1/ReadVariableOp_4.^sequential/cicada_v1_dense_1/ReadVariableOp_5,^sequential/cicada_v1_dense_2/ReadVariableOp.^sequential/cicada_v1_dense_2/ReadVariableOp_1.^sequential/cicada_v1_dense_2/ReadVariableOp_22^sequential/cicada_v1_layernorm/add/ReadVariableOp4^sequential/cicada_v1_layernorm/mul_2/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:����������: : : : : 2Z
+sequential/cicada_v1_dense_1/ReadVariableOp+sequential/cicada_v1_dense_1/ReadVariableOp2^
-sequential/cicada_v1_dense_1/ReadVariableOp_1-sequential/cicada_v1_dense_1/ReadVariableOp_12^
-sequential/cicada_v1_dense_1/ReadVariableOp_2-sequential/cicada_v1_dense_1/ReadVariableOp_22^
-sequential/cicada_v1_dense_1/ReadVariableOp_3-sequential/cicada_v1_dense_1/ReadVariableOp_32^
-sequential/cicada_v1_dense_1/ReadVariableOp_4-sequential/cicada_v1_dense_1/ReadVariableOp_42^
-sequential/cicada_v1_dense_1/ReadVariableOp_5-sequential/cicada_v1_dense_1/ReadVariableOp_52Z
+sequential/cicada_v1_dense_2/ReadVariableOp+sequential/cicada_v1_dense_2/ReadVariableOp2^
-sequential/cicada_v1_dense_2/ReadVariableOp_1-sequential/cicada_v1_dense_2/ReadVariableOp_12^
-sequential/cicada_v1_dense_2/ReadVariableOp_2-sequential/cicada_v1_dense_2/ReadVariableOp_22f
1sequential/cicada_v1_layernorm/add/ReadVariableOp1sequential/cicada_v1_layernorm/add/ReadVariableOp2j
3sequential/cicada_v1_layernorm/mul_2/ReadVariableOp3sequential/cicada_v1_layernorm/mul_2/ReadVariableOp:Y U
(
_output_shapes
:����������
)
_user_specified_namecicada_v1_input
�
�
H__inference_sequential_layer_call_and_return_conditional_losses_18953489

inputs+
cicada_v1_layernorm_18953472:	�+
cicada_v1_layernorm_18953474:	�-
cicada_v1_dense_1_18953477:	�(
cicada_v1_dense_1_18953479:,
cicada_v1_dense_2_18953484:
identity��)cicada_v1_dense_1/StatefulPartitionedCall�)cicada_v1_dense_2/StatefulPartitionedCall�(cicada_v1_drop_1/StatefulPartitionedCall�+cicada_v1_layernorm/StatefulPartitionedCall�
+cicada_v1_layernorm/StatefulPartitionedCallStatefulPartitionedCallinputscicada_v1_layernorm_18953472cicada_v1_layernorm_18953474*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *Z
fURS
Q__inference_cicada_v1_layernorm_layer_call_and_return_conditional_losses_18953146�
)cicada_v1_dense_1/StatefulPartitionedCallStatefulPartitionedCall4cicada_v1_layernorm/StatefulPartitionedCall:output:0cicada_v1_dense_1_18953477cicada_v1_dense_1_18953479*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_cicada_v1_dense_1_layer_call_and_return_conditional_losses_18953220�
&cicada_v1_activation_1/PartitionedCallPartitionedCall2cicada_v1_dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *]
fXRV
T__inference_cicada_v1_activation_1_layer_call_and_return_conditional_losses_18953275�
(cicada_v1_drop_1/StatefulPartitionedCallStatefulPartitionedCall/cicada_v1_activation_1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *W
fRRP
N__inference_cicada_v1_drop_1_layer_call_and_return_conditional_losses_18953423�
)cicada_v1_dense_2/StatefulPartitionedCallStatefulPartitionedCall1cicada_v1_drop_1/StatefulPartitionedCall:output:0cicada_v1_dense_2_18953484*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_cicada_v1_dense_2_layer_call_and_return_conditional_losses_18953320�
&cicada_v1_activation_2/PartitionedCallPartitionedCall2cicada_v1_dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *]
fXRV
T__inference_cicada_v1_activation_2_layer_call_and_return_conditional_losses_18953373~
IdentityIdentity/cicada_v1_activation_2/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp*^cicada_v1_dense_1/StatefulPartitionedCall*^cicada_v1_dense_2/StatefulPartitionedCall)^cicada_v1_drop_1/StatefulPartitionedCall,^cicada_v1_layernorm/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:����������: : : : : 2V
)cicada_v1_dense_1/StatefulPartitionedCall)cicada_v1_dense_1/StatefulPartitionedCall2V
)cicada_v1_dense_2/StatefulPartitionedCall)cicada_v1_dense_2/StatefulPartitionedCall2T
(cicada_v1_drop_1/StatefulPartitionedCall(cicada_v1_drop_1/StatefulPartitionedCall2Z
+cicada_v1_layernorm/StatefulPartitionedCall+cicada_v1_layernorm/StatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
-__inference_sequential_layer_call_fn_18953591

inputs
unknown:	�
	unknown_0:	�
	unknown_1:	�
	unknown_2:
	unknown_3:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8� *Q
fLRJ
H__inference_sequential_layer_call_and_return_conditional_losses_18953376o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:����������: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
H__inference_sequential_layer_call_and_return_conditional_losses_18953376

inputs+
cicada_v1_layernorm_18953147:	�+
cicada_v1_layernorm_18953149:	�-
cicada_v1_dense_1_18953221:	�(
cicada_v1_dense_1_18953223:,
cicada_v1_dense_2_18953321:
identity��)cicada_v1_dense_1/StatefulPartitionedCall�)cicada_v1_dense_2/StatefulPartitionedCall�+cicada_v1_layernorm/StatefulPartitionedCall�
+cicada_v1_layernorm/StatefulPartitionedCallStatefulPartitionedCallinputscicada_v1_layernorm_18953147cicada_v1_layernorm_18953149*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *Z
fURS
Q__inference_cicada_v1_layernorm_layer_call_and_return_conditional_losses_18953146�
)cicada_v1_dense_1/StatefulPartitionedCallStatefulPartitionedCall4cicada_v1_layernorm/StatefulPartitionedCall:output:0cicada_v1_dense_1_18953221cicada_v1_dense_1_18953223*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_cicada_v1_dense_1_layer_call_and_return_conditional_losses_18953220�
&cicada_v1_activation_1/PartitionedCallPartitionedCall2cicada_v1_dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *]
fXRV
T__inference_cicada_v1_activation_1_layer_call_and_return_conditional_losses_18953275�
 cicada_v1_drop_1/PartitionedCallPartitionedCall/cicada_v1_activation_1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *W
fRRP
N__inference_cicada_v1_drop_1_layer_call_and_return_conditional_losses_18953282�
)cicada_v1_dense_2/StatefulPartitionedCallStatefulPartitionedCall)cicada_v1_drop_1/PartitionedCall:output:0cicada_v1_dense_2_18953321*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_cicada_v1_dense_2_layer_call_and_return_conditional_losses_18953320�
&cicada_v1_activation_2/PartitionedCallPartitionedCall2cicada_v1_dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *]
fXRV
T__inference_cicada_v1_activation_2_layer_call_and_return_conditional_losses_18953373~
IdentityIdentity/cicada_v1_activation_2/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp*^cicada_v1_dense_1/StatefulPartitionedCall*^cicada_v1_dense_2/StatefulPartitionedCall,^cicada_v1_layernorm/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:����������: : : : : 2V
)cicada_v1_dense_1/StatefulPartitionedCall)cicada_v1_dense_1/StatefulPartitionedCall2V
)cicada_v1_dense_2/StatefulPartitionedCall)cicada_v1_dense_2/StatefulPartitionedCall2Z
+cicada_v1_layernorm/StatefulPartitionedCall+cicada_v1_layernorm/StatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
H__inference_sequential_layer_call_and_return_conditional_losses_18953537
cicada_v1_input+
cicada_v1_layernorm_18953520:	�+
cicada_v1_layernorm_18953522:	�-
cicada_v1_dense_1_18953525:	�(
cicada_v1_dense_1_18953527:,
cicada_v1_dense_2_18953532:
identity��)cicada_v1_dense_1/StatefulPartitionedCall�)cicada_v1_dense_2/StatefulPartitionedCall�+cicada_v1_layernorm/StatefulPartitionedCall�
+cicada_v1_layernorm/StatefulPartitionedCallStatefulPartitionedCallcicada_v1_inputcicada_v1_layernorm_18953520cicada_v1_layernorm_18953522*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *Z
fURS
Q__inference_cicada_v1_layernorm_layer_call_and_return_conditional_losses_18953146�
)cicada_v1_dense_1/StatefulPartitionedCallStatefulPartitionedCall4cicada_v1_layernorm/StatefulPartitionedCall:output:0cicada_v1_dense_1_18953525cicada_v1_dense_1_18953527*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_cicada_v1_dense_1_layer_call_and_return_conditional_losses_18953220�
&cicada_v1_activation_1/PartitionedCallPartitionedCall2cicada_v1_dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *]
fXRV
T__inference_cicada_v1_activation_1_layer_call_and_return_conditional_losses_18953275�
 cicada_v1_drop_1/PartitionedCallPartitionedCall/cicada_v1_activation_1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *W
fRRP
N__inference_cicada_v1_drop_1_layer_call_and_return_conditional_losses_18953282�
)cicada_v1_dense_2/StatefulPartitionedCallStatefulPartitionedCall)cicada_v1_drop_1/PartitionedCall:output:0cicada_v1_dense_2_18953532*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_cicada_v1_dense_2_layer_call_and_return_conditional_losses_18953320�
&cicada_v1_activation_2/PartitionedCallPartitionedCall2cicada_v1_dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *]
fXRV
T__inference_cicada_v1_activation_2_layer_call_and_return_conditional_losses_18953373~
IdentityIdentity/cicada_v1_activation_2/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp*^cicada_v1_dense_1/StatefulPartitionedCall*^cicada_v1_dense_2/StatefulPartitionedCall,^cicada_v1_layernorm/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:����������: : : : : 2V
)cicada_v1_dense_1/StatefulPartitionedCall)cicada_v1_dense_1/StatefulPartitionedCall2V
)cicada_v1_dense_2/StatefulPartitionedCall)cicada_v1_dense_2/StatefulPartitionedCall2Z
+cicada_v1_layernorm/StatefulPartitionedCall+cicada_v1_layernorm/StatefulPartitionedCall:Y U
(
_output_shapes
:����������
)
_user_specified_namecicada_v1_input
�
�
O__inference_cicada_v1_dense_2_layer_call_and_return_conditional_losses_18954323

inputs)
readvariableop_resource:
identity��ReadVariableOp�ReadVariableOp_1�ReadVariableOp_2G
Pow/xConst*
_output_shapes
: *
dtype0*
value	B :G
Pow/yConst*
_output_shapes
: *
dtype0*
value	B :K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: E
CastCastPow:z:0*

DstT0*

SrcT0*
_output_shapes
: f
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes

:*
dtype0J
mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   E[
mulMulReadVariableOp:value:0mul/y:output:0*
T0*
_output_shapes

:N
truedivRealDivmul:z:0Cast:y:0*
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

:\
clip_by_value/Minimum/yConst*
_output_shapes
: *
dtype0*
valueB
 * ��Dv
clip_by_value/MinimumMinimum	add_1:z:0 clip_by_value/Minimum/y:output:0*
T0*
_output_shapes

:T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 * ���v
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*
_output_shapes

:R
mul_1MulCast:y:0clip_by_value:z:0*
T0*
_output_shapes

:P
truediv_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   E^
	truediv_1RealDiv	mul_1:z:0truediv_1/y:output:0*
T0*
_output_shapes

:L
mul_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?V
mul_2Mulmul_2/x:output:0truediv_1:z:0*
T0*
_output_shapes

:h
ReadVariableOp_1ReadVariableOpreadvariableop_resource*
_output_shapes

:*
dtype0O
Neg_1NegReadVariableOp_1:value:0*
T0*
_output_shapes

:M
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*
_output_shapes

:L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?R
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*
_output_shapes

:R
StopGradient_1StopGradient	mul_3:z:0*
T0*
_output_shapes

:h
ReadVariableOp_2ReadVariableOpreadvariableop_resource*
_output_shapes

:*
dtype0j
add_3AddV2ReadVariableOp_2:value:0StopGradient_1:output:0*
T0*
_output_shapes

:U
MatMulMatMulinputs	add_3:z:0*
T0*'
_output_shapes
:���������_
IdentityIdentityMatMul:product:0^NoOp*
T0*'
_output_shapes
:���������}
NoOpNoOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:���������: 2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_2:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
l
N__inference_cicada_v1_drop_1_layer_call_and_return_conditional_losses_18954268

inputs

identity_1N
IdentityIdentityinputs*
T0*'
_output_shapes
:���������[

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:���������"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
� 
�
Q__inference_cicada_v1_layernorm_layer_call_and_return_conditional_losses_18953146

inputs,
mul_2_readvariableop_resource:	�*
add_readvariableop_resource:	�
identity��add/ReadVariableOp�mul_2/ReadVariableOpI
ShapeShapeinputs*
T0*
_output_shapes
::��]
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
valueB:�
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
value	B :�
Reshape/shapePackReshape/shape/0:output:0mul:z:0	mul_1:z:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:m
ReshapeReshapeinputsReshape/shape:output:0*
T0*0
_output_shapes
:����������J
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
 *  �?e
onesFillones/packed:output:0ones/Const:output:0*
T0*#
_output_shapes
:���������K
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
:���������H
ConstConst*
_output_shapes
: *
dtype0*
valueB J
Const_1Const*
_output_shapes
: *
dtype0*
valueB �
FusedBatchNormV3FusedBatchNormV3Reshape:output:0ones:output:0zeros:output:0Const:output:0Const_1:output:0*
T0*
U0*p
_output_shapes^
\:����������:���������:���������:���������:���������:*
data_formatNCHW*
epsilon%o�:m
	Reshape_1ReshapeFusedBatchNormV3:y:0Shape:output:0*
T0*(
_output_shapes
:����������o
mul_2/ReadVariableOpReadVariableOpmul_2_readvariableop_resource*
_output_shapes	
:�*
dtype0q
mul_2MulReshape_1:output:0mul_2/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������k
add/ReadVariableOpReadVariableOpadd_readvariableop_resource*
_output_shapes	
:�*
dtype0f
addAddV2	mul_2:z:0add/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������W
IdentityIdentityadd:z:0^NoOp*
T0*(
_output_shapes
:����������r
NoOpNoOp^add/ReadVariableOp^mul_2/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 2(
add/ReadVariableOpadd/ReadVariableOp2,
mul_2/ReadVariableOpmul_2/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�

m
N__inference_cicada_v1_drop_1_layer_call_and_return_conditional_losses_18954280

inputs
identity�R
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *%I�?d
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:���������Q
dropout/ShapeShapeinputs*
T0*
_output_shapes
::���
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:���������*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:���������T
dropout/Const_1Const*
_output_shapes
: *
dtype0*
valueB
 *    �
dropout/SelectV2SelectV2dropout/GreaterEqual:z:0dropout/Mul:z:0dropout/Const_1:output:0*
T0*'
_output_shapes
:���������a
IdentityIdentitydropout/SelectV2:output:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�!
p
T__inference_cicada_v1_activation_1_layer_call_and_return_conditional_losses_18953275

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
:���������F
ReluReluinputs*
T0*'
_output_shapes
:���������S
ones_like/ShapeShapeinputs*
T0*
_output_shapes
::��T
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?w
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:���������D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
mulMulones_like:output:0	sub_2:z:0*
T0*'
_output_shapes
:���������r
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*'
_output_shapes
:���������P
mul_1MulinputsCast:y:0*
T0*'
_output_shapes
:���������[
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*'
_output_shapes
:���������I
NegNegtruediv:z:0*
T0*'
_output_shapes
:���������M
RoundRoundtruediv:z:0*
T0*'
_output_shapes
:���������R
addAddV2Neg:y:0	Round:y:0*
T0*'
_output_shapes
:���������W
StopGradientStopGradientadd:z:0*
T0*'
_output_shapes
:���������d
add_1AddV2truediv:z:0StopGradient:output:0*
T0*'
_output_shapes
:���������[
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*'
_output_shapes
:���������P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: l
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*'
_output_shapes
:���������T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*'
_output_shapes
:���������]
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*'
_output_shapes
:���������Q
Neg_1NegSelectV2:output:0*
T0*'
_output_shapes
:���������V
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*'
_output_shapes
:���������L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?[
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*'
_output_shapes
:���������[
StopGradient_1StopGradient	mul_3:z:0*
T0*'
_output_shapes
:���������l
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*'
_output_shapes
:���������Q
IdentityIdentity	add_3:z:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
̠
�
!__inference__traced_save_18954526
file_prefix?
0read_disablecopyonread_cicada_v1_layernorm_gamma:	�@
1read_1_disablecopyonread_cicada_v1_layernorm_beta:	�D
1read_2_disablecopyonread_cicada_v1_dense_1_kernel:	�=
/read_3_disablecopyonread_cicada_v1_dense_1_bias:C
1read_4_disablecopyonread_cicada_v1_dense_2_kernel:,
"read_5_disablecopyonread_iteration:	 0
&read_6_disablecopyonread_learning_rate: H
9read_7_disablecopyonread_adam_m_cicada_v1_layernorm_gamma:	�H
9read_8_disablecopyonread_adam_v_cicada_v1_layernorm_gamma:	�G
8read_9_disablecopyonread_adam_m_cicada_v1_layernorm_beta:	�H
9read_10_disablecopyonread_adam_v_cicada_v1_layernorm_beta:	�L
9read_11_disablecopyonread_adam_m_cicada_v1_dense_1_kernel:	�L
9read_12_disablecopyonread_adam_v_cicada_v1_dense_1_kernel:	�E
7read_13_disablecopyonread_adam_m_cicada_v1_dense_1_bias:E
7read_14_disablecopyonread_adam_v_cicada_v1_dense_1_bias:K
9read_15_disablecopyonread_adam_m_cicada_v1_dense_2_kernel:K
9read_16_disablecopyonread_adam_v_cicada_v1_dense_2_kernel:+
!read_17_disablecopyonread_total_1: +
!read_18_disablecopyonread_count_1: )
read_19_disablecopyonread_total: )
read_20_disablecopyonread_count: 
savev2_const
identity_43��MergeV2Checkpoints�Read/DisableCopyOnRead�Read/ReadVariableOp�Read_1/DisableCopyOnRead�Read_1/ReadVariableOp�Read_10/DisableCopyOnRead�Read_10/ReadVariableOp�Read_11/DisableCopyOnRead�Read_11/ReadVariableOp�Read_12/DisableCopyOnRead�Read_12/ReadVariableOp�Read_13/DisableCopyOnRead�Read_13/ReadVariableOp�Read_14/DisableCopyOnRead�Read_14/ReadVariableOp�Read_15/DisableCopyOnRead�Read_15/ReadVariableOp�Read_16/DisableCopyOnRead�Read_16/ReadVariableOp�Read_17/DisableCopyOnRead�Read_17/ReadVariableOp�Read_18/DisableCopyOnRead�Read_18/ReadVariableOp�Read_19/DisableCopyOnRead�Read_19/ReadVariableOp�Read_2/DisableCopyOnRead�Read_2/ReadVariableOp�Read_20/DisableCopyOnRead�Read_20/ReadVariableOp�Read_3/DisableCopyOnRead�Read_3/ReadVariableOp�Read_4/DisableCopyOnRead�Read_4/ReadVariableOp�Read_5/DisableCopyOnRead�Read_5/ReadVariableOp�Read_6/DisableCopyOnRead�Read_6/ReadVariableOp�Read_7/DisableCopyOnRead�Read_7/ReadVariableOp�Read_8/DisableCopyOnRead�Read_8/ReadVariableOp�Read_9/DisableCopyOnRead�Read_9/ReadVariableOpw
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
: �
Read/DisableCopyOnReadDisableCopyOnRead0read_disablecopyonread_cicada_v1_layernorm_gamma"/device:CPU:0*
_output_shapes
 �
Read/ReadVariableOpReadVariableOp0read_disablecopyonread_cicada_v1_layernorm_gamma^Read/DisableCopyOnRead"/device:CPU:0*
_output_shapes	
:�*
dtype0f
IdentityIdentityRead/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes	
:�^

Identity_1IdentityIdentity:output:0"/device:CPU:0*
T0*
_output_shapes	
:��
Read_1/DisableCopyOnReadDisableCopyOnRead1read_1_disablecopyonread_cicada_v1_layernorm_beta"/device:CPU:0*
_output_shapes
 �
Read_1/ReadVariableOpReadVariableOp1read_1_disablecopyonread_cicada_v1_layernorm_beta^Read_1/DisableCopyOnRead"/device:CPU:0*
_output_shapes	
:�*
dtype0j

Identity_2IdentityRead_1/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes	
:�`

Identity_3IdentityIdentity_2:output:0"/device:CPU:0*
T0*
_output_shapes	
:��
Read_2/DisableCopyOnReadDisableCopyOnRead1read_2_disablecopyonread_cicada_v1_dense_1_kernel"/device:CPU:0*
_output_shapes
 �
Read_2/ReadVariableOpReadVariableOp1read_2_disablecopyonread_cicada_v1_dense_1_kernel^Read_2/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	�*
dtype0n

Identity_4IdentityRead_2/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	�d

Identity_5IdentityIdentity_4:output:0"/device:CPU:0*
T0*
_output_shapes
:	��
Read_3/DisableCopyOnReadDisableCopyOnRead/read_3_disablecopyonread_cicada_v1_dense_1_bias"/device:CPU:0*
_output_shapes
 �
Read_3/ReadVariableOpReadVariableOp/read_3_disablecopyonread_cicada_v1_dense_1_bias^Read_3/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0i

Identity_6IdentityRead_3/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:_

Identity_7IdentityIdentity_6:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_4/DisableCopyOnReadDisableCopyOnRead1read_4_disablecopyonread_cicada_v1_dense_2_kernel"/device:CPU:0*
_output_shapes
 �
Read_4/ReadVariableOpReadVariableOp1read_4_disablecopyonread_cicada_v1_dense_2_kernel^Read_4/DisableCopyOnRead"/device:CPU:0*
_output_shapes

:*
dtype0m

Identity_8IdentityRead_4/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes

:c

Identity_9IdentityIdentity_8:output:0"/device:CPU:0*
T0*
_output_shapes

:v
Read_5/DisableCopyOnReadDisableCopyOnRead"read_5_disablecopyonread_iteration"/device:CPU:0*
_output_shapes
 �
Read_5/ReadVariableOpReadVariableOp"read_5_disablecopyonread_iteration^Read_5/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0	f
Identity_10IdentityRead_5/ReadVariableOp:value:0"/device:CPU:0*
T0	*
_output_shapes
: ]
Identity_11IdentityIdentity_10:output:0"/device:CPU:0*
T0	*
_output_shapes
: z
Read_6/DisableCopyOnReadDisableCopyOnRead&read_6_disablecopyonread_learning_rate"/device:CPU:0*
_output_shapes
 �
Read_6/ReadVariableOpReadVariableOp&read_6_disablecopyonread_learning_rate^Read_6/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0f
Identity_12IdentityRead_6/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: ]
Identity_13IdentityIdentity_12:output:0"/device:CPU:0*
T0*
_output_shapes
: �
Read_7/DisableCopyOnReadDisableCopyOnRead9read_7_disablecopyonread_adam_m_cicada_v1_layernorm_gamma"/device:CPU:0*
_output_shapes
 �
Read_7/ReadVariableOpReadVariableOp9read_7_disablecopyonread_adam_m_cicada_v1_layernorm_gamma^Read_7/DisableCopyOnRead"/device:CPU:0*
_output_shapes	
:�*
dtype0k
Identity_14IdentityRead_7/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes	
:�b
Identity_15IdentityIdentity_14:output:0"/device:CPU:0*
T0*
_output_shapes	
:��
Read_8/DisableCopyOnReadDisableCopyOnRead9read_8_disablecopyonread_adam_v_cicada_v1_layernorm_gamma"/device:CPU:0*
_output_shapes
 �
Read_8/ReadVariableOpReadVariableOp9read_8_disablecopyonread_adam_v_cicada_v1_layernorm_gamma^Read_8/DisableCopyOnRead"/device:CPU:0*
_output_shapes	
:�*
dtype0k
Identity_16IdentityRead_8/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes	
:�b
Identity_17IdentityIdentity_16:output:0"/device:CPU:0*
T0*
_output_shapes	
:��
Read_9/DisableCopyOnReadDisableCopyOnRead8read_9_disablecopyonread_adam_m_cicada_v1_layernorm_beta"/device:CPU:0*
_output_shapes
 �
Read_9/ReadVariableOpReadVariableOp8read_9_disablecopyonread_adam_m_cicada_v1_layernorm_beta^Read_9/DisableCopyOnRead"/device:CPU:0*
_output_shapes	
:�*
dtype0k
Identity_18IdentityRead_9/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes	
:�b
Identity_19IdentityIdentity_18:output:0"/device:CPU:0*
T0*
_output_shapes	
:��
Read_10/DisableCopyOnReadDisableCopyOnRead9read_10_disablecopyonread_adam_v_cicada_v1_layernorm_beta"/device:CPU:0*
_output_shapes
 �
Read_10/ReadVariableOpReadVariableOp9read_10_disablecopyonread_adam_v_cicada_v1_layernorm_beta^Read_10/DisableCopyOnRead"/device:CPU:0*
_output_shapes	
:�*
dtype0l
Identity_20IdentityRead_10/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes	
:�b
Identity_21IdentityIdentity_20:output:0"/device:CPU:0*
T0*
_output_shapes	
:��
Read_11/DisableCopyOnReadDisableCopyOnRead9read_11_disablecopyonread_adam_m_cicada_v1_dense_1_kernel"/device:CPU:0*
_output_shapes
 �
Read_11/ReadVariableOpReadVariableOp9read_11_disablecopyonread_adam_m_cicada_v1_dense_1_kernel^Read_11/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	�*
dtype0p
Identity_22IdentityRead_11/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	�f
Identity_23IdentityIdentity_22:output:0"/device:CPU:0*
T0*
_output_shapes
:	��
Read_12/DisableCopyOnReadDisableCopyOnRead9read_12_disablecopyonread_adam_v_cicada_v1_dense_1_kernel"/device:CPU:0*
_output_shapes
 �
Read_12/ReadVariableOpReadVariableOp9read_12_disablecopyonread_adam_v_cicada_v1_dense_1_kernel^Read_12/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	�*
dtype0p
Identity_24IdentityRead_12/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	�f
Identity_25IdentityIdentity_24:output:0"/device:CPU:0*
T0*
_output_shapes
:	��
Read_13/DisableCopyOnReadDisableCopyOnRead7read_13_disablecopyonread_adam_m_cicada_v1_dense_1_bias"/device:CPU:0*
_output_shapes
 �
Read_13/ReadVariableOpReadVariableOp7read_13_disablecopyonread_adam_m_cicada_v1_dense_1_bias^Read_13/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_26IdentityRead_13/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_27IdentityIdentity_26:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_14/DisableCopyOnReadDisableCopyOnRead7read_14_disablecopyonread_adam_v_cicada_v1_dense_1_bias"/device:CPU:0*
_output_shapes
 �
Read_14/ReadVariableOpReadVariableOp7read_14_disablecopyonread_adam_v_cicada_v1_dense_1_bias^Read_14/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_28IdentityRead_14/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_29IdentityIdentity_28:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_15/DisableCopyOnReadDisableCopyOnRead9read_15_disablecopyonread_adam_m_cicada_v1_dense_2_kernel"/device:CPU:0*
_output_shapes
 �
Read_15/ReadVariableOpReadVariableOp9read_15_disablecopyonread_adam_m_cicada_v1_dense_2_kernel^Read_15/DisableCopyOnRead"/device:CPU:0*
_output_shapes

:*
dtype0o
Identity_30IdentityRead_15/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes

:e
Identity_31IdentityIdentity_30:output:0"/device:CPU:0*
T0*
_output_shapes

:�
Read_16/DisableCopyOnReadDisableCopyOnRead9read_16_disablecopyonread_adam_v_cicada_v1_dense_2_kernel"/device:CPU:0*
_output_shapes
 �
Read_16/ReadVariableOpReadVariableOp9read_16_disablecopyonread_adam_v_cicada_v1_dense_2_kernel^Read_16/DisableCopyOnRead"/device:CPU:0*
_output_shapes

:*
dtype0o
Identity_32IdentityRead_16/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes

:e
Identity_33IdentityIdentity_32:output:0"/device:CPU:0*
T0*
_output_shapes

:v
Read_17/DisableCopyOnReadDisableCopyOnRead!read_17_disablecopyonread_total_1"/device:CPU:0*
_output_shapes
 �
Read_17/ReadVariableOpReadVariableOp!read_17_disablecopyonread_total_1^Read_17/DisableCopyOnRead"/device:CPU:0*
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
: v
Read_18/DisableCopyOnReadDisableCopyOnRead!read_18_disablecopyonread_count_1"/device:CPU:0*
_output_shapes
 �
Read_18/ReadVariableOpReadVariableOp!read_18_disablecopyonread_count_1^Read_18/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0g
Identity_36IdentityRead_18/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: ]
Identity_37IdentityIdentity_36:output:0"/device:CPU:0*
T0*
_output_shapes
: t
Read_19/DisableCopyOnReadDisableCopyOnReadread_19_disablecopyonread_total"/device:CPU:0*
_output_shapes
 �
Read_19/ReadVariableOpReadVariableOpread_19_disablecopyonread_total^Read_19/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0g
Identity_38IdentityRead_19/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: ]
Identity_39IdentityIdentity_38:output:0"/device:CPU:0*
T0*
_output_shapes
: t
Read_20/DisableCopyOnReadDisableCopyOnReadread_20_disablecopyonread_count"/device:CPU:0*
_output_shapes
 �
Read_20/ReadVariableOpReadVariableOpread_20_disablecopyonread_count^Read_20/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0g
Identity_40IdentityRead_20/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: ]
Identity_41IdentityIdentity_40:output:0"/device:CPU:0*
T0*
_output_shapes
: �	
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*�	
value�B�B5layer_with_weights-0/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/beta/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*?
value6B4B B B B B B B B B B B B B B B B B B B B B B �
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0Identity_1:output:0Identity_3:output:0Identity_5:output:0Identity_7:output:0Identity_9:output:0Identity_11:output:0Identity_13:output:0Identity_15:output:0Identity_17:output:0Identity_19:output:0Identity_21:output:0Identity_23:output:0Identity_25:output:0Identity_27:output:0Identity_29:output:0Identity_31:output:0Identity_33:output:0Identity_35:output:0Identity_37:output:0Identity_39:output:0Identity_41:output:0savev2_const"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *$
dtypes
2	�
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:�
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 i
Identity_42Identityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: U
Identity_43IdentityIdentity_42:output:0^NoOp*
T0*
_output_shapes
: �	
NoOpNoOp^MergeV2Checkpoints^Read/DisableCopyOnRead^Read/ReadVariableOp^Read_1/DisableCopyOnRead^Read_1/ReadVariableOp^Read_10/DisableCopyOnRead^Read_10/ReadVariableOp^Read_11/DisableCopyOnRead^Read_11/ReadVariableOp^Read_12/DisableCopyOnRead^Read_12/ReadVariableOp^Read_13/DisableCopyOnRead^Read_13/ReadVariableOp^Read_14/DisableCopyOnRead^Read_14/ReadVariableOp^Read_15/DisableCopyOnRead^Read_15/ReadVariableOp^Read_16/DisableCopyOnRead^Read_16/ReadVariableOp^Read_17/DisableCopyOnRead^Read_17/ReadVariableOp^Read_18/DisableCopyOnRead^Read_18/ReadVariableOp^Read_19/DisableCopyOnRead^Read_19/ReadVariableOp^Read_2/DisableCopyOnRead^Read_2/ReadVariableOp^Read_20/DisableCopyOnRead^Read_20/ReadVariableOp^Read_3/DisableCopyOnRead^Read_3/ReadVariableOp^Read_4/DisableCopyOnRead^Read_4/ReadVariableOp^Read_5/DisableCopyOnRead^Read_5/ReadVariableOp^Read_6/DisableCopyOnRead^Read_6/ReadVariableOp^Read_7/DisableCopyOnRead^Read_7/ReadVariableOp^Read_8/DisableCopyOnRead^Read_8/ReadVariableOp^Read_9/DisableCopyOnRead^Read_9/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "#
identity_43Identity_43:output:0*A
_input_shapes0
.: : : : : : : : : : : : : : : : : : : : : : : 2(
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
Read_20/ReadVariableOpRead_20/ReadVariableOp24
Read_3/DisableCopyOnReadRead_3/DisableCopyOnRead2.
Read_3/ReadVariableOpRead_3/ReadVariableOp24
Read_4/DisableCopyOnReadRead_4/DisableCopyOnRead2.
Read_4/ReadVariableOpRead_4/ReadVariableOp24
Read_5/DisableCopyOnReadRead_5/DisableCopyOnRead2.
Read_5/ReadVariableOpRead_5/ReadVariableOp24
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
_user_specified_namefile_prefix:

_output_shapes
: 
�
�
-__inference_sequential_layer_call_fn_18953517
cicada_v1_input
unknown:	�
	unknown_0:	�
	unknown_1:	�
	unknown_2:
	unknown_3:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallcicada_v1_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8� *Q
fLRJ
H__inference_sequential_layer_call_and_return_conditional_losses_18953489o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:����������: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Y U
(
_output_shapes
:����������
)
_user_specified_namecicada_v1_input
�
�
6__inference_cicada_v1_layernorm_layer_call_fn_18954080

inputs
unknown:	�
	unknown_0:	�
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *Z
fURS
Q__inference_cicada_v1_layernorm_layer_call_and_return_conditional_losses_18953146p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�\
�
$__inference__traced_restore_18954599
file_prefix9
*assignvariableop_cicada_v1_layernorm_gamma:	�:
+assignvariableop_1_cicada_v1_layernorm_beta:	�>
+assignvariableop_2_cicada_v1_dense_1_kernel:	�7
)assignvariableop_3_cicada_v1_dense_1_bias:=
+assignvariableop_4_cicada_v1_dense_2_kernel:&
assignvariableop_5_iteration:	 *
 assignvariableop_6_learning_rate: B
3assignvariableop_7_adam_m_cicada_v1_layernorm_gamma:	�B
3assignvariableop_8_adam_v_cicada_v1_layernorm_gamma:	�A
2assignvariableop_9_adam_m_cicada_v1_layernorm_beta:	�B
3assignvariableop_10_adam_v_cicada_v1_layernorm_beta:	�F
3assignvariableop_11_adam_m_cicada_v1_dense_1_kernel:	�F
3assignvariableop_12_adam_v_cicada_v1_dense_1_kernel:	�?
1assignvariableop_13_adam_m_cicada_v1_dense_1_bias:?
1assignvariableop_14_adam_v_cicada_v1_dense_1_bias:E
3assignvariableop_15_adam_m_cicada_v1_dense_2_kernel:E
3assignvariableop_16_adam_v_cicada_v1_dense_2_kernel:%
assignvariableop_17_total_1: %
assignvariableop_18_count_1: #
assignvariableop_19_total: #
assignvariableop_20_count: 
identity_22��AssignVariableOp�AssignVariableOp_1�AssignVariableOp_10�AssignVariableOp_11�AssignVariableOp_12�AssignVariableOp_13�AssignVariableOp_14�AssignVariableOp_15�AssignVariableOp_16�AssignVariableOp_17�AssignVariableOp_18�AssignVariableOp_19�AssignVariableOp_2�AssignVariableOp_20�AssignVariableOp_3�AssignVariableOp_4�AssignVariableOp_5�AssignVariableOp_6�AssignVariableOp_7�AssignVariableOp_8�AssignVariableOp_9�	
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*�	
value�B�B5layer_with_weights-0/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/beta/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*?
value6B4B B B B B B B B B B B B B B B B B B B B B B �
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*l
_output_shapesZ
X::::::::::::::::::::::*$
dtypes
2	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOpAssignVariableOp*assignvariableop_cicada_v1_layernorm_gammaIdentity:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_1AssignVariableOp+assignvariableop_1_cicada_v1_layernorm_betaIdentity_1:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_2AssignVariableOp+assignvariableop_2_cicada_v1_dense_1_kernelIdentity_2:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_3AssignVariableOp)assignvariableop_3_cicada_v1_dense_1_biasIdentity_3:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_4AssignVariableOp+assignvariableop_4_cicada_v1_dense_2_kernelIdentity_4:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_5AssignVariableOpassignvariableop_5_iterationIdentity_5:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_6AssignVariableOp assignvariableop_6_learning_rateIdentity_6:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_7AssignVariableOp3assignvariableop_7_adam_m_cicada_v1_layernorm_gammaIdentity_7:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_8AssignVariableOp3assignvariableop_8_adam_v_cicada_v1_layernorm_gammaIdentity_8:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_9AssignVariableOp2assignvariableop_9_adam_m_cicada_v1_layernorm_betaIdentity_9:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_10AssignVariableOp3assignvariableop_10_adam_v_cicada_v1_layernorm_betaIdentity_10:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_11AssignVariableOp3assignvariableop_11_adam_m_cicada_v1_dense_1_kernelIdentity_11:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_12AssignVariableOp3assignvariableop_12_adam_v_cicada_v1_dense_1_kernelIdentity_12:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_13AssignVariableOp1assignvariableop_13_adam_m_cicada_v1_dense_1_biasIdentity_13:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_14AssignVariableOp1assignvariableop_14_adam_v_cicada_v1_dense_1_biasIdentity_14:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_15AssignVariableOp3assignvariableop_15_adam_m_cicada_v1_dense_2_kernelIdentity_15:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_16AssignVariableOp3assignvariableop_16_adam_v_cicada_v1_dense_2_kernelIdentity_16:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_17AssignVariableOpassignvariableop_17_total_1Identity_17:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_18AssignVariableOpassignvariableop_18_count_1Identity_18:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_19AssignVariableOpassignvariableop_19_totalIdentity_19:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_20AssignVariableOpassignvariableop_20_countIdentity_20:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0Y
NoOpNoOp"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 �
Identity_21Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_22IdentityIdentity_21:output:0^NoOp_1*
T0*
_output_shapes
: �
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_22Identity_22:output:0*?
_input_shapes.
,: : : : : : : : : : : : : : : : : : : : : : 2$
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
AssignVariableOp_20AssignVariableOp_202(
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
�
l
N__inference_cicada_v1_drop_1_layer_call_and_return_conditional_losses_18953282

inputs

identity_1N
IdentityIdentityinputs*
T0*'
_output_shapes
:���������[

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:���������"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�2
�
O__inference_cicada_v1_dense_1_layer_call_and_return_conditional_losses_18953220

inputs*
readvariableop_resource:	�'
readvariableop_3_resource:
identity��ReadVariableOp�ReadVariableOp_1�ReadVariableOp_2�ReadVariableOp_3�ReadVariableOp_4�ReadVariableOp_5G
Pow/xConst*
_output_shapes
: *
dtype0*
value	B :G
Pow/yConst*
_output_shapes
: *
dtype0*
value	B :K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: E
CastCastPow:z:0*

DstT0*

SrcT0*
_output_shapes
: g
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:	�*
dtype0J
mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   C\
mulMulReadVariableOp:value:0mul/y:output:0*
T0*
_output_shapes
:	�O
truedivRealDivmul:z:0Cast:y:0*
T0*
_output_shapes
:	�A
NegNegtruediv:z:0*
T0*
_output_shapes
:	�E
RoundRoundtruediv:z:0*
T0*
_output_shapes
:	�J
addAddV2Neg:y:0	Round:y:0*
T0*
_output_shapes
:	�O
StopGradientStopGradientadd:z:0*
T0*
_output_shapes
:	�\
add_1AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes
:	�\
clip_by_value/Minimum/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �Bw
clip_by_value/MinimumMinimum	add_1:z:0 clip_by_value/Minimum/y:output:0*
T0*
_output_shapes
:	�T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ��w
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*
_output_shapes
:	�S
mul_1MulCast:y:0clip_by_value:z:0*
T0*
_output_shapes
:	�P
truediv_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   C_
	truediv_1RealDiv	mul_1:z:0truediv_1/y:output:0*
T0*
_output_shapes
:	�L
mul_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?W
mul_2Mulmul_2/x:output:0truediv_1:z:0*
T0*
_output_shapes
:	�i
ReadVariableOp_1ReadVariableOpreadvariableop_resource*
_output_shapes
:	�*
dtype0P
Neg_1NegReadVariableOp_1:value:0*
T0*
_output_shapes
:	�N
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*
_output_shapes
:	�L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?S
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*
_output_shapes
:	�S
StopGradient_1StopGradient	mul_3:z:0*
T0*
_output_shapes
:	�i
ReadVariableOp_2ReadVariableOpreadvariableop_resource*
_output_shapes
:	�*
dtype0k
add_3AddV2ReadVariableOp_2:value:0StopGradient_1:output:0*
T0*
_output_shapes
:	�U
MatMulMatMulinputs	add_3:z:0*
T0*'
_output_shapes
:���������I
Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :I
Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: I
Cast_1Cast	Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: f
ReadVariableOp_3ReadVariableOpreadvariableop_3_resource*
_output_shapes
:*
dtype0L
mul_4/yConst*
_output_shapes
: *
dtype0*
valueB
 *   C]
mul_4MulReadVariableOp_3:value:0mul_4/y:output:0*
T0*
_output_shapes
:P
	truediv_2RealDiv	mul_4:z:0
Cast_1:y:0*
T0*
_output_shapes
:@
Neg_2Negtruediv_2:z:0*
T0*
_output_shapes
:D
Round_1Roundtruediv_2:z:0*
T0*
_output_shapes
:K
add_4AddV2	Neg_2:y:0Round_1:y:0*
T0*
_output_shapes
:N
StopGradient_2StopGradient	add_4:z:0*
T0*
_output_shapes
:[
add_5AddV2truediv_2:z:0StopGradient_2:output:0*
T0*
_output_shapes
:^
clip_by_value_1/Minimum/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �Bv
clip_by_value_1/MinimumMinimum	add_5:z:0"clip_by_value_1/Minimum/y:output:0*
T0*
_output_shapes
:V
clip_by_value_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ��x
clip_by_value_1Maximumclip_by_value_1/Minimum:z:0clip_by_value_1/y:output:0*
T0*
_output_shapes
:R
mul_5Mul
Cast_1:y:0clip_by_value_1:z:0*
T0*
_output_shapes
:P
truediv_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *   CZ
	truediv_3RealDiv	mul_5:z:0truediv_3/y:output:0*
T0*
_output_shapes
:L
mul_6/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?R
mul_6Mulmul_6/x:output:0truediv_3:z:0*
T0*
_output_shapes
:f
ReadVariableOp_4ReadVariableOpreadvariableop_3_resource*
_output_shapes
:*
dtype0K
Neg_3NegReadVariableOp_4:value:0*
T0*
_output_shapes
:I
add_6AddV2	Neg_3:y:0	mul_6:z:0*
T0*
_output_shapes
:L
mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?N
mul_7Mulmul_7/x:output:0	add_6:z:0*
T0*
_output_shapes
:N
StopGradient_3StopGradient	mul_7:z:0*
T0*
_output_shapes
:f
ReadVariableOp_5ReadVariableOpreadvariableop_3_resource*
_output_shapes
:*
dtype0f
add_7AddV2ReadVariableOp_5:value:0StopGradient_3:output:0*
T0*
_output_shapes
:a
BiasAddBiasAddMatMul:product:0	add_7:z:0*
T0*'
_output_shapes
:���������_
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2^ReadVariableOp_3^ReadVariableOp_4^ReadVariableOp_5*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_22$
ReadVariableOp_3ReadVariableOp_32$
ReadVariableOp_4ReadVariableOp_42$
ReadVariableOp_5ReadVariableOp_5:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�

m
N__inference_cicada_v1_drop_1_layer_call_and_return_conditional_losses_18953423

inputs
identity�R
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *%I�?d
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:���������Q
dropout/ShapeShapeinputs*
T0*
_output_shapes
::���
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:���������*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:���������T
dropout/Const_1Const*
_output_shapes
: *
dtype0*
valueB
 *    �
dropout/SelectV2SelectV2dropout/GreaterEqual:z:0dropout/Mul:z:0dropout/Const_1:output:0*
T0*'
_output_shapes
:���������a
IdentityIdentitydropout/SelectV2:output:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
U
9__inference_cicada_v1_activation_1_layer_call_fn_18954204

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *]
fXRV
T__inference_cicada_v1_activation_1_layer_call_and_return_conditional_losses_18953275`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
��
�
H__inference_sequential_layer_call_and_return_conditional_losses_18954071

inputs@
1cicada_v1_layernorm_mul_2_readvariableop_resource:	�>
/cicada_v1_layernorm_add_readvariableop_resource:	�<
)cicada_v1_dense_1_readvariableop_resource:	�9
+cicada_v1_dense_1_readvariableop_3_resource:;
)cicada_v1_dense_2_readvariableop_resource:
identity�� cicada_v1_dense_1/ReadVariableOp�"cicada_v1_dense_1/ReadVariableOp_1�"cicada_v1_dense_1/ReadVariableOp_2�"cicada_v1_dense_1/ReadVariableOp_3�"cicada_v1_dense_1/ReadVariableOp_4�"cicada_v1_dense_1/ReadVariableOp_5� cicada_v1_dense_2/ReadVariableOp�"cicada_v1_dense_2/ReadVariableOp_1�"cicada_v1_dense_2/ReadVariableOp_2�&cicada_v1_layernorm/add/ReadVariableOp�(cicada_v1_layernorm/mul_2/ReadVariableOp]
cicada_v1_layernorm/ShapeShapeinputs*
T0*
_output_shapes
::��q
'cicada_v1_layernorm/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: s
)cicada_v1_layernorm/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:s
)cicada_v1_layernorm/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
!cicada_v1_layernorm/strided_sliceStridedSlice"cicada_v1_layernorm/Shape:output:00cicada_v1_layernorm/strided_slice/stack:output:02cicada_v1_layernorm/strided_slice/stack_1:output:02cicada_v1_layernorm/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask[
cicada_v1_layernorm/mul/xConst*
_output_shapes
: *
dtype0*
value	B :�
cicada_v1_layernorm/mulMul"cicada_v1_layernorm/mul/x:output:0*cicada_v1_layernorm/strided_slice:output:0*
T0*
_output_shapes
: s
)cicada_v1_layernorm/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:u
+cicada_v1_layernorm/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:u
+cicada_v1_layernorm/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
#cicada_v1_layernorm/strided_slice_1StridedSlice"cicada_v1_layernorm/Shape:output:02cicada_v1_layernorm/strided_slice_1/stack:output:04cicada_v1_layernorm/strided_slice_1/stack_1:output:04cicada_v1_layernorm/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask]
cicada_v1_layernorm/mul_1/xConst*
_output_shapes
: *
dtype0*
value	B :�
cicada_v1_layernorm/mul_1Mul$cicada_v1_layernorm/mul_1/x:output:0,cicada_v1_layernorm/strided_slice_1:output:0*
T0*
_output_shapes
: e
#cicada_v1_layernorm/Reshape/shape/0Const*
_output_shapes
: *
dtype0*
value	B :e
#cicada_v1_layernorm/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :�
!cicada_v1_layernorm/Reshape/shapePack,cicada_v1_layernorm/Reshape/shape/0:output:0cicada_v1_layernorm/mul:z:0cicada_v1_layernorm/mul_1:z:0,cicada_v1_layernorm/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:�
cicada_v1_layernorm/ReshapeReshapeinputs*cicada_v1_layernorm/Reshape/shape:output:0*
T0*0
_output_shapes
:����������r
cicada_v1_layernorm/ones/packedPackcicada_v1_layernorm/mul:z:0*
N*
T0*
_output_shapes
:c
cicada_v1_layernorm/ones/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_layernorm/onesFill(cicada_v1_layernorm/ones/packed:output:0'cicada_v1_layernorm/ones/Const:output:0*
T0*#
_output_shapes
:���������s
 cicada_v1_layernorm/zeros/packedPackcicada_v1_layernorm/mul:z:0*
N*
T0*
_output_shapes
:d
cicada_v1_layernorm/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    �
cicada_v1_layernorm/zerosFill)cicada_v1_layernorm/zeros/packed:output:0(cicada_v1_layernorm/zeros/Const:output:0*
T0*#
_output_shapes
:���������\
cicada_v1_layernorm/ConstConst*
_output_shapes
: *
dtype0*
valueB ^
cicada_v1_layernorm/Const_1Const*
_output_shapes
: *
dtype0*
valueB �
$cicada_v1_layernorm/FusedBatchNormV3FusedBatchNormV3$cicada_v1_layernorm/Reshape:output:0!cicada_v1_layernorm/ones:output:0"cicada_v1_layernorm/zeros:output:0"cicada_v1_layernorm/Const:output:0$cicada_v1_layernorm/Const_1:output:0*
T0*
U0*p
_output_shapes^
\:����������:���������:���������:���������:���������:*
data_formatNCHW*
epsilon%o�:�
cicada_v1_layernorm/Reshape_1Reshape(cicada_v1_layernorm/FusedBatchNormV3:y:0"cicada_v1_layernorm/Shape:output:0*
T0*(
_output_shapes
:�����������
(cicada_v1_layernorm/mul_2/ReadVariableOpReadVariableOp1cicada_v1_layernorm_mul_2_readvariableop_resource*
_output_shapes	
:�*
dtype0�
cicada_v1_layernorm/mul_2Mul&cicada_v1_layernorm/Reshape_1:output:00cicada_v1_layernorm/mul_2/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
&cicada_v1_layernorm/add/ReadVariableOpReadVariableOp/cicada_v1_layernorm_add_readvariableop_resource*
_output_shapes	
:�*
dtype0�
cicada_v1_layernorm/addAddV2cicada_v1_layernorm/mul_2:z:0.cicada_v1_layernorm/add/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������Y
cicada_v1_dense_1/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :Y
cicada_v1_dense_1/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :�
cicada_v1_dense_1/PowPow cicada_v1_dense_1/Pow/x:output:0 cicada_v1_dense_1/Pow/y:output:0*
T0*
_output_shapes
: i
cicada_v1_dense_1/CastCastcicada_v1_dense_1/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: �
 cicada_v1_dense_1/ReadVariableOpReadVariableOp)cicada_v1_dense_1_readvariableop_resource*
_output_shapes
:	�*
dtype0\
cicada_v1_dense_1/mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   C�
cicada_v1_dense_1/mulMul(cicada_v1_dense_1/ReadVariableOp:value:0 cicada_v1_dense_1/mul/y:output:0*
T0*
_output_shapes
:	��
cicada_v1_dense_1/truedivRealDivcicada_v1_dense_1/mul:z:0cicada_v1_dense_1/Cast:y:0*
T0*
_output_shapes
:	�e
cicada_v1_dense_1/NegNegcicada_v1_dense_1/truediv:z:0*
T0*
_output_shapes
:	�i
cicada_v1_dense_1/RoundRoundcicada_v1_dense_1/truediv:z:0*
T0*
_output_shapes
:	��
cicada_v1_dense_1/addAddV2cicada_v1_dense_1/Neg:y:0cicada_v1_dense_1/Round:y:0*
T0*
_output_shapes
:	�s
cicada_v1_dense_1/StopGradientStopGradientcicada_v1_dense_1/add:z:0*
T0*
_output_shapes
:	��
cicada_v1_dense_1/add_1AddV2cicada_v1_dense_1/truediv:z:0'cicada_v1_dense_1/StopGradient:output:0*
T0*
_output_shapes
:	�n
)cicada_v1_dense_1/clip_by_value/Minimum/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �B�
'cicada_v1_dense_1/clip_by_value/MinimumMinimumcicada_v1_dense_1/add_1:z:02cicada_v1_dense_1/clip_by_value/Minimum/y:output:0*
T0*
_output_shapes
:	�f
!cicada_v1_dense_1/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ���
cicada_v1_dense_1/clip_by_valueMaximum+cicada_v1_dense_1/clip_by_value/Minimum:z:0*cicada_v1_dense_1/clip_by_value/y:output:0*
T0*
_output_shapes
:	��
cicada_v1_dense_1/mul_1Mulcicada_v1_dense_1/Cast:y:0#cicada_v1_dense_1/clip_by_value:z:0*
T0*
_output_shapes
:	�b
cicada_v1_dense_1/truediv_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   C�
cicada_v1_dense_1/truediv_1RealDivcicada_v1_dense_1/mul_1:z:0&cicada_v1_dense_1/truediv_1/y:output:0*
T0*
_output_shapes
:	�^
cicada_v1_dense_1/mul_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_dense_1/mul_2Mul"cicada_v1_dense_1/mul_2/x:output:0cicada_v1_dense_1/truediv_1:z:0*
T0*
_output_shapes
:	��
"cicada_v1_dense_1/ReadVariableOp_1ReadVariableOp)cicada_v1_dense_1_readvariableop_resource*
_output_shapes
:	�*
dtype0t
cicada_v1_dense_1/Neg_1Neg*cicada_v1_dense_1/ReadVariableOp_1:value:0*
T0*
_output_shapes
:	��
cicada_v1_dense_1/add_2AddV2cicada_v1_dense_1/Neg_1:y:0cicada_v1_dense_1/mul_2:z:0*
T0*
_output_shapes
:	�^
cicada_v1_dense_1/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_dense_1/mul_3Mul"cicada_v1_dense_1/mul_3/x:output:0cicada_v1_dense_1/add_2:z:0*
T0*
_output_shapes
:	�w
 cicada_v1_dense_1/StopGradient_1StopGradientcicada_v1_dense_1/mul_3:z:0*
T0*
_output_shapes
:	��
"cicada_v1_dense_1/ReadVariableOp_2ReadVariableOp)cicada_v1_dense_1_readvariableop_resource*
_output_shapes
:	�*
dtype0�
cicada_v1_dense_1/add_3AddV2*cicada_v1_dense_1/ReadVariableOp_2:value:0)cicada_v1_dense_1/StopGradient_1:output:0*
T0*
_output_shapes
:	��
cicada_v1_dense_1/MatMulMatMulcicada_v1_layernorm/add:z:0cicada_v1_dense_1/add_3:z:0*
T0*'
_output_shapes
:���������[
cicada_v1_dense_1/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :[
cicada_v1_dense_1/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :�
cicada_v1_dense_1/Pow_1Pow"cicada_v1_dense_1/Pow_1/x:output:0"cicada_v1_dense_1/Pow_1/y:output:0*
T0*
_output_shapes
: m
cicada_v1_dense_1/Cast_1Castcicada_v1_dense_1/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: �
"cicada_v1_dense_1/ReadVariableOp_3ReadVariableOp+cicada_v1_dense_1_readvariableop_3_resource*
_output_shapes
:*
dtype0^
cicada_v1_dense_1/mul_4/yConst*
_output_shapes
: *
dtype0*
valueB
 *   C�
cicada_v1_dense_1/mul_4Mul*cicada_v1_dense_1/ReadVariableOp_3:value:0"cicada_v1_dense_1/mul_4/y:output:0*
T0*
_output_shapes
:�
cicada_v1_dense_1/truediv_2RealDivcicada_v1_dense_1/mul_4:z:0cicada_v1_dense_1/Cast_1:y:0*
T0*
_output_shapes
:d
cicada_v1_dense_1/Neg_2Negcicada_v1_dense_1/truediv_2:z:0*
T0*
_output_shapes
:h
cicada_v1_dense_1/Round_1Roundcicada_v1_dense_1/truediv_2:z:0*
T0*
_output_shapes
:�
cicada_v1_dense_1/add_4AddV2cicada_v1_dense_1/Neg_2:y:0cicada_v1_dense_1/Round_1:y:0*
T0*
_output_shapes
:r
 cicada_v1_dense_1/StopGradient_2StopGradientcicada_v1_dense_1/add_4:z:0*
T0*
_output_shapes
:�
cicada_v1_dense_1/add_5AddV2cicada_v1_dense_1/truediv_2:z:0)cicada_v1_dense_1/StopGradient_2:output:0*
T0*
_output_shapes
:p
+cicada_v1_dense_1/clip_by_value_1/Minimum/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �B�
)cicada_v1_dense_1/clip_by_value_1/MinimumMinimumcicada_v1_dense_1/add_5:z:04cicada_v1_dense_1/clip_by_value_1/Minimum/y:output:0*
T0*
_output_shapes
:h
#cicada_v1_dense_1/clip_by_value_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ���
!cicada_v1_dense_1/clip_by_value_1Maximum-cicada_v1_dense_1/clip_by_value_1/Minimum:z:0,cicada_v1_dense_1/clip_by_value_1/y:output:0*
T0*
_output_shapes
:�
cicada_v1_dense_1/mul_5Mulcicada_v1_dense_1/Cast_1:y:0%cicada_v1_dense_1/clip_by_value_1:z:0*
T0*
_output_shapes
:b
cicada_v1_dense_1/truediv_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *   C�
cicada_v1_dense_1/truediv_3RealDivcicada_v1_dense_1/mul_5:z:0&cicada_v1_dense_1/truediv_3/y:output:0*
T0*
_output_shapes
:^
cicada_v1_dense_1/mul_6/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_dense_1/mul_6Mul"cicada_v1_dense_1/mul_6/x:output:0cicada_v1_dense_1/truediv_3:z:0*
T0*
_output_shapes
:�
"cicada_v1_dense_1/ReadVariableOp_4ReadVariableOp+cicada_v1_dense_1_readvariableop_3_resource*
_output_shapes
:*
dtype0o
cicada_v1_dense_1/Neg_3Neg*cicada_v1_dense_1/ReadVariableOp_4:value:0*
T0*
_output_shapes
:
cicada_v1_dense_1/add_6AddV2cicada_v1_dense_1/Neg_3:y:0cicada_v1_dense_1/mul_6:z:0*
T0*
_output_shapes
:^
cicada_v1_dense_1/mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_dense_1/mul_7Mul"cicada_v1_dense_1/mul_7/x:output:0cicada_v1_dense_1/add_6:z:0*
T0*
_output_shapes
:r
 cicada_v1_dense_1/StopGradient_3StopGradientcicada_v1_dense_1/mul_7:z:0*
T0*
_output_shapes
:�
"cicada_v1_dense_1/ReadVariableOp_5ReadVariableOp+cicada_v1_dense_1_readvariableop_3_resource*
_output_shapes
:*
dtype0�
cicada_v1_dense_1/add_7AddV2*cicada_v1_dense_1/ReadVariableOp_5:value:0)cicada_v1_dense_1/StopGradient_3:output:0*
T0*
_output_shapes
:�
cicada_v1_dense_1/BiasAddBiasAdd"cicada_v1_dense_1/MatMul:product:0cicada_v1_dense_1/add_7:z:0*
T0*'
_output_shapes
:���������^
cicada_v1_activation_1/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :^
cicada_v1_activation_1/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :
�
cicada_v1_activation_1/PowPow%cicada_v1_activation_1/Pow/x:output:0%cicada_v1_activation_1/Pow/y:output:0*
T0*
_output_shapes
: s
cicada_v1_activation_1/CastCastcicada_v1_activation_1/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: `
cicada_v1_activation_1/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :`
cicada_v1_activation_1/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :�
cicada_v1_activation_1/Pow_1Pow'cicada_v1_activation_1/Pow_1/x:output:0'cicada_v1_activation_1/Pow_1/y:output:0*
T0*
_output_shapes
: w
cicada_v1_activation_1/Cast_1Cast cicada_v1_activation_1/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: a
cicada_v1_activation_1/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @a
cicada_v1_activation_1/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :
cicada_v1_activation_1/Cast_2Cast(cicada_v1_activation_1/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: a
cicada_v1_activation_1/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *   A�
cicada_v1_activation_1/subSub!cicada_v1_activation_1/Cast_2:y:0%cicada_v1_activation_1/sub/y:output:0*
T0*
_output_shapes
: �
cicada_v1_activation_1/Pow_2Pow%cicada_v1_activation_1/Const:output:0cicada_v1_activation_1/sub:z:0*
T0*
_output_shapes
: �
cicada_v1_activation_1/sub_1Sub!cicada_v1_activation_1/Cast_1:y:0 cicada_v1_activation_1/Pow_2:z:0*
T0*
_output_shapes
: �
 cicada_v1_activation_1/LessEqual	LessEqual"cicada_v1_dense_1/BiasAdd:output:0 cicada_v1_activation_1/sub_1:z:0*
T0*'
_output_shapes
:���������y
cicada_v1_activation_1/ReluRelu"cicada_v1_dense_1/BiasAdd:output:0*
T0*'
_output_shapes
:����������
&cicada_v1_activation_1/ones_like/ShapeShape"cicada_v1_dense_1/BiasAdd:output:0*
T0*
_output_shapes
::��k
&cicada_v1_activation_1/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
 cicada_v1_activation_1/ones_likeFill/cicada_v1_activation_1/ones_like/Shape:output:0/cicada_v1_activation_1/ones_like/Const:output:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_1/sub_2Sub!cicada_v1_activation_1/Cast_1:y:0 cicada_v1_activation_1/Pow_2:z:0*
T0*
_output_shapes
: �
cicada_v1_activation_1/mulMul)cicada_v1_activation_1/ones_like:output:0 cicada_v1_activation_1/sub_2:z:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_1/SelectV2SelectV2$cicada_v1_activation_1/LessEqual:z:0)cicada_v1_activation_1/Relu:activations:0cicada_v1_activation_1/mul:z:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_1/mul_1Mul"cicada_v1_dense_1/BiasAdd:output:0cicada_v1_activation_1/Cast:y:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_1/truedivRealDiv cicada_v1_activation_1/mul_1:z:0!cicada_v1_activation_1/Cast_1:y:0*
T0*'
_output_shapes
:���������w
cicada_v1_activation_1/NegNeg"cicada_v1_activation_1/truediv:z:0*
T0*'
_output_shapes
:���������{
cicada_v1_activation_1/RoundRound"cicada_v1_activation_1/truediv:z:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_1/addAddV2cicada_v1_activation_1/Neg:y:0 cicada_v1_activation_1/Round:y:0*
T0*'
_output_shapes
:����������
#cicada_v1_activation_1/StopGradientStopGradientcicada_v1_activation_1/add:z:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_1/add_1AddV2"cicada_v1_activation_1/truediv:z:0,cicada_v1_activation_1/StopGradient:output:0*
T0*'
_output_shapes
:����������
 cicada_v1_activation_1/truediv_1RealDiv cicada_v1_activation_1/add_1:z:0cicada_v1_activation_1/Cast:y:0*
T0*'
_output_shapes
:���������g
"cicada_v1_activation_1/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
 cicada_v1_activation_1/truediv_2RealDiv+cicada_v1_activation_1/truediv_2/x:output:0cicada_v1_activation_1/Cast:y:0*
T0*
_output_shapes
: c
cicada_v1_activation_1/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_activation_1/sub_3Sub'cicada_v1_activation_1/sub_3/x:output:0$cicada_v1_activation_1/truediv_2:z:0*
T0*
_output_shapes
: �
,cicada_v1_activation_1/clip_by_value/MinimumMinimum$cicada_v1_activation_1/truediv_1:z:0 cicada_v1_activation_1/sub_3:z:0*
T0*'
_output_shapes
:���������k
&cicada_v1_activation_1/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    �
$cicada_v1_activation_1/clip_by_valueMaximum0cicada_v1_activation_1/clip_by_value/Minimum:z:0/cicada_v1_activation_1/clip_by_value/y:output:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_1/mul_2Mul!cicada_v1_activation_1/Cast_1:y:0(cicada_v1_activation_1/clip_by_value:z:0*
T0*'
_output_shapes
:���������
cicada_v1_activation_1/Neg_1Neg(cicada_v1_activation_1/SelectV2:output:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_1/add_2AddV2 cicada_v1_activation_1/Neg_1:y:0 cicada_v1_activation_1/mul_2:z:0*
T0*'
_output_shapes
:���������c
cicada_v1_activation_1/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_activation_1/mul_3Mul'cicada_v1_activation_1/mul_3/x:output:0 cicada_v1_activation_1/add_2:z:0*
T0*'
_output_shapes
:����������
%cicada_v1_activation_1/StopGradient_1StopGradient cicada_v1_activation_1/mul_3:z:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_1/add_3AddV2(cicada_v1_activation_1/SelectV2:output:0.cicada_v1_activation_1/StopGradient_1:output:0*
T0*'
_output_shapes
:���������c
cicada_v1_drop_1/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *%I�?�
cicada_v1_drop_1/dropout/MulMul cicada_v1_activation_1/add_3:z:0'cicada_v1_drop_1/dropout/Const:output:0*
T0*'
_output_shapes
:���������|
cicada_v1_drop_1/dropout/ShapeShape cicada_v1_activation_1/add_3:z:0*
T0*
_output_shapes
::���
5cicada_v1_drop_1/dropout/random_uniform/RandomUniformRandomUniform'cicada_v1_drop_1/dropout/Shape:output:0*
T0*'
_output_shapes
:���������*
dtype0l
'cicada_v1_drop_1/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >�
%cicada_v1_drop_1/dropout/GreaterEqualGreaterEqual>cicada_v1_drop_1/dropout/random_uniform/RandomUniform:output:00cicada_v1_drop_1/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:���������e
 cicada_v1_drop_1/dropout/Const_1Const*
_output_shapes
: *
dtype0*
valueB
 *    �
!cicada_v1_drop_1/dropout/SelectV2SelectV2)cicada_v1_drop_1/dropout/GreaterEqual:z:0 cicada_v1_drop_1/dropout/Mul:z:0)cicada_v1_drop_1/dropout/Const_1:output:0*
T0*'
_output_shapes
:���������Y
cicada_v1_dense_2/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :Y
cicada_v1_dense_2/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :�
cicada_v1_dense_2/PowPow cicada_v1_dense_2/Pow/x:output:0 cicada_v1_dense_2/Pow/y:output:0*
T0*
_output_shapes
: i
cicada_v1_dense_2/CastCastcicada_v1_dense_2/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: �
 cicada_v1_dense_2/ReadVariableOpReadVariableOp)cicada_v1_dense_2_readvariableop_resource*
_output_shapes

:*
dtype0\
cicada_v1_dense_2/mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   E�
cicada_v1_dense_2/mulMul(cicada_v1_dense_2/ReadVariableOp:value:0 cicada_v1_dense_2/mul/y:output:0*
T0*
_output_shapes

:�
cicada_v1_dense_2/truedivRealDivcicada_v1_dense_2/mul:z:0cicada_v1_dense_2/Cast:y:0*
T0*
_output_shapes

:d
cicada_v1_dense_2/NegNegcicada_v1_dense_2/truediv:z:0*
T0*
_output_shapes

:h
cicada_v1_dense_2/RoundRoundcicada_v1_dense_2/truediv:z:0*
T0*
_output_shapes

:
cicada_v1_dense_2/addAddV2cicada_v1_dense_2/Neg:y:0cicada_v1_dense_2/Round:y:0*
T0*
_output_shapes

:r
cicada_v1_dense_2/StopGradientStopGradientcicada_v1_dense_2/add:z:0*
T0*
_output_shapes

:�
cicada_v1_dense_2/add_1AddV2cicada_v1_dense_2/truediv:z:0'cicada_v1_dense_2/StopGradient:output:0*
T0*
_output_shapes

:n
)cicada_v1_dense_2/clip_by_value/Minimum/yConst*
_output_shapes
: *
dtype0*
valueB
 * ��D�
'cicada_v1_dense_2/clip_by_value/MinimumMinimumcicada_v1_dense_2/add_1:z:02cicada_v1_dense_2/clip_by_value/Minimum/y:output:0*
T0*
_output_shapes

:f
!cicada_v1_dense_2/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 * ����
cicada_v1_dense_2/clip_by_valueMaximum+cicada_v1_dense_2/clip_by_value/Minimum:z:0*cicada_v1_dense_2/clip_by_value/y:output:0*
T0*
_output_shapes

:�
cicada_v1_dense_2/mul_1Mulcicada_v1_dense_2/Cast:y:0#cicada_v1_dense_2/clip_by_value:z:0*
T0*
_output_shapes

:b
cicada_v1_dense_2/truediv_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   E�
cicada_v1_dense_2/truediv_1RealDivcicada_v1_dense_2/mul_1:z:0&cicada_v1_dense_2/truediv_1/y:output:0*
T0*
_output_shapes

:^
cicada_v1_dense_2/mul_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_dense_2/mul_2Mul"cicada_v1_dense_2/mul_2/x:output:0cicada_v1_dense_2/truediv_1:z:0*
T0*
_output_shapes

:�
"cicada_v1_dense_2/ReadVariableOp_1ReadVariableOp)cicada_v1_dense_2_readvariableop_resource*
_output_shapes

:*
dtype0s
cicada_v1_dense_2/Neg_1Neg*cicada_v1_dense_2/ReadVariableOp_1:value:0*
T0*
_output_shapes

:�
cicada_v1_dense_2/add_2AddV2cicada_v1_dense_2/Neg_1:y:0cicada_v1_dense_2/mul_2:z:0*
T0*
_output_shapes

:^
cicada_v1_dense_2/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_dense_2/mul_3Mul"cicada_v1_dense_2/mul_3/x:output:0cicada_v1_dense_2/add_2:z:0*
T0*
_output_shapes

:v
 cicada_v1_dense_2/StopGradient_1StopGradientcicada_v1_dense_2/mul_3:z:0*
T0*
_output_shapes

:�
"cicada_v1_dense_2/ReadVariableOp_2ReadVariableOp)cicada_v1_dense_2_readvariableop_resource*
_output_shapes

:*
dtype0�
cicada_v1_dense_2/add_3AddV2*cicada_v1_dense_2/ReadVariableOp_2:value:0)cicada_v1_dense_2/StopGradient_1:output:0*
T0*
_output_shapes

:�
cicada_v1_dense_2/MatMulMatMul*cicada_v1_drop_1/dropout/SelectV2:output:0cicada_v1_dense_2/add_3:z:0*
T0*'
_output_shapes
:���������^
cicada_v1_activation_2/Pow/xConst*
_output_shapes
: *
dtype0*
value	B :^
cicada_v1_activation_2/Pow/yConst*
_output_shapes
: *
dtype0*
value	B :�
cicada_v1_activation_2/PowPow%cicada_v1_activation_2/Pow/x:output:0%cicada_v1_activation_2/Pow/y:output:0*
T0*
_output_shapes
: s
cicada_v1_activation_2/CastCastcicada_v1_activation_2/Pow:z:0*

DstT0*

SrcT0*
_output_shapes
: `
cicada_v1_activation_2/Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :`
cicada_v1_activation_2/Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :�
cicada_v1_activation_2/Pow_1Pow'cicada_v1_activation_2/Pow_1/x:output:0'cicada_v1_activation_2/Pow_1/y:output:0*
T0*
_output_shapes
: w
cicada_v1_activation_2/Cast_1Cast cicada_v1_activation_2/Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: a
cicada_v1_activation_2/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @a
cicada_v1_activation_2/Cast_2/xConst*
_output_shapes
: *
dtype0*
value	B :
cicada_v1_activation_2/Cast_2Cast(cicada_v1_activation_2/Cast_2/x:output:0*

DstT0*

SrcT0*
_output_shapes
: a
cicada_v1_activation_2/sub/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �A�
cicada_v1_activation_2/subSub!cicada_v1_activation_2/Cast_2:y:0%cicada_v1_activation_2/sub/y:output:0*
T0*
_output_shapes
: �
cicada_v1_activation_2/Pow_2Pow%cicada_v1_activation_2/Const:output:0cicada_v1_activation_2/sub:z:0*
T0*
_output_shapes
: �
cicada_v1_activation_2/sub_1Sub!cicada_v1_activation_2/Cast_1:y:0 cicada_v1_activation_2/Pow_2:z:0*
T0*
_output_shapes
: �
 cicada_v1_activation_2/LessEqual	LessEqual"cicada_v1_dense_2/MatMul:product:0 cicada_v1_activation_2/sub_1:z:0*
T0*'
_output_shapes
:���������y
cicada_v1_activation_2/ReluRelu"cicada_v1_dense_2/MatMul:product:0*
T0*'
_output_shapes
:����������
&cicada_v1_activation_2/ones_like/ShapeShape"cicada_v1_dense_2/MatMul:product:0*
T0*
_output_shapes
::��k
&cicada_v1_activation_2/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
 cicada_v1_activation_2/ones_likeFill/cicada_v1_activation_2/ones_like/Shape:output:0/cicada_v1_activation_2/ones_like/Const:output:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_2/sub_2Sub!cicada_v1_activation_2/Cast_1:y:0 cicada_v1_activation_2/Pow_2:z:0*
T0*
_output_shapes
: �
cicada_v1_activation_2/mulMul)cicada_v1_activation_2/ones_like:output:0 cicada_v1_activation_2/sub_2:z:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_2/SelectV2SelectV2$cicada_v1_activation_2/LessEqual:z:0)cicada_v1_activation_2/Relu:activations:0cicada_v1_activation_2/mul:z:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_2/mul_1Mul"cicada_v1_dense_2/MatMul:product:0cicada_v1_activation_2/Cast:y:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_2/truedivRealDiv cicada_v1_activation_2/mul_1:z:0!cicada_v1_activation_2/Cast_1:y:0*
T0*'
_output_shapes
:���������w
cicada_v1_activation_2/NegNeg"cicada_v1_activation_2/truediv:z:0*
T0*'
_output_shapes
:���������{
cicada_v1_activation_2/RoundRound"cicada_v1_activation_2/truediv:z:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_2/addAddV2cicada_v1_activation_2/Neg:y:0 cicada_v1_activation_2/Round:y:0*
T0*'
_output_shapes
:����������
#cicada_v1_activation_2/StopGradientStopGradientcicada_v1_activation_2/add:z:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_2/add_1AddV2"cicada_v1_activation_2/truediv:z:0,cicada_v1_activation_2/StopGradient:output:0*
T0*'
_output_shapes
:����������
 cicada_v1_activation_2/truediv_1RealDiv cicada_v1_activation_2/add_1:z:0cicada_v1_activation_2/Cast:y:0*
T0*'
_output_shapes
:���������g
"cicada_v1_activation_2/truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
 cicada_v1_activation_2/truediv_2RealDiv+cicada_v1_activation_2/truediv_2/x:output:0cicada_v1_activation_2/Cast:y:0*
T0*
_output_shapes
: c
cicada_v1_activation_2/sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_activation_2/sub_3Sub'cicada_v1_activation_2/sub_3/x:output:0$cicada_v1_activation_2/truediv_2:z:0*
T0*
_output_shapes
: �
,cicada_v1_activation_2/clip_by_value/MinimumMinimum$cicada_v1_activation_2/truediv_1:z:0 cicada_v1_activation_2/sub_3:z:0*
T0*'
_output_shapes
:���������k
&cicada_v1_activation_2/clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    �
$cicada_v1_activation_2/clip_by_valueMaximum0cicada_v1_activation_2/clip_by_value/Minimum:z:0/cicada_v1_activation_2/clip_by_value/y:output:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_2/mul_2Mul!cicada_v1_activation_2/Cast_1:y:0(cicada_v1_activation_2/clip_by_value:z:0*
T0*'
_output_shapes
:���������
cicada_v1_activation_2/Neg_1Neg(cicada_v1_activation_2/SelectV2:output:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_2/add_2AddV2 cicada_v1_activation_2/Neg_1:y:0 cicada_v1_activation_2/mul_2:z:0*
T0*'
_output_shapes
:���������c
cicada_v1_activation_2/mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
cicada_v1_activation_2/mul_3Mul'cicada_v1_activation_2/mul_3/x:output:0 cicada_v1_activation_2/add_2:z:0*
T0*'
_output_shapes
:����������
%cicada_v1_activation_2/StopGradient_1StopGradient cicada_v1_activation_2/mul_3:z:0*
T0*'
_output_shapes
:����������
cicada_v1_activation_2/add_3AddV2(cicada_v1_activation_2/SelectV2:output:0.cicada_v1_activation_2/StopGradient_1:output:0*
T0*'
_output_shapes
:���������o
IdentityIdentity cicada_v1_activation_2/add_3:z:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp!^cicada_v1_dense_1/ReadVariableOp#^cicada_v1_dense_1/ReadVariableOp_1#^cicada_v1_dense_1/ReadVariableOp_2#^cicada_v1_dense_1/ReadVariableOp_3#^cicada_v1_dense_1/ReadVariableOp_4#^cicada_v1_dense_1/ReadVariableOp_5!^cicada_v1_dense_2/ReadVariableOp#^cicada_v1_dense_2/ReadVariableOp_1#^cicada_v1_dense_2/ReadVariableOp_2'^cicada_v1_layernorm/add/ReadVariableOp)^cicada_v1_layernorm/mul_2/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:����������: : : : : 2D
 cicada_v1_dense_1/ReadVariableOp cicada_v1_dense_1/ReadVariableOp2H
"cicada_v1_dense_1/ReadVariableOp_1"cicada_v1_dense_1/ReadVariableOp_12H
"cicada_v1_dense_1/ReadVariableOp_2"cicada_v1_dense_1/ReadVariableOp_22H
"cicada_v1_dense_1/ReadVariableOp_3"cicada_v1_dense_1/ReadVariableOp_32H
"cicada_v1_dense_1/ReadVariableOp_4"cicada_v1_dense_1/ReadVariableOp_42H
"cicada_v1_dense_1/ReadVariableOp_5"cicada_v1_dense_1/ReadVariableOp_52D
 cicada_v1_dense_2/ReadVariableOp cicada_v1_dense_2/ReadVariableOp2H
"cicada_v1_dense_2/ReadVariableOp_1"cicada_v1_dense_2/ReadVariableOp_12H
"cicada_v1_dense_2/ReadVariableOp_2"cicada_v1_dense_2/ReadVariableOp_22P
&cicada_v1_layernorm/add/ReadVariableOp&cicada_v1_layernorm/add/ReadVariableOp2T
(cicada_v1_layernorm/mul_2/ReadVariableOp(cicada_v1_layernorm/mul_2/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
4__inference_cicada_v1_dense_1_layer_call_fn_18954131

inputs
unknown:	�
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_cicada_v1_dense_1_layer_call_and_return_conditional_losses_18953220o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
O__inference_cicada_v1_dense_2_layer_call_and_return_conditional_losses_18953320

inputs)
readvariableop_resource:
identity��ReadVariableOp�ReadVariableOp_1�ReadVariableOp_2G
Pow/xConst*
_output_shapes
: *
dtype0*
value	B :G
Pow/yConst*
_output_shapes
: *
dtype0*
value	B :K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: E
CastCastPow:z:0*

DstT0*

SrcT0*
_output_shapes
: f
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes

:*
dtype0J
mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   E[
mulMulReadVariableOp:value:0mul/y:output:0*
T0*
_output_shapes

:N
truedivRealDivmul:z:0Cast:y:0*
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

:\
clip_by_value/Minimum/yConst*
_output_shapes
: *
dtype0*
valueB
 * ��Dv
clip_by_value/MinimumMinimum	add_1:z:0 clip_by_value/Minimum/y:output:0*
T0*
_output_shapes

:T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 * ���v
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*
_output_shapes

:R
mul_1MulCast:y:0clip_by_value:z:0*
T0*
_output_shapes

:P
truediv_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   E^
	truediv_1RealDiv	mul_1:z:0truediv_1/y:output:0*
T0*
_output_shapes

:L
mul_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?V
mul_2Mulmul_2/x:output:0truediv_1:z:0*
T0*
_output_shapes

:h
ReadVariableOp_1ReadVariableOpreadvariableop_resource*
_output_shapes

:*
dtype0O
Neg_1NegReadVariableOp_1:value:0*
T0*
_output_shapes

:M
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*
_output_shapes

:L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?R
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*
_output_shapes

:R
StopGradient_1StopGradient	mul_3:z:0*
T0*
_output_shapes

:h
ReadVariableOp_2ReadVariableOpreadvariableop_resource*
_output_shapes

:*
dtype0j
add_3AddV2ReadVariableOp_2:value:0StopGradient_1:output:0*
T0*
_output_shapes

:U
MatMulMatMulinputs	add_3:z:0*
T0*'
_output_shapes
:���������_
IdentityIdentityMatMul:product:0^NoOp*
T0*'
_output_shapes
:���������}
NoOpNoOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:���������: 2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_2:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�!
p
T__inference_cicada_v1_activation_2_layer_call_and_return_conditional_losses_18954377

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
 *  �AG
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
:���������F
ReluReluinputs*
T0*'
_output_shapes
:���������S
ones_like/ShapeShapeinputs*
T0*
_output_shapes
::��T
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?w
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:���������D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
mulMulones_like:output:0	sub_2:z:0*
T0*'
_output_shapes
:���������r
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*'
_output_shapes
:���������P
mul_1MulinputsCast:y:0*
T0*'
_output_shapes
:���������[
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*'
_output_shapes
:���������I
NegNegtruediv:z:0*
T0*'
_output_shapes
:���������M
RoundRoundtruediv:z:0*
T0*'
_output_shapes
:���������R
addAddV2Neg:y:0	Round:y:0*
T0*'
_output_shapes
:���������W
StopGradientStopGradientadd:z:0*
T0*'
_output_shapes
:���������d
add_1AddV2truediv:z:0StopGradient:output:0*
T0*'
_output_shapes
:���������[
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*'
_output_shapes
:���������P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: l
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*'
_output_shapes
:���������T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*'
_output_shapes
:���������]
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*'
_output_shapes
:���������Q
Neg_1NegSelectV2:output:0*
T0*'
_output_shapes
:���������V
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*'
_output_shapes
:���������L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?[
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*'
_output_shapes
:���������[
StopGradient_1StopGradient	mul_3:z:0*
T0*'
_output_shapes
:���������l
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*'
_output_shapes
:���������Q
IdentityIdentity	add_3:z:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
U
9__inference_cicada_v1_activation_2_layer_call_fn_18954328

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *]
fXRV
T__inference_cicada_v1_activation_2_layer_call_and_return_conditional_losses_18953373`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
4__inference_cicada_v1_dense_2_layer_call_fn_18954287

inputs
unknown:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_cicada_v1_dense_2_layer_call_and_return_conditional_losses_18953320o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:���������: 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
H__inference_sequential_layer_call_and_return_conditional_losses_18953557
cicada_v1_input+
cicada_v1_layernorm_18953540:	�+
cicada_v1_layernorm_18953542:	�-
cicada_v1_dense_1_18953545:	�(
cicada_v1_dense_1_18953547:,
cicada_v1_dense_2_18953552:
identity��)cicada_v1_dense_1/StatefulPartitionedCall�)cicada_v1_dense_2/StatefulPartitionedCall�(cicada_v1_drop_1/StatefulPartitionedCall�+cicada_v1_layernorm/StatefulPartitionedCall�
+cicada_v1_layernorm/StatefulPartitionedCallStatefulPartitionedCallcicada_v1_inputcicada_v1_layernorm_18953540cicada_v1_layernorm_18953542*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *Z
fURS
Q__inference_cicada_v1_layernorm_layer_call_and_return_conditional_losses_18953146�
)cicada_v1_dense_1/StatefulPartitionedCallStatefulPartitionedCall4cicada_v1_layernorm/StatefulPartitionedCall:output:0cicada_v1_dense_1_18953545cicada_v1_dense_1_18953547*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_cicada_v1_dense_1_layer_call_and_return_conditional_losses_18953220�
&cicada_v1_activation_1/PartitionedCallPartitionedCall2cicada_v1_dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *]
fXRV
T__inference_cicada_v1_activation_1_layer_call_and_return_conditional_losses_18953275�
(cicada_v1_drop_1/StatefulPartitionedCallStatefulPartitionedCall/cicada_v1_activation_1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *W
fRRP
N__inference_cicada_v1_drop_1_layer_call_and_return_conditional_losses_18953423�
)cicada_v1_dense_2/StatefulPartitionedCallStatefulPartitionedCall1cicada_v1_drop_1/StatefulPartitionedCall:output:0cicada_v1_dense_2_18953552*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *X
fSRQ
O__inference_cicada_v1_dense_2_layer_call_and_return_conditional_losses_18953320�
&cicada_v1_activation_2/PartitionedCallPartitionedCall2cicada_v1_dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *]
fXRV
T__inference_cicada_v1_activation_2_layer_call_and_return_conditional_losses_18953373~
IdentityIdentity/cicada_v1_activation_2/PartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp*^cicada_v1_dense_1/StatefulPartitionedCall*^cicada_v1_dense_2/StatefulPartitionedCall)^cicada_v1_drop_1/StatefulPartitionedCall,^cicada_v1_layernorm/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:����������: : : : : 2V
)cicada_v1_dense_1/StatefulPartitionedCall)cicada_v1_dense_1/StatefulPartitionedCall2V
)cicada_v1_dense_2/StatefulPartitionedCall)cicada_v1_dense_2/StatefulPartitionedCall2T
(cicada_v1_drop_1/StatefulPartitionedCall(cicada_v1_drop_1/StatefulPartitionedCall2Z
+cicada_v1_layernorm/StatefulPartitionedCall+cicada_v1_layernorm/StatefulPartitionedCall:Y U
(
_output_shapes
:����������
)
_user_specified_namecicada_v1_input
�
O
3__inference_cicada_v1_drop_1_layer_call_fn_18954258

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *W
fRRP
N__inference_cicada_v1_drop_1_layer_call_and_return_conditional_losses_18953282`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�2
�
O__inference_cicada_v1_dense_1_layer_call_and_return_conditional_losses_18954199

inputs*
readvariableop_resource:	�'
readvariableop_3_resource:
identity��ReadVariableOp�ReadVariableOp_1�ReadVariableOp_2�ReadVariableOp_3�ReadVariableOp_4�ReadVariableOp_5G
Pow/xConst*
_output_shapes
: *
dtype0*
value	B :G
Pow/yConst*
_output_shapes
: *
dtype0*
value	B :K
PowPowPow/x:output:0Pow/y:output:0*
T0*
_output_shapes
: E
CastCastPow:z:0*

DstT0*

SrcT0*
_output_shapes
: g
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:	�*
dtype0J
mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   C\
mulMulReadVariableOp:value:0mul/y:output:0*
T0*
_output_shapes
:	�O
truedivRealDivmul:z:0Cast:y:0*
T0*
_output_shapes
:	�A
NegNegtruediv:z:0*
T0*
_output_shapes
:	�E
RoundRoundtruediv:z:0*
T0*
_output_shapes
:	�J
addAddV2Neg:y:0	Round:y:0*
T0*
_output_shapes
:	�O
StopGradientStopGradientadd:z:0*
T0*
_output_shapes
:	�\
add_1AddV2truediv:z:0StopGradient:output:0*
T0*
_output_shapes
:	�\
clip_by_value/Minimum/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �Bw
clip_by_value/MinimumMinimum	add_1:z:0 clip_by_value/Minimum/y:output:0*
T0*
_output_shapes
:	�T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ��w
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*
_output_shapes
:	�S
mul_1MulCast:y:0clip_by_value:z:0*
T0*
_output_shapes
:	�P
truediv_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   C_
	truediv_1RealDiv	mul_1:z:0truediv_1/y:output:0*
T0*
_output_shapes
:	�L
mul_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?W
mul_2Mulmul_2/x:output:0truediv_1:z:0*
T0*
_output_shapes
:	�i
ReadVariableOp_1ReadVariableOpreadvariableop_resource*
_output_shapes
:	�*
dtype0P
Neg_1NegReadVariableOp_1:value:0*
T0*
_output_shapes
:	�N
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*
_output_shapes
:	�L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?S
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*
_output_shapes
:	�S
StopGradient_1StopGradient	mul_3:z:0*
T0*
_output_shapes
:	�i
ReadVariableOp_2ReadVariableOpreadvariableop_resource*
_output_shapes
:	�*
dtype0k
add_3AddV2ReadVariableOp_2:value:0StopGradient_1:output:0*
T0*
_output_shapes
:	�U
MatMulMatMulinputs	add_3:z:0*
T0*'
_output_shapes
:���������I
Pow_1/xConst*
_output_shapes
: *
dtype0*
value	B :I
Pow_1/yConst*
_output_shapes
: *
dtype0*
value	B :Q
Pow_1PowPow_1/x:output:0Pow_1/y:output:0*
T0*
_output_shapes
: I
Cast_1Cast	Pow_1:z:0*

DstT0*

SrcT0*
_output_shapes
: f
ReadVariableOp_3ReadVariableOpreadvariableop_3_resource*
_output_shapes
:*
dtype0L
mul_4/yConst*
_output_shapes
: *
dtype0*
valueB
 *   C]
mul_4MulReadVariableOp_3:value:0mul_4/y:output:0*
T0*
_output_shapes
:P
	truediv_2RealDiv	mul_4:z:0
Cast_1:y:0*
T0*
_output_shapes
:@
Neg_2Negtruediv_2:z:0*
T0*
_output_shapes
:D
Round_1Roundtruediv_2:z:0*
T0*
_output_shapes
:K
add_4AddV2	Neg_2:y:0Round_1:y:0*
T0*
_output_shapes
:N
StopGradient_2StopGradient	add_4:z:0*
T0*
_output_shapes
:[
add_5AddV2truediv_2:z:0StopGradient_2:output:0*
T0*
_output_shapes
:^
clip_by_value_1/Minimum/yConst*
_output_shapes
: *
dtype0*
valueB
 *  �Bv
clip_by_value_1/MinimumMinimum	add_5:z:0"clip_by_value_1/Minimum/y:output:0*
T0*
_output_shapes
:V
clip_by_value_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ��x
clip_by_value_1Maximumclip_by_value_1/Minimum:z:0clip_by_value_1/y:output:0*
T0*
_output_shapes
:R
mul_5Mul
Cast_1:y:0clip_by_value_1:z:0*
T0*
_output_shapes
:P
truediv_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *   CZ
	truediv_3RealDiv	mul_5:z:0truediv_3/y:output:0*
T0*
_output_shapes
:L
mul_6/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?R
mul_6Mulmul_6/x:output:0truediv_3:z:0*
T0*
_output_shapes
:f
ReadVariableOp_4ReadVariableOpreadvariableop_3_resource*
_output_shapes
:*
dtype0K
Neg_3NegReadVariableOp_4:value:0*
T0*
_output_shapes
:I
add_6AddV2	Neg_3:y:0	mul_6:z:0*
T0*
_output_shapes
:L
mul_7/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?N
mul_7Mulmul_7/x:output:0	add_6:z:0*
T0*
_output_shapes
:N
StopGradient_3StopGradient	mul_7:z:0*
T0*
_output_shapes
:f
ReadVariableOp_5ReadVariableOpreadvariableop_3_resource*
_output_shapes
:*
dtype0f
add_7AddV2ReadVariableOp_5:value:0StopGradient_3:output:0*
T0*
_output_shapes
:a
BiasAddBiasAddMatMul:product:0	add_7:z:0*
T0*'
_output_shapes
:���������_
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp^ReadVariableOp^ReadVariableOp_1^ReadVariableOp_2^ReadVariableOp_3^ReadVariableOp_4^ReadVariableOp_5*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12$
ReadVariableOp_2ReadVariableOp_22$
ReadVariableOp_3ReadVariableOp_32$
ReadVariableOp_4ReadVariableOp_42$
ReadVariableOp_5ReadVariableOp_5:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
l
3__inference_cicada_v1_drop_1_layer_call_fn_18954263

inputs
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *W
fRRP
N__inference_cicada_v1_drop_1_layer_call_and_return_conditional_losses_18953423o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�!
p
T__inference_cicada_v1_activation_1_layer_call_and_return_conditional_losses_18954253

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
:���������F
ReluReluinputs*
T0*'
_output_shapes
:���������S
ones_like/ShapeShapeinputs*
T0*
_output_shapes
::��T
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?w
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:���������D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
mulMulones_like:output:0	sub_2:z:0*
T0*'
_output_shapes
:���������r
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*'
_output_shapes
:���������P
mul_1MulinputsCast:y:0*
T0*'
_output_shapes
:���������[
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*'
_output_shapes
:���������I
NegNegtruediv:z:0*
T0*'
_output_shapes
:���������M
RoundRoundtruediv:z:0*
T0*'
_output_shapes
:���������R
addAddV2Neg:y:0	Round:y:0*
T0*'
_output_shapes
:���������W
StopGradientStopGradientadd:z:0*
T0*'
_output_shapes
:���������d
add_1AddV2truediv:z:0StopGradient:output:0*
T0*'
_output_shapes
:���������[
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*'
_output_shapes
:���������P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: l
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*'
_output_shapes
:���������T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*'
_output_shapes
:���������]
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*'
_output_shapes
:���������Q
Neg_1NegSelectV2:output:0*
T0*'
_output_shapes
:���������V
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*'
_output_shapes
:���������L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?[
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*'
_output_shapes
:���������[
StopGradient_1StopGradient	mul_3:z:0*
T0*'
_output_shapes
:���������l
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*'
_output_shapes
:���������Q
IdentityIdentity	add_3:z:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
� 
�
Q__inference_cicada_v1_layernorm_layer_call_and_return_conditional_losses_18954122

inputs,
mul_2_readvariableop_resource:	�*
add_readvariableop_resource:	�
identity��add/ReadVariableOp�mul_2/ReadVariableOpI
ShapeShapeinputs*
T0*
_output_shapes
::��]
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
valueB:�
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
value	B :�
Reshape/shapePackReshape/shape/0:output:0mul:z:0	mul_1:z:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:m
ReshapeReshapeinputsReshape/shape:output:0*
T0*0
_output_shapes
:����������J
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
 *  �?e
onesFillones/packed:output:0ones/Const:output:0*
T0*#
_output_shapes
:���������K
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
:���������H
ConstConst*
_output_shapes
: *
dtype0*
valueB J
Const_1Const*
_output_shapes
: *
dtype0*
valueB �
FusedBatchNormV3FusedBatchNormV3Reshape:output:0ones:output:0zeros:output:0Const:output:0Const_1:output:0*
T0*
U0*p
_output_shapes^
\:����������:���������:���������:���������:���������:*
data_formatNCHW*
epsilon%o�:m
	Reshape_1ReshapeFusedBatchNormV3:y:0Shape:output:0*
T0*(
_output_shapes
:����������o
mul_2/ReadVariableOpReadVariableOpmul_2_readvariableop_resource*
_output_shapes	
:�*
dtype0q
mul_2MulReshape_1:output:0mul_2/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������k
add/ReadVariableOpReadVariableOpadd_readvariableop_resource*
_output_shapes	
:�*
dtype0f
addAddV2	mul_2:z:0add/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������W
IdentityIdentityadd:z:0^NoOp*
T0*(
_output_shapes
:����������r
NoOpNoOp^add/ReadVariableOp^mul_2/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 2(
add/ReadVariableOpadd/ReadVariableOp2,
mul_2/ReadVariableOpmul_2/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
-__inference_sequential_layer_call_fn_18953606

inputs
unknown:	�
	unknown_0:	�
	unknown_1:	�
	unknown_2:
	unknown_3:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8� *Q
fLRJ
H__inference_sequential_layer_call_and_return_conditional_losses_18953489o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:����������: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�!
p
T__inference_cicada_v1_activation_2_layer_call_and_return_conditional_losses_18953373

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
 *  �AG
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
:���������F
ReluReluinputs*
T0*'
_output_shapes
:���������S
ones_like/ShapeShapeinputs*
T0*
_output_shapes
::��T
ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  �?w
	ones_likeFillones_like/Shape:output:0ones_like/Const:output:0*
T0*'
_output_shapes
:���������D
sub_2Sub
Cast_1:y:0	Pow_2:z:0*
T0*
_output_shapes
: [
mulMulones_like:output:0	sub_2:z:0*
T0*'
_output_shapes
:���������r
SelectV2SelectV2LessEqual:z:0Relu:activations:0mul:z:0*
T0*'
_output_shapes
:���������P
mul_1MulinputsCast:y:0*
T0*'
_output_shapes
:���������[
truedivRealDiv	mul_1:z:0
Cast_1:y:0*
T0*'
_output_shapes
:���������I
NegNegtruediv:z:0*
T0*'
_output_shapes
:���������M
RoundRoundtruediv:z:0*
T0*'
_output_shapes
:���������R
addAddV2Neg:y:0	Round:y:0*
T0*'
_output_shapes
:���������W
StopGradientStopGradientadd:z:0*
T0*'
_output_shapes
:���������d
add_1AddV2truediv:z:0StopGradient:output:0*
T0*'
_output_shapes
:���������[
	truediv_1RealDiv	add_1:z:0Cast:y:0*
T0*'
_output_shapes
:���������P
truediv_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?U
	truediv_2RealDivtruediv_2/x:output:0Cast:y:0*
T0*
_output_shapes
: L
sub_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?N
sub_3Subsub_3/x:output:0truediv_2:z:0*
T0*
_output_shapes
: l
clip_by_value/MinimumMinimumtruediv_1:z:0	sub_3:z:0*
T0*'
_output_shapes
:���������T
clip_by_value/yConst*
_output_shapes
: *
dtype0*
valueB
 *    
clip_by_valueMaximumclip_by_value/Minimum:z:0clip_by_value/y:output:0*
T0*'
_output_shapes
:���������]
mul_2Mul
Cast_1:y:0clip_by_value:z:0*
T0*'
_output_shapes
:���������Q
Neg_1NegSelectV2:output:0*
T0*'
_output_shapes
:���������V
add_2AddV2	Neg_1:y:0	mul_2:z:0*
T0*'
_output_shapes
:���������L
mul_3/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?[
mul_3Mulmul_3/x:output:0	add_2:z:0*
T0*'
_output_shapes
:���������[
StopGradient_1StopGradient	mul_3:z:0*
T0*'
_output_shapes
:���������l
add_3AddV2SelectV2:output:0StopGradient_1:output:0*
T0*'
_output_shapes
:���������Q
IdentityIdentity	add_3:z:0*
T0*'
_output_shapes
:���������"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
-__inference_sequential_layer_call_fn_18953389
cicada_v1_input
unknown:	�
	unknown_0:	�
	unknown_1:	�
	unknown_2:
	unknown_3:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallcicada_v1_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8� *Q
fLRJ
H__inference_sequential_layer_call_and_return_conditional_losses_18953376o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:����������: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Y U
(
_output_shapes
:����������
)
_user_specified_namecicada_v1_input"�
L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*�
serving_default�
L
cicada_v1_input9
!serving_default_cicada_v1_input:0����������J
cicada_v1_activation_20
StatefulPartitionedCall:0���������tensorflow/serving/predict:��
�
layer_with_weights-0
layer-0
layer_with_weights-1
layer-1
layer-2
layer-3
layer_with_weights-2
layer-4
layer-5
	variables
trainable_variables
	regularization_losses

	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures"
_tf_keras_sequential
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
axis
	gamma
beta"
_tf_keras_layer
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
kernel_quantizer
 bias_quantizer
kernel_quantizer_internal
 bias_quantizer_internal
!
quantizers

"kernel
#bias"
_tf_keras_layer
�
$	variables
%trainable_variables
&regularization_losses
'	keras_api
(__call__
*)&call_and_return_all_conditional_losses
*	quantizer"
_tf_keras_layer
�
+	variables
,trainable_variables
-regularization_losses
.	keras_api
/__call__
*0&call_and_return_all_conditional_losses
1_random_generator"
_tf_keras_layer
�
2	variables
3trainable_variables
4regularization_losses
5	keras_api
6__call__
*7&call_and_return_all_conditional_losses
8kernel_quantizer
8kernel_quantizer_internal
9
quantizers

:kernel"
_tf_keras_layer
�
;	variables
<trainable_variables
=regularization_losses
>	keras_api
?__call__
*@&call_and_return_all_conditional_losses
A	quantizer"
_tf_keras_layer
C
0
1
"2
#3
:4"
trackable_list_wrapper
C
0
1
"2
#3
:4"
trackable_list_wrapper
 "
trackable_list_wrapper
�
Bnon_trainable_variables

Clayers
Dmetrics
Elayer_regularization_losses
Flayer_metrics
	variables
trainable_variables
	regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
�
Gtrace_0
Htrace_1
Itrace_2
Jtrace_32�
-__inference_sequential_layer_call_fn_18953389
-__inference_sequential_layer_call_fn_18953591
-__inference_sequential_layer_call_fn_18953606
-__inference_sequential_layer_call_fn_18953517�
���
FullArgSpec)
args!�
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
annotations� *
 zGtrace_0zHtrace_1zItrace_2zJtrace_3
�
Ktrace_0
Ltrace_1
Mtrace_2
Ntrace_32�
H__inference_sequential_layer_call_and_return_conditional_losses_18953835
H__inference_sequential_layer_call_and_return_conditional_losses_18954071
H__inference_sequential_layer_call_and_return_conditional_losses_18953537
H__inference_sequential_layer_call_and_return_conditional_losses_18953557�
���
FullArgSpec)
args!�
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
annotations� *
 zKtrace_0zLtrace_1zMtrace_2zNtrace_3
�B�
#__inference__wrapped_model_18953097cicada_v1_input"�
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
�
O
_variables
P_iterations
Q_learning_rate
R_index_dict
S
_momentums
T_velocities
U_update_step_xla"
experimentalOptimizer
,
Vserving_default"
signature_map
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
Wnon_trainable_variables

Xlayers
Ymetrics
Zlayer_regularization_losses
[layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
�
\trace_02�
6__inference_cicada_v1_layernorm_layer_call_fn_18954080�
���
FullArgSpec
args�

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
annotations� *
 z\trace_0
�
]trace_02�
Q__inference_cicada_v1_layernorm_layer_call_and_return_conditional_losses_18954122�
���
FullArgSpec
args�

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
annotations� *
 z]trace_0
 "
trackable_list_wrapper
(:&�2cicada_v1_layernorm/gamma
':%�2cicada_v1_layernorm/beta
.
"0
#1"
trackable_list_wrapper
.
"0
#1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
^non_trainable_variables

_layers
`metrics
alayer_regularization_losses
blayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
�
ctrace_02�
4__inference_cicada_v1_dense_1_layer_call_fn_18954131�
���
FullArgSpec
args�

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
annotations� *
 zctrace_0
�
dtrace_02�
O__inference_cicada_v1_dense_1_layer_call_and_return_conditional_losses_18954199�
���
FullArgSpec
args�

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
annotations� *
 zdtrace_0
"
_generic_user_object
"
_generic_user_object
.
0
 1"
trackable_list_wrapper
+:)	�2cicada_v1_dense_1/kernel
$:"2cicada_v1_dense_1/bias
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
enon_trainable_variables

flayers
gmetrics
hlayer_regularization_losses
ilayer_metrics
$	variables
%trainable_variables
&regularization_losses
(__call__
*)&call_and_return_all_conditional_losses
&)"call_and_return_conditional_losses"
_generic_user_object
�
jtrace_02�
9__inference_cicada_v1_activation_1_layer_call_fn_18954204�
���
FullArgSpec
args�

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
annotations� *
 zjtrace_0
�
ktrace_02�
T__inference_cicada_v1_activation_1_layer_call_and_return_conditional_losses_18954253�
���
FullArgSpec
args�

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
annotations� *
 zktrace_0
"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
lnon_trainable_variables

mlayers
nmetrics
olayer_regularization_losses
player_metrics
+	variables
,trainable_variables
-regularization_losses
/__call__
*0&call_and_return_all_conditional_losses
&0"call_and_return_conditional_losses"
_generic_user_object
�
qtrace_0
rtrace_12�
3__inference_cicada_v1_drop_1_layer_call_fn_18954258
3__inference_cicada_v1_drop_1_layer_call_fn_18954263�
���
FullArgSpec!
args�
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 zqtrace_0zrtrace_1
�
strace_0
ttrace_12�
N__inference_cicada_v1_drop_1_layer_call_and_return_conditional_losses_18954268
N__inference_cicada_v1_drop_1_layer_call_and_return_conditional_losses_18954280�
���
FullArgSpec!
args�
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 zstrace_0zttrace_1
"
_generic_user_object
'
:0"
trackable_list_wrapper
'
:0"
trackable_list_wrapper
 "
trackable_list_wrapper
�
unon_trainable_variables

vlayers
wmetrics
xlayer_regularization_losses
ylayer_metrics
2	variables
3trainable_variables
4regularization_losses
6__call__
*7&call_and_return_all_conditional_losses
&7"call_and_return_conditional_losses"
_generic_user_object
�
ztrace_02�
4__inference_cicada_v1_dense_2_layer_call_fn_18954287�
���
FullArgSpec
args�

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
annotations� *
 zztrace_0
�
{trace_02�
O__inference_cicada_v1_dense_2_layer_call_and_return_conditional_losses_18954323�
���
FullArgSpec
args�

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
annotations� *
 z{trace_0
"
_generic_user_object
'
80"
trackable_list_wrapper
*:(2cicada_v1_dense_2/kernel
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
|non_trainable_variables

}layers
~metrics
layer_regularization_losses
�layer_metrics
;	variables
<trainable_variables
=regularization_losses
?__call__
*@&call_and_return_all_conditional_losses
&@"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
9__inference_cicada_v1_activation_2_layer_call_fn_18954328�
���
FullArgSpec
args�

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
annotations� *
 z�trace_0
�
�trace_02�
T__inference_cicada_v1_activation_2_layer_call_and_return_conditional_losses_18954377�
���
FullArgSpec
args�

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
annotations� *
 z�trace_0
"
_generic_user_object
 "
trackable_list_wrapper
J
0
1
2
3
4
5"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
-__inference_sequential_layer_call_fn_18953389cicada_v1_input"�
���
FullArgSpec)
args!�
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
annotations� *
 
�B�
-__inference_sequential_layer_call_fn_18953591inputs"�
���
FullArgSpec)
args!�
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
annotations� *
 
�B�
-__inference_sequential_layer_call_fn_18953606inputs"�
���
FullArgSpec)
args!�
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
annotations� *
 
�B�
-__inference_sequential_layer_call_fn_18953517cicada_v1_input"�
���
FullArgSpec)
args!�
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
annotations� *
 
�B�
H__inference_sequential_layer_call_and_return_conditional_losses_18953835inputs"�
���
FullArgSpec)
args!�
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
annotations� *
 
�B�
H__inference_sequential_layer_call_and_return_conditional_losses_18954071inputs"�
���
FullArgSpec)
args!�
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
annotations� *
 
�B�
H__inference_sequential_layer_call_and_return_conditional_losses_18953537cicada_v1_input"�
���
FullArgSpec)
args!�
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
annotations� *
 
�B�
H__inference_sequential_layer_call_and_return_conditional_losses_18953557cicada_v1_input"�
���
FullArgSpec)
args!�
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
annotations� *
 
x
P0
�1
�2
�3
�4
�5
�6
�7
�8
�9
�10"
trackable_list_wrapper
:	 2	iteration
: 2learning_rate
 "
trackable_dict_wrapper
H
�0
�1
�2
�3
�4"
trackable_list_wrapper
H
�0
�1
�2
�3
�4"
trackable_list_wrapper
�2��
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 0
�B�
&__inference_signature_wrapper_18953576cicada_v1_input"�
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
6__inference_cicada_v1_layernorm_layer_call_fn_18954080inputs"�
���
FullArgSpec
args�

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
annotations� *
 
�B�
Q__inference_cicada_v1_layernorm_layer_call_and_return_conditional_losses_18954122inputs"�
���
FullArgSpec
args�

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
4__inference_cicada_v1_dense_1_layer_call_fn_18954131inputs"�
���
FullArgSpec
args�

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
annotations� *
 
�B�
O__inference_cicada_v1_dense_1_layer_call_and_return_conditional_losses_18954199inputs"�
���
FullArgSpec
args�

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
9__inference_cicada_v1_activation_1_layer_call_fn_18954204inputs"�
���
FullArgSpec
args�

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
annotations� *
 
�B�
T__inference_cicada_v1_activation_1_layer_call_and_return_conditional_losses_18954253inputs"�
���
FullArgSpec
args�

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
3__inference_cicada_v1_drop_1_layer_call_fn_18954258inputs"�
���
FullArgSpec!
args�
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
3__inference_cicada_v1_drop_1_layer_call_fn_18954263inputs"�
���
FullArgSpec!
args�
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
N__inference_cicada_v1_drop_1_layer_call_and_return_conditional_losses_18954268inputs"�
���
FullArgSpec!
args�
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
N__inference_cicada_v1_drop_1_layer_call_and_return_conditional_losses_18954280inputs"�
���
FullArgSpec!
args�
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

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
4__inference_cicada_v1_dense_2_layer_call_fn_18954287inputs"�
���
FullArgSpec
args�

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
annotations� *
 
�B�
O__inference_cicada_v1_dense_2_layer_call_and_return_conditional_losses_18954323inputs"�
���
FullArgSpec
args�

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
9__inference_cicada_v1_activation_2_layer_call_fn_18954328inputs"�
���
FullArgSpec
args�

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
annotations� *
 
�B�
T__inference_cicada_v1_activation_2_layer_call_and_return_conditional_losses_18954377inputs"�
���
FullArgSpec
args�

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
annotations� *
 
R
�	variables
�	keras_api

�total

�count"
_tf_keras_metric
c
�	variables
�	keras_api

�total

�count
�
_fn_kwargs"
_tf_keras_metric
-:+�2 Adam/m/cicada_v1_layernorm/gamma
-:+�2 Adam/v/cicada_v1_layernorm/gamma
,:*�2Adam/m/cicada_v1_layernorm/beta
,:*�2Adam/v/cicada_v1_layernorm/beta
0:.	�2Adam/m/cicada_v1_dense_1/kernel
0:.	�2Adam/v/cicada_v1_dense_1/kernel
):'2Adam/m/cicada_v1_dense_1/bias
):'2Adam/v/cicada_v1_dense_1/bias
/:-2Adam/m/cicada_v1_dense_2/kernel
/:-2Adam/v/cicada_v1_dense_2/kernel
0
�0
�1"
trackable_list_wrapper
.
�	variables"
_generic_user_object
:  (2total
:  (2count
0
�0
�1"
trackable_list_wrapper
.
�	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper�
#__inference__wrapped_model_18953097�"#:9�6
/�,
*�'
cicada_v1_input����������
� "O�L
J
cicada_v1_activation_20�-
cicada_v1_activation_2����������
T__inference_cicada_v1_activation_1_layer_call_and_return_conditional_losses_18954253_/�,
%�"
 �
inputs���������
� ",�)
"�
tensor_0���������
� �
9__inference_cicada_v1_activation_1_layer_call_fn_18954204T/�,
%�"
 �
inputs���������
� "!�
unknown����������
T__inference_cicada_v1_activation_2_layer_call_and_return_conditional_losses_18954377_/�,
%�"
 �
inputs���������
� ",�)
"�
tensor_0���������
� �
9__inference_cicada_v1_activation_2_layer_call_fn_18954328T/�,
%�"
 �
inputs���������
� "!�
unknown����������
O__inference_cicada_v1_dense_1_layer_call_and_return_conditional_losses_18954199d"#0�-
&�#
!�
inputs����������
� ",�)
"�
tensor_0���������
� �
4__inference_cicada_v1_dense_1_layer_call_fn_18954131Y"#0�-
&�#
!�
inputs����������
� "!�
unknown����������
O__inference_cicada_v1_dense_2_layer_call_and_return_conditional_losses_18954323b:/�,
%�"
 �
inputs���������
� ",�)
"�
tensor_0���������
� �
4__inference_cicada_v1_dense_2_layer_call_fn_18954287W:/�,
%�"
 �
inputs���������
� "!�
unknown����������
N__inference_cicada_v1_drop_1_layer_call_and_return_conditional_losses_18954268c3�0
)�&
 �
inputs���������
p 
� ",�)
"�
tensor_0���������
� �
N__inference_cicada_v1_drop_1_layer_call_and_return_conditional_losses_18954280c3�0
)�&
 �
inputs���������
p
� ",�)
"�
tensor_0���������
� �
3__inference_cicada_v1_drop_1_layer_call_fn_18954258X3�0
)�&
 �
inputs���������
p 
� "!�
unknown����������
3__inference_cicada_v1_drop_1_layer_call_fn_18954263X3�0
)�&
 �
inputs���������
p
� "!�
unknown����������
Q__inference_cicada_v1_layernorm_layer_call_and_return_conditional_losses_18954122e0�-
&�#
!�
inputs����������
� "-�*
#� 
tensor_0����������
� �
6__inference_cicada_v1_layernorm_layer_call_fn_18954080Z0�-
&�#
!�
inputs����������
� ""�
unknown�����������
H__inference_sequential_layer_call_and_return_conditional_losses_18953537x"#:A�>
7�4
*�'
cicada_v1_input����������
p 

 
� ",�)
"�
tensor_0���������
� �
H__inference_sequential_layer_call_and_return_conditional_losses_18953557x"#:A�>
7�4
*�'
cicada_v1_input����������
p

 
� ",�)
"�
tensor_0���������
� �
H__inference_sequential_layer_call_and_return_conditional_losses_18953835o"#:8�5
.�+
!�
inputs����������
p 

 
� ",�)
"�
tensor_0���������
� �
H__inference_sequential_layer_call_and_return_conditional_losses_18954071o"#:8�5
.�+
!�
inputs����������
p

 
� ",�)
"�
tensor_0���������
� �
-__inference_sequential_layer_call_fn_18953389m"#:A�>
7�4
*�'
cicada_v1_input����������
p 

 
� "!�
unknown����������
-__inference_sequential_layer_call_fn_18953517m"#:A�>
7�4
*�'
cicada_v1_input����������
p

 
� "!�
unknown����������
-__inference_sequential_layer_call_fn_18953591d"#:8�5
.�+
!�
inputs����������
p 

 
� "!�
unknown����������
-__inference_sequential_layer_call_fn_18953606d"#:8�5
.�+
!�
inputs����������
p

 
� "!�
unknown����������
&__inference_signature_wrapper_18953576�"#:L�I
� 
B�?
=
cicada_v1_input*�'
cicada_v1_input����������"O�L
J
cicada_v1_activation_20�-
cicada_v1_activation_2���������