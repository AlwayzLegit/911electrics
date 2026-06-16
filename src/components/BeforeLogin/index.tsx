import React from 'react'

/**
 * Branded intro shown above the admin login form. Styled by the
 * `.before-login` rules in (payload)/custom.scss.
 */
const BeforeLogin: React.FC = () => {
  return (
    <div className="before-login">
      <span className="before-login__logo">
        <svg fill="none" height="48" viewBox="0 0 100 100" width="48" xmlns="http://www.w3.org/2000/svg">
          <rect fill="#d01d24" height="100" rx="24" width="100" />
          <path d="M56 12 L26 56 L46 56 L40 88 L74 42 L52 42 Z" fill="#ffffff" />
        </svg>
      </span>
      <h1>911 Construction &amp; Electric</h1>
      <p>Site Manager — sign in to handle quote requests, edit pages, and publish posts.</p>
    </div>
  )
}

export default BeforeLogin
