import clsx from 'clsx'
import Image from 'next/image'
import React from 'react'

interface Props {
  className?: string
  loading?: 'lazy' | 'eager'
  priority?: boolean
}

export const Logo = (props: Props) => {
  const { loading, priority, className } = props

  return (
    <Image
      alt="911 Construction & Electric Inc."
      className={clsx('h-[40px] w-auto', className)}
      height={91}
      loading={priority ? undefined : loading || 'lazy'}
      priority={priority}
      src="/logo.png"
      width={193}
    />
  )
}
