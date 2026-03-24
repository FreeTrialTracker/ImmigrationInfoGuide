import { getVerificationBadgeText, getVerificationBadgeColor } from '@/lib/immigrationCostUtils';
import { Shield, CircleAlert as AlertCircle, CircleCheck as CheckCircle, Clock } from 'lucide-react';

interface ReviewStatusBadgeProps {
  verificationStatus: string;
  size?: 'sm' | 'md' | 'lg';
  showIcon?: boolean;
}

export function ReviewStatusBadge({
  verificationStatus,
  size = 'md',
  showIcon = true
}: ReviewStatusBadgeProps) {
  const text = getVerificationBadgeText(verificationStatus);
  const colorClass = getVerificationBadgeColor(verificationStatus);

  const sizeClasses = {
    sm: 'text-xs px-2 py-0.5',
    md: 'text-sm px-3 py-1',
    lg: 'text-base px-4 py-1.5'
  };

  const iconSizes = {
    sm: 12,
    md: 14,
    lg: 16
  };

  const getIcon = () => {
    switch (verificationStatus) {
      case 'official':
        return <Shield size={iconSizes[size]} />;
      case 'editorial_reviewed':
        return <CheckCircle size={iconSizes[size]} />;
      case 'needs_review':
        return <AlertCircle size={iconSizes[size]} />;
      default:
        return <Clock size={iconSizes[size]} />;
    }
  };

  return (
    <span className={`inline-flex items-center gap-1.5 rounded-full border font-medium ${colorClass} ${sizeClasses[size]}`}>
      {showIcon && getIcon()}
      {text}
    </span>
  );
}
