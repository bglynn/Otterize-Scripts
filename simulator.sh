#!/bin/bash

# https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_testing-policies.html

while getopts p:a:r: flag
do
    case "${flag}" in
        p) POLICY=${OPTARG};;
        a) ACTIONS=${OPTARG};;
		r) ARNS=${OPTARG};;
    esac
done

CUSTOM_POLICY=$(cat $POLICY)

echo Determine if $ACTIONS on $ARNS is possible with a custom policy $POLICY
#echo aws iam simulate-custom-policy --policy-input-list "$CUSTOM_POLICY" --action-names $ACTIONS --resource-arns $ARNS
aws iam simulate-custom-policy --policy-input-list "$CUSTOM_POLICY" --action-names $ACTIONS --resource-arns $ARNS