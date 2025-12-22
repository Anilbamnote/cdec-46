eks cluster configure by terraform


1.resource : aws_eks_cluster

name : my-cluster
k8s cluster version:
cluster iam role: 
vpc:
subnet:

2. roles:
   cluster role: aws_eks_cluster_policy
   role tpes:
   pocly:
   role name
3. roles:
   nodegroup role: aws_eks_cluster_policy
   role tpes:
   pocly: conatiner_registry_readonly,ekc_cni,eks_workernod,eks networking,eks_clusterpolicy
   role name
4.nodegroup create:
nodegroup name:
ng_role:
roletype:
min,max.dis
instance tpes:
subects: